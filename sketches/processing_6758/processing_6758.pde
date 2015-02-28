
//optimizar el listado de near flockmates para calcularlo una sola vez.

//import processing.opengl.*;

DParticleEngine myEngine;

PFont infoFont;

PFont partFont;

int iterations=1;
boolean aggregate;

void setup(){
  //size(640,480,OPENGL);
  size(640,480,JAVA2D);
  
  smooth();
  aggregate=false;

  myEngine=new DParticleEngine();
  background(0);

  infoFont=loadFont("SansSerif-10.vlw");
  partFont=loadFont("HelveticaNeue-Bold-24.vlw");
}

void draw(){
  if(!aggregate){
    background(0);
  }
for(int i=0; i<iterations; i++){
  myEngine.update();
  myEngine.display();
}
  if(!aggregate){
    fill(255);
    textFont(infoFont);
    text(nf(frameRate,2,2)+"fps",10,20);

    text(nf(myEngine.partArray.size(),2,2)+"particles",10,30);
  }

}

void mouseDragged(){
  float velX=mouseX-pmouseX;
  float velY=mouseY-pmouseY;
  PVector cVel=new PVector(velX,velY);
  cVel.normalize();
  cVel.mult(1);
  myEngine.emit(mouseX,mouseY,cVel);
}

void keyPressed(){

  if(key=='s'){
    println("saving...");
    saveFrame("thinguies-####.png");
    println("saved.");
  }

  if(key=='c'){
    aggregate=!aggregate;
  }
}



