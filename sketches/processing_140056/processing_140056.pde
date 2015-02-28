
import gifAnimation.*;

float diameter;
float angle = 0;

void setup() {
 
  size(1000, 500, P2D);
  diameter = width - 350;
  //blendMode(EXCLUSION);
  smooth(8);
  noStroke();
 
}

void draw() {

  background(0);

  
  //float d2 = 10 + (sin(angle + PI/2) * diameter/2) + diameter/2;
  float sin1 = (sin(angle) * diameter/2) + width/2;
  float sin2 = (sin(angle + PI/2.5) * diameter/2) + width/2;
  float sin3 = (sin(angle + PI/2.5 * 2) * diameter/2) + width/2;
  float sin4 = (sin(angle + PI/2.5 * 3) * diameter/2) + width/2;
  float sin5 = (sin(angle + PI/2.5 * 4) * diameter/2) + width/2;
 
   fill(255, 204);  //white
   //fill(227, 73, 30, 122);
   ellipse(sin1, height/2, 200, 200);
  // fill(30, 159, 227, 122);
   ellipse(sin2, height/2, 200, 200);
  // fill(227, 30, 66, 122);
   ellipse(sin3, height/2, 200, 200);
  // fill(227, 207, 30, 122);
   ellipse(sin4, height/2, 200, 200);
 //  fill(30, 227, 97, 122);
   ellipse(sin5, height/2, 200, 200);
 

  angle += 0.01;
}



