class Mover
{
  PVector loc, vel, acc;
  color c;
  float mass;
  
  Mover(PVector loc, PVector vel, float mass, color c)
  {
    this.loc = loc.copy();
    this.vel = vel.copy();
    this.mass = mass;
    this.c = c;
    acc = new PVector();
  }
  
  void applyForce(PVector f)
  {
    acc.add(PVector.div(f,mass));
  }
  
  void move(float dt)
  {
    vel.add(PVector.mult(acc,dt));
    PVector vdt = PVector.mult(vel,dt);
    loc.add(vdt);
    acc.mult(0);
  }
  
  void display()
  {
    fill(c);
    float r = pow(mass,2/3.);
    ellipse(loc.x, loc.y, r, r);
  }
}