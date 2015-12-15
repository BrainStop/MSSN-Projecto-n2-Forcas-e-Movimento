class World {

  Mover[] planets;
  EnemyShip[] enemies;
  int nPlanets;
  int nEnemies;
  Star sun = new Star(new PVector(width/2, height/2), 300000);
  Spaceship spaceship ;
  int lastTime;
  Fluid fluid;
  float speed = 5;




  World(int nPlanets, int spaceshipNumber ) {
    this.nPlanets = nPlanets;
    this.spaceship = new Spaceship(new PVector(width/2, height-150), spaceshipNumber);
    fluid = new Fluid(new PVector(100, 100), new PVector(400, 50), .04);


    planets = new Mover[nPlanets];
    for (int i=0; i<nPlanets; i++) {
      PVector loc = new PVector(random(0, width/2), random(0, height/4));
      PVector vel = new PVector(random(15, 30), 0);
      float mass = random(100, 200);
      planets[i] = new Mover(loc, vel, mass, color(random(255), random(255), random(255)));
    }
    
    enemies = new EnemyShip[nEnemies];
        for (int i=0; i<nEnemies; i++) {
          
          
          
        }

  }

  void run() {
    background(0);
    float dt = millis() - lastTime;
    lastTime = millis();
    sun.display();

    fluid.move();        
    fluid.display(); 

    for (Mover m : planets) {
      PVector f = sun.attractionForce(m);
      m.applyForce(f);
      if (fluid.isInside(m)) {
        f = fluid.dragForce(m);
        m.applyForce(f);
      }
      m.move(speed * dt/1000.);
      m.display();
    }

    for (int i=0; i<planets.length; i++) {
      Mover p = planets[i];
      for (Bullet b : spaceship.bullets) {
        if (b.hit(p)) planets[i] = new ParticleSystem(p.loc, p.vel, p.mass, p.c);
      }
    }

    spaceship.update(speed * dt/1000., fluid);
    spaceship.display();
  }
}