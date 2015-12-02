class Mover {
  PVector loc;
  PVector vel;
  PVector acc;
  color c;
  float mass;
  int size;

  Mover(PVector loc, PVector vel, float mass, color c) {
    this.loc = loc;
    this.vel = vel;
    this.mass = mass;
    this.c = c;
  }
  /*
  void applyForce(PVector f) {
    acc = f.div(mass);
    vel.add(acc);
  }

  void move() {
    loc.add(vel);
  }

  void display() {
    //TODO
  }
  */
}