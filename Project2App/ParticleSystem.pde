class ParticleSystem extends Mover
{
  ArrayList<Particle> particles;
  float lifespan;
  
  ParticleSystem(PVector loc, PVector vel, float mass, color c)
  {
    super(loc, vel, mass, c);
    this.c = c;
    particles = new ArrayList<Particle>();
    lifespan = 40.;
  }
  
  void move(float dt)
  {
    super.move(dt);
    particles.add(new Particle(loc, c, lifespan));
    for (int i=particles.size()-1; i >=0; i--) {
      Particle p = particles.get(i);
      if (p.isDead()) particles.remove(i);
      else p.move(dt);
    }
  }
  
  void display()
  {
    for(Particle p : particles) p.display();
  }
}