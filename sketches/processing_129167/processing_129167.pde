
/**
 *  Buttons and bodies
 *
 *  by Ricard Marxer
 *
 *  This example shows how to create bodies.
 *  It also demonstrates the use of bodies as buttons.
 */

import fisica.*;

FBox boxButton;

FWorld world;

color buttonColor = #155AAD;
color hoverColor = #55AA11;
color bodyColor = #6E0595;

int[] wbox = new int[7];
int[] hbox = new int[7];
int[] sp = new int[7];

int bcounter = 0;
int scounter = 0;
int check = 0;
int bindex = 0;

String bname;
ArrayList mains = new ArrayList();

void setup() {
  
  wbox[0] = 70;
  hbox[0] = 90;
  sp[0] = 40;
  wbox[1] = 150;
  hbox[1] = 90;
  sp[1] = 80;
  wbox[2] = 150;
  hbox[2] = 190;
  sp[2] = 80;
  wbox[3] = 230;
  hbox[3] = 290;
  sp[3] = 120;
  wbox[4] = 310;
  hbox[4] = 190;
  sp[4] = 160;
  wbox[5] = 310;
  hbox[5] = 290;
  sp[5] = 160;
  wbox[6] = 310;
  hbox[6] = 395;
  sp[6] = 160;

  size(1280, 800);
  smooth();

  Fisica.init(this);

  world = new FWorld();
  world.setGravity(0, 100);
  world.setEdges();
  world.remove(world.top);
  
  FPoly p = new FPoly();
  p.vertex(700, 800);
  p.vertex( 1280, 600);
  p.vertex( 1280, 800);
  p.setStatic(true);
  p.setFill(0);
  p.setRestitution(0);
  world.add(p);
  
  FPoly p2 = new FPoly();
  p2.vertex(0, 500);
  p2.vertex( 0, 800);
  p2.vertex( 100, 800);
  p2.setStatic(true);
  p2.setFill(0);
  p2.setRestitution(0);
  world.add(p2);
    
}


void draw() {
  background(235);
  
  if (frameCount %  200 == 0) {
    float r = random(6);
    int rr = round(r);
    int w = wbox[rr];
    int h = hbox[rr];
    int s = sp[rr];
    
    float div = 1280/s;
    float ran = round(random(div))+1;
    float xpos = ran * s;
    bname = "box" + bcounter;
    FBox myBox = new FBox(w,h);
    myBox.setPosition(xpos, -300);
    myBox.setVelocity(0, 200);
    color c1 = color(random(255), random(255), random(255)); 
    myBox.setFillColor(c1);
    myBox.setNoStroke();
    if(rr == 0){
      int boardnum = round(random(6))+1;
      PImage imagen = loadImage("../images/70x90-" + boardnum+ ".jpg");
      imagen.resize(w, h);
      myBox.attachImage(imagen);
    }
    if(rr == 1){
      int boardnum = round(random(7))+1;
      PImage imagen = loadImage("../images/150x90-" + boardnum+ ".jpg");
      imagen.resize(w, h);
      myBox.attachImage(imagen);
    }
    if(rr == 2){
      int boardnum = round(random(3))+1;
      PImage imagen = loadImage("../images/150x190-" + boardnum+ ".jpg");
      imagen.resize(w, h);
      myBox.attachImage(imagen);
    }
    if(rr == 3){
      int boardnum = round(random(5))+1;
      PImage imagen = loadImage("../images/230x290-" + boardnum+ ".jpg");
      imagen.resize(w, h);
      myBox.attachImage(imagen);
    }
    if(rr == 4){
      int boardnum = round(random(8))+1;
      PImage imagen = loadImage("../images/310x190-" + boardnum+ ".jpg");
      imagen.resize(w, h);
      myBox.attachImage(imagen);
    }
     if(rr == 5){
      int boardnum = round(random(5))+1;
      PImage imagen = loadImage("../images/310x290-" + boardnum + ".jpg");
      imagen.resize(w, h);
      myBox.attachImage(imagen);
    }
    if(rr == 6){
      int boardnum = round(random(3))+1;
      PImage imagen = loadImage("../images/310x395-" + boardnum + ".jpg");
      imagen.resize(w, h);
      myBox.attachImage(imagen);
    }
    bname = myBox.getName();
    myBox.setName ("box" + bcounter);
    bname = "box" + bcounter;
    bcounter++;
    world.add(myBox);
    
    mains.add(myBox);

    check = 1;
    //println(bindex);
  }
  
  if(scounter > 2400){
    FBox other = (FBox)mains.get(bindex);
    scounter = 2200;
    bindex++;
    world.remove(other);
  }
  scounter++;

  
  

  
  world.step();
  world.draw();
}








