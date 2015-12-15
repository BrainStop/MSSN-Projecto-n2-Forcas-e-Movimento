class EnemyShip
{
  PVector loc, vel, acc;
  float mass;
  PShape vehicleShape;
  float maxSpeed, maxForce;

  EnemyShip(PVector loc)
  {
    this.loc = loc.copy();
    vel = new PVector();
    acc = new PVector();
    mass = 1.;
    maxSpeed = 200;
    maxForce = 5000;
    setShape(15, color(0));
  }

  void setShape(float r, color c)
  {
    vehicleShape = createShape();
    vehicleShape.beginShape();
    vehicleShape.fill(c);
    vehicleShape.noStroke();
    vehicleShape.vertex(-r, r/2);
    vehicleShape.vertex(r, 0);
    vehicleShape.vertex(-r, -r/2);
    vehicleShape.endShape(CLOSE);
  }

  void applyForce(PVector f)
  {
    f.limit(maxForce);
    PVector a = PVector.div(f, mass);
    acc.add(a);
  }

  void move(float dt)
  {
    vel.add(acc.mult(dt));
    vel.limit(maxSpeed);
    loc.add(PVector.mult(vel, dt));
    acc.mult(0);
  }

  PVector seek(PVector target)
  {
    PVector vd = PVector.sub(target, loc);
    vd.normalize().mult(maxSpeed);
    return PVector.sub(vd, vel);
  }

  PVector arrive(PVector target)
  {
    PVector vd = PVector.sub(target, loc);
    float k = maxSpeed;
    float dist = vd.mag();
    if (dist < 200) k = map(dist,0,200,0,maxSpeed);
    vd.normalize().mult(k);
    return PVector.sub(vd, vel);
  }

  void display()
  {
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(vel.heading());
    shape(vehicleShape);
    popMatrix();
  }
}