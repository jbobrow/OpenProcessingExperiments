
// Sciami intelli(a)genti - day 02
// agents sketch
// original def: José Sanchez
// adapted for Toxi libraries by: Michele Semeghini
// (few) alterations made by Alessio Erioli
//
// /////////////////////////////////////////
//
// instructions
//
// keyboard:
// p: pause on/off (toggle)
// t: transparency on/off (toggle)
//
// separation, alignment and cohesion can be changed through sliders

import toxi.geom.*;
import controlP5.*;

ControlP5 controlP5;

ArrayList ballCollection;
boolean bStop=false;
boolean transp=true;
public float separation=4.0;    // separation default value = 4
public float alignment=0.1;    // alignment default value = 0.1
public float cohesion=0.002;  // cohesion default value = 0.002

void setup(){
 size(800,400);
smooth();
ballCollection = new ArrayList();
for (int i=0; i<100; i++){
 Vec3D origin = new Vec3D (random(width),random(200),0); 
 Ball myBall = new Ball(origin);
 ballCollection.add(myBall);
}
controlP5 = new ControlP5(this);

controlP5.addSlider("separation",0,10,4.0,20,20,100,10);
controlP5.addSlider("alignment",0,0.5,0.1,20,40,100,10);
controlP5.addSlider("cohesion",0,0.01,0.001,20,60,100,10);
}

void draw(){
  //background(0);
  println(separation);
   if (transp){
  pushStyle();
  noStroke();
  fill(0,10);
  rect(0, 0, width, height);
  popStyle();
  }else{
    background(0);
  }
  for (int i=0; i< ballCollection.size(); i++){
   Ball nb = (Ball) ballCollection.get(i);
  nb.run(); 
  }
}

void keyPressed() {

  if (key == 'p' || key == 'P') {
    bStop=!bStop;
    if (bStop) {
      noLoop();
    }
    else {
      loop();
    }
  }

    if (key == 't' || key == 'T'){
   transp=!transp;
  }
}

