class Spaceship extends Mover {


  PImage ship;
  ArrayList<Bullet> bullets;
  PVector angle= new PVector(0,-30);


  Spaceship(PVector loc, int spaceshipNumber) {

    super(loc, new PVector(0, -5), 10, color(0, 0, 0));
    this.bullets = new ArrayList<Bullet>();
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


  void update(float dt, Fluid fluid)
  {
    if (keyPressed) {
      if (key == ' ') shoot();
      if (keyCode == UP) {

        this.applyForce(angle);

      }
      if (keyCode == DOWN) {
        this.applyForce(new PVector(-angle.x,-angle.y));

      }

      if (keyCode == LEFT) {
        angle = angle.rotate(-HALF_PI/18);

      }
      if (keyCode == RIGHT) {
                angle = angle.rotate(HALF_PI/18);

      }
    }
    move(dt);

    for (int i=bullets.size()-1; i>=0; i--) {
      Bullet b = bullets.get(i);
      if (b.isOut()) bullets.remove(i);
      else b.run(dt, fluid);
    }
  }


  void shoot()
  {
    Bullet b = new Bullet(loc, angle);
    PVector f = angle.copy();
    b.applyForce(f.normalize().mult(1000));
    bullets.add(b);
  }

  void display()
  {
    
    
    
      //rotate(PVector.angleBetween(angle,new PVector(0,-1))); 

    //image(ship, loc.x, loc.y, 50, 75);

    
    
    if(loc.x<0){
      loc.x = width;
    }
    
    if(loc.x>width){
      loc.x = 0;
    }
    
    if(loc.y<0){
      loc.y = height;
    }
    
    if(loc.y>height){
      loc.y = 0;
    }
    line(loc.x,loc.y, loc.x+angle.x,loc.y+angle.y);
    stroke(126);

  }
}