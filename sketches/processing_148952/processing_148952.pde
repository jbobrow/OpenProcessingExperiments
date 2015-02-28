
import ddf.minim.*;

Minim minim;
 AudioInput input;

void setup() { 
  size(1024, 768); 
  smooth(); 
  //noLoop(); 
  minim = new Minim (this);
 input = minim.getLineIn (Minim.MONO, 512);
} 


void draw() { 
  float dia = input.mix.level() * 1000;
  float a = map(dia,0,100,10,50);
   background(255); 
  
  for ( int i=10; i<width; i+=100) { 
    for ( int j=10; j<height; j+=120) { 
      noStroke(); 
      fill(random(255), random(90), random(255), 90); 
      rect(j+80, i+30, a, a); 
      rect(i+80, j-30, a-20, a); 
      rect(j-80, i+30, a, a-20); 
      rect(i+80, j-30, a+20, a); 
      rect(i+120, j-40, a, a+20); 


    } 


  } 


} 

