class Spaceship extends Mover{


  PImage ship;
  ArrayList<Bullet> bullets;

  Spaceship(PVector loc, int spaceshipNumber) {

      super(loc);  
    if (spaceshipNumber ==1) {
          this.ship = loadImage("ship1.png");

    }
    if (spaceshipNumber ==2) {
          this.ship = loadImage("ship2.png");

    }
    if (spaceshipNumber ==3) {
          this.ship = loadImage("ship3.png");

    }
  }


  void update(float dt, Fluid fluid) {
  }


  void shoot() {
  }

  void display() {
    
    image(ship, loc.x, loc.y,50, 75);

  }
}