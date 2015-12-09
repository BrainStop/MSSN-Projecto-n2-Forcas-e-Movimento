class Bullet extends Mover
{
  Bullet(PVector loc, PVector vel)
  {
    super(loc, vel, 1., color(0));
  }
  
  void run(float dt, Fluid fluid)
  {
    if (fluid.isInside(this)) {
      PVector f = fluid.dragForce(this);
      applyForce(f);
    }
    move(dt);
    display();
  }
  
  boolean isOut()
  {
    if (loc.x < 0 || loc.x > width || loc.y < 0 || loc.y > height) return true;
    return false;
  }
  
  boolean hit(Mover m)
  {
    float d = PVector.dist(loc, m.loc);
    if (d < 5) return true;
    return false;
  }
  
  void display()
  {
    fill(0);
    ellipse(loc.x,loc.y,5,5);
  }
}