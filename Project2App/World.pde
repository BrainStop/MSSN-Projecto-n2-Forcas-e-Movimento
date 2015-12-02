class World {

  private Mover[] planets;
  private int nPlanets;
  private Star sun = new Star(new PVector(width/2,height/2),300000);
  private Spaceship spaceship ;
  int lastTime;
  Fluid fluid;


  World(int nPlanets, int spaceshipNumber ) {
    this.nPlanets = nPlanets;
    this.spaceship = new Spaceship(new PVector(width/2, height-150), spaceshipNumber);
  }

  void run() {

    sun.display();
    spaceship.display();
  }
}