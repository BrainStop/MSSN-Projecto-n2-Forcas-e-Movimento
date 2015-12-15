class Star {



  PImage  sun = loadImage("sun2.gif");
PVector loc;
  float mass = 300000.;
  final float G = 1.;
  


  Star(PVector loc, float mass) {

    this.loc = loc;
  }


PVector attractionForce(Mover m)
  {
    PVector r = PVector.sub(loc, m.loc);
    float d = r.mag();
    float strength = G * mass * m.mass / pow(d,2);
    return PVector.mult(r.normalize(),strength);
  }

  void display() {

    image(sun, this.loc.x-100, this.loc.y-100, 200, 200);
  }
}