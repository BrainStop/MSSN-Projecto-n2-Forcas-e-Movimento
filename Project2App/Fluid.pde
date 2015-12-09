class Fluid
{
  PVector loc;
  PVector dim;
  float viscosity;
  
  Fluid(PVector loc, PVector dim, float viscosity)
  {
    this.loc = loc.copy();
    this.dim = dim.copy();
    this.viscosity = viscosity;
  }
  
  PVector dragForce(Mover m)
  {
    PVector f = m.vel.copy();
    float speed = f.mag();
    return f.normalize().mult(-speed*speed*viscosity);
  }
  
  boolean isInside(Mover m)
  {
    if (m.loc.x > loc.x && m.loc.x < (loc.x + dim.x) && m.loc.y > loc.y && m.loc.y < (loc.y + dim.y)) return true;
    return false;
  }
  
  void move()
  {
    loc.x = mouseX;
    loc.y = mouseY;
  }
  
  void display()
  {
    fill(30,180,180,40);
    rect(loc.x, loc.y, dim.x, dim.y);
  }
  
}