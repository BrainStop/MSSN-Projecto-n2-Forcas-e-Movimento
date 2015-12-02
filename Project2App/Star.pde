class Star {



  PVector location;
  PImage  sun = loadImage("sun2.gif");



  Star(PVector location, float mass) {

    this.location = location;
  }


  void display() {

    image(sun, this.location.x-100, this.location.y-100, 200, 200);
  }
}