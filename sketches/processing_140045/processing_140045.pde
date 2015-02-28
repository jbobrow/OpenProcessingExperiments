
import gifAnimation.*;

float diameter;
float angle = 0;
float colour = 0;

void setup() {
 
  size(500, 500,P2D);
  diameter = 200;
  //blendMode(ADD);
  colorMode(HSB);
  smooth(8);
  background(0);
  noStroke();
 
}

void draw() {

colour += 0.1;

 if(frameCount%10 == 0)
 {

   //float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float sinw = (sin(angle) * diameter/2) + width/2;
  float sinh = (sin(angle + PI/2) * diameter/2) + height/2;
 
   //fill(255, 204);  //white
   fill(colour,255,255,30);
   ellipse(sinh, sinw, 150, 150);
 }

  angle += PI/61;
 
  if(colour > 255)
{
  colour = 0;
}
}



