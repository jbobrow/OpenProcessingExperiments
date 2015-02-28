
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Eunjin PARK
// ID: 201420079
 
 import ddf.minim.*;

Minim minim;
AudioInput input;
 
void setup(){
  size(600,600);
  
  minim = new Minim (this);
  input = minim.getLineIn (Minim.MONO, 512);
  background(255);
}
 
void draw(){
  stroke(255);
  strokeWeight(1);
 
  fill(255); 

float dia = input.mix.level() * 1000;
   
  for (int i = 0; i-20 < width-1; i = i + 40) {
    for (int j = 0; j-20 < height-1; j = j + 40) {
      stroke(0);
      strokeWeight(20);
      ellipse(i,j,dia,dia);
     }
  }
}
