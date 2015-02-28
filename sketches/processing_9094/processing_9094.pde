
import processing.opengl.*;

DParticleEngine myEngine;

PFont infoFont;

PFont partFont;

boolean aggregate;
int iterations=1;

void setup(){
  //size(screen.width,screen.height,OPENGL);
  size(640,480,P3D);
  //noCursor();
  smooth();
  aggregate=false;

  myEngine=new DParticleEngine();
  background(0);

  infoFont=loadFont("SansSerif-10.vlw");
  partFont=loadFont("HelveticaNeue-Bold-24.vlw");

  //textMode(SCREEN);
}

void draw(){
  if(!aggregate){
    background(0); 
  }
  pointLight(51, 102, 126, width, 40, 600);

  //translate(width/2,height/2,0);
  //rotateY(DEG_TO_RAD*frameCount);
  //translate(-width/2,-height/2,0);


  for(int i=0; i<iterations;i++){
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
  //float velX=mouseX-pmouseX;
  //float velY=mouseY-pmouseY;
  //float velZ=random(-width/10,width/10);
  //PVector cVel=new PVector(velX,velY,velZ);
  PVector cVel=new PVector(0,0,0);
  //cVel.normalize();
  //cVel.mult(1);
  myEngine.emit(mouseX,mouseY,10,cVel);
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






