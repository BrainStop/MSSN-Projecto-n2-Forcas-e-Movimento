class Bullet extends Mover {

  Bullet(PVector loc, PVector vel) {
    //TODO estes parametros de massa e cor n são os finais
    super(loc, vel, 20, color(255));
  }

  /*  
   TODO falta o Fluid para isto funcionar
   void run(float dt, Fluid fluid) {
   TODO
   }
   boolean isOut() { 
   }
   
  boolean hit(Mover m) {
  }
  */
}