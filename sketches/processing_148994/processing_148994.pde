
// JU Hwiyeon
// 201420109
/*
import ddf.minim.*;
Minim minim;
AudioInput input;
*/
void setup()
{
  size(600, 600);
  smooth();
  //minim = new Minim (this);
  //input = minim.getLineIn (Minim.MONO, 512);
}
void draw() {
  background(0);
  stroke(255);   
  strokeWeight(6); 
  //float dia = input.mix.level() * 1000;  
  noFill();
  for (int i = -310; i < width; i = i +50) {   
    for (int j = -310; j < height; j = j +50) {   
      ellipse(i, j, dia, dia);
      ellipse(i, j, 50, 70);
    }
  }
}
