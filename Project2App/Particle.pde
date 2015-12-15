class Particle extends Mover
{
  float lifespan, lifeCountDown;
  
  Particle(PVector loc, color c, float lifespan)
  {
    super(loc, new PVector(random(-1,1), random(-1,1)),1.,c);
    this.lifespan = lifespan;
    this.lifeCountDown = lifespan;
    this.c = c;
  }
  
  boolean isDead()
  {
    if (lifeCountDown <= 0) return true;
    return false;
  }
  
  void move(float dt)
  {
    super.move(dt);
    lifeCountDown -= dt;
  }
  
  void display()
  {
    float alpha = map(lifeCountDown, 0, lifespan, 0, 255);
    fill(c, alpha);
    noStroke();
    ellipse(loc.x, loc.y, 16, 16);
  }
}