class Particle extends Mover {
  private float lifespan;
  float lifeCountDown;

  Particle(PVector loc, color c, float lifespan) {
    super(loc, new PVector(5, 0), 10, c);
    this.lifespan = lifespan;
    this.lifeCountDown = lifespan;
  }

  boolean isDead() {
    if (lifeCountDown <= 0) {
      return true;
    }
    lifeCountDown -= 1;
    return false;
  }
  
  void move(float dt) {
    
  }
  
  void display() {
    
  }
  
}