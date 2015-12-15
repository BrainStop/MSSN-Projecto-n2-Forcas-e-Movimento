import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer song;
AudioInput input;


private  World world;
private final int menu =0;
private final int jogo = 1;
private PImage menu_bg;
private int selectedShip=0;
private PImage ship1;
private PImage ship2;
private PImage ship3;


private int estado = menu;


void setup() {

  size(1280, 720);
  menu_bg = loadImage("background.jpg");
  ship1 = loadImage("ship1.png");
  ship2 = loadImage("ship2.png");
  ship3 = loadImage("ship3.png");
  minim = new Minim(this);
  song = minim.loadFile("SW.mp3");
  song.loop();
}



public int mouseOverShip() {

  if ((mouseX>=(width/9)*3+25 && mouseX<=(width/9)*3+25+50)&&(mouseY>=height-250 && mouseY <=height-250+75)) {
    return 1;
  }
  if ((mouseX>=(width/9)*4+25 && mouseX<=(width/9)*4+25+50)&&(mouseY>=height-250 && mouseY <=height-250+75)) {
    return 2;
  }
  if ((mouseX>=(width/9)*5+25 && mouseX<=(width/9)*5+25+50)&&(mouseY>=height-250 && mouseY <=height-250+75)) {
    return 3;
  }
  return 0;
}

void displayShips() {


  tint(255, 126);
  image(ship1, (width/9)*3+25, height-250, 50, 75);
  image(ship2, (width/9)*4+25, height-250, 50, 75);
  image(ship3, (width/9)*5+25, height-250, 50, 75);

  if (mouseOverShip() == 1) {
    noTint();
    image(ship1, (width/9)*3+25, height-250, 50, 75);
  }
  if (mouseOverShip() == 2) {

    noTint();
    image(ship2, (width/9)*4+25, height-250, 50, 75);
  }
  if (mouseOverShip() == 3) {
    noTint();

    image(ship3, (width/9)*5+25, height-250, 50, 75);
  }

  if (selectedShip !=0) {

    if (selectedShip ==1) {
      noTint();
      image(ship1, (width/9)*3+25, height-250, 50, 75);
    }
    if (selectedShip ==2) {
      noTint();
      image(ship2, (width/9)*4+25, height-250, 50, 75);
    }
    if (selectedShip ==3) {
      noTint();
      image(ship3, (width/9)*5+25, height-250, 50, 75);
    }
  }
}

void drawMenu() {
  background(menu_bg);

  displayShips();

  if (isOverNewGame()) {

    fill(0, 0, 255);
    rect(width/2-200/2, height/2-100/2, 200, 100);
    fill(255, 255, 255);
    textSize(38);
    text("Novo Jogo", width/2-textWidth("Novo Jogo")/2, height/2+textAscent()/3); 
    textSize(100);
    text("SPACE WARS", width/2-textWidth("SPACE WARS")/2, 200);
  } else {
    fill(0);
    rect(width/2-200/2, height/2-100/2, 200, 100);
    fill(255, 255, 255);

    textSize(38);
    text("Novo Jogo", width/2-textWidth("Novo Jogo")/2, height/2+textAscent()/3); 
    textSize(100);
    text("SPACE WARS", width/2-textWidth("SPACE WARS")/2, 200);
  }
}


void draw() {

  if (estado == menu) {

    drawMenu();
  }
  if (estado == jogo) {
    world.run();
  }
}


public boolean isOverNewGame() {

  if ((mouseX >= width/2-200/2 && mouseX <= width/2-200/2+200) && (mouseY >= height/2-100/2 && mouseY <= height/2-100/2+100)) {
    return true;
  }
  return false;
}

void update() {
}

void mousePressed() {



  if (estado == menu) {

    if (mouseOverShip() != 0) {
      selectedShip = mouseOverShip();
    }
    if ( isOverNewGame()) {
      if (selectedShip!=0) {

        world = new World(3, selectedShip);
        estado=jogo;
        background(0);
        world.run();
      }
    }
  } 
}