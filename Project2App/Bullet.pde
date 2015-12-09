class Bullet extends Mover {


  Bullet(PVector loc, PVector vel) {

    super(loc, vel, 0, color(0, 255, 0));
  }

  public boolean isOut() {

    if (this.loc.x > width || this.loc.y > height  || this.loc.x < 0 || this.loc.y < 0 ) {

      return true;
    }

    return false;
  }

  void display() {
    fill(this.c);
    this.vel.add(this.vel);
    rect(loc.x+this.vel.x, loc.y+this.vel.y, 5, 25);
  }
}