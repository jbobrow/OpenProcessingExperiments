
import controlP5.*;
import ddf.minim.*;

Minim minim;
AudioPlayer song;
AudioMetaData meta;

Bloc bloc;
musicSystem mSys;

ControlP5 controlP5;
int vitesse = 1;


void setup(){
  size(500, 500);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("vitesse",1,10,128,200,180,100,10);
  
  smooth();

  PVector vel = new PVector(0, 0);  
  PVector acc = new PVector(0, 0); 
  PVector pos = new PVector(width/2, 0);  
  bloc = new Bloc(pos, vel, acc, 1.5);
  
  PVector posM = new PVector(0, height/2);
  PVector vitM = new PVector(10, 0);
  bloc.changeColor();
  
  mSys = new musicSystem(posM, vitM, 10);

  minim = new Minim(this);
}

void draw(){ 
    // CONTRÔLE DE LA VITESSE AVEC LE SLIDER
    mSys.vit.x = vitesse;
    
    mSys.draw();    
    bloc.draw();
    PVector force = new PVector(0, 1);
    bloc.addForce(force);
}

