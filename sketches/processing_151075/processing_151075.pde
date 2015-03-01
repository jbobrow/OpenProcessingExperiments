

import ddf.minim.*;

//Minim minim;
//AudioInput input;

float a = 0;
float diameter = 30;
float angle;
float dia;

void setup() {
 size(1000, 700, P3D); 
  background(255); 
  smooth();
  lights(); 
//  minim = new Minim (this);
 // input = minim.getLineIn (Minim.MONO, 512);
}

void draw() {
  background(0);
  float dia = input.mix.level() * 500;
  if ( a >=height + diameter) a = -diameter ;
    //
  translate(width/2, height/2, 0); 
  for (int j= 0; j<50; j=j+10) {
    rotate(radians(-angle));
    rotateY(radians(-angle));
    rotateX(radians(angle));
   
    strokeWeight(mouseY/5);
    box(250+dia);
    translate(0, 50, 0);
    sphere(125); 
    translate(0,-100,0); 

    pushMatrix(); 
    lights();
    translate(100, height*0.35, -50); 
    sphere(140); 
    translate(0,100,0);
    stroke(a,100,50,50);
    fill (a,500);
    box(100);
    popMatrix();
  }
  angle = angle +1;
}

