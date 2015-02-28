
float diameter;
float diameter2;
float angle = 0;
float angle2 = 0;
float colour = 0;
float rand1 = 70;
float rand2 = 130;


void setup() {
 
  size(800, 600);
  diameter = 290;
  diameter2= 141;

  //frameRate(30);
  //blendMode(MULTIPLY);
  colorMode(HSB);
  smooth(8);
  background(0);
  noStroke();
 
}

void draw() {

 if(frameCount%2400 == 0)
 {
background(0);
rand1 = random(5,150);
rand2 = random(5,150);
 }

  //float sin = (sin(angle); 
  float coloursin = (sin(angle*1) * 10 + 55);
  float sinw = (sin(angle) * diameter/2) + height/2;
  float sinh = (sin(angle + PI/2) * diameter/2) + width/2;
  float sinw2 = (sin(angle2) * diameter2/2);
  float sinh2 = (sin(angle2 + PI/2) * diameter2/2);
 
  colour += 0.135;
 
   //fill(255, 204);  //white
   fill(colour,255,255);
   ellipse(sinh - sinh2 , sinw + sinw2, 30, 30);
 //}

  angle2 += PI/rand1;
  angle += PI/rand2;
 
  if(colour > 255)
{
  colour = 0;
}
}



