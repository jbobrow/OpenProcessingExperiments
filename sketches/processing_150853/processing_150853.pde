
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: KIM Youngji
// ID: 201420069

import ddf.minim.*;
Minim minim;
AudioInput input;

float P;
float xoff;

void setup(){
  size(600,600,P3D);
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
}
void draw(){

  float mic = input.mix.level() * 1000;
  
  P = P*0.90 + mic*0.8;
  
  //camera(mouseX, mouseY, 220, 0,0,0,0,1,0);
  
  background(#eeeeee);
  lights();
  
  for (int i = 0; i<width; i+=100){
    for (int j = 0; j<width; j+=100){
      xoff += 0.001;
      float n = noise(xoff)*500;
      
      pushMatrix();
      translate(i,j,300);
      //rotateX(radians(P));
      //rotateY(-radians(P));
      noFill();
      strokeWeight(3);
      stroke(#DDD26C);
      rotate(radians(30));
      box(80,50,-n);
      popMatrix();
    }
  }
    title();
}

void title() {  
  fill(0); 
  textAlign(RIGHT);
  text("KIM Youngji, Untitled, Dynamic Media, 2014", width-50, height-20); 
} 

