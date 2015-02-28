
import controlP5.*;
import fisica.*;
import geomerative.*;

ControlP5 controlP5;
GUI gui;
FWorld world;

PImage b;
Stone stone;

void setup() {
  size(600, 300);
  smooth();
  b = loadImage("sand.jpg");
  b.resize(width, height);
  frameRate(24);
  controlP5 = new ControlP5(this);
  gui = new GUI(controlP5);

  Fisica.init(this);
  Fisica.setScale(10);
  RG.init(this);
  RG.setPolygonizer(RG.ADAPTATIVE);

  world = new FWorld();
  world.setEdges(this, color(0));
  world.setGravity(0, 0);
  world.add(new Pink((int)random(0, width), (int)random(0, height)));
  world.add(new Orange((int)random(0, width), (int)random(0, height)));
  world.add(new Green((int)random(0, width), (int)random(0, height)));
}
void draw() {
  background(b);
  world.draw(this);
  if (stone != null) {
    stone.draw(this);
  }
  if (!gui.panel.isVisible()) {
    world.step();
  }
  fill(0);//text(frameRate, width-50, height-20);
}
void mousePressed() {
  if (!gui.panel.isVisible()) {
    FBody hovered = world.getBody(mouseX, mouseY);
    if (hovered == null && !(mouseX < 150 && mouseY < 50)) {//Non creo nell'angolo in alto a sistra sotto il bottone
      switch (gui.orgid) {
      case 0:
        world.add(new Pink(mouseX, mouseY));
        break;
      case 1:
        world.add(new Orange(mouseX, mouseY));
        break;
      case 2:
        world.add(new Green(mouseX, mouseY));
        break;
      case 3://Disegno sasso
        stone = new Stone();
        stone.vertex(mouseX, mouseY);
        break;
      case 4://Creo cibo
        world.add(new Food(mouseX, mouseY, gui.cp.getColorValue()));
        break;
      }
    } 
    else if (gui.orgid == -2) {//Cancello corpo
      world.remove(hovered);
    }
  }
}
void mouseDragged() {
  if (stone!=null) {//Disegno sasso
    stone.vertex(mouseX, mouseY);
  }
}
void mouseReleased() {
  if (stone!=null) {//Disegno sasso
    world.add(stone);
    stone = null;
  }
}
void keyPressed() {

  if (key == CODED) {
    println(keyCode);
  }
  else {
    int intk = -1;
    try {
      intk = Integer.parseInt(key + "");
      gui.orgid = constrain(intk, 0, 4);
    } 
    catch (NumberFormatException e) {
    }
    if (intk == -1) {
      switch (key) {
      case 'p':
        gui.orgid = 4;
        break;
      case 's':
        gui.orgid = 3;
        break;
      case 'c':
        gui.orgid = -2;
        break;
      case 'o':
        if (gui.panel.isVisible()) {
          gui.panel.hide();
        } else {
          gui.panel.show();
        }
        break;
      }
    }
  }
}
void contactStarted(FContact c) {
  FBody b1 = c.getBody1();
  FBody b2 = c.getBody2();

  if (b1 instanceof Food && b2 instanceof Food) {//Se due cibi si scontrano non fanno niente
  } 
  else if (!b1.isStatic() && !b2.isStatic()) {
    if (b1 instanceof Food && !(b2 instanceof Food)) {
      Organism o = (Organism) b2;
      o.mangia(b1);
    } 
    else if (!(b1 instanceof Food) && b2 instanceof Food) {
      Organism o = (Organism) b1;
      o.mangia(b2);
    }
    else if (b1 instanceof Green && !(b2 instanceof Food)) {
      Organism o = (Organism) b1;
      o.mangia(b2);
    } 
    else if (!(b1 instanceof Food) && b2 instanceof Green) {
      Organism o = (Organism) b2;
      o.mangia(b1);
    }
  }
}

