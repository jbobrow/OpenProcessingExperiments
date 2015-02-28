

void setup() {
  size(1000, 1000);
  frameRate(15);
}

  
void draw() {
//flame
  //(flame size)(Anchor/Control)(axis)(first/second)(left/right)
  //constants
  float aX1 = 500; //bottom anchor
  float aY1 = 500;
  float aX2 = 500; //top anchor
  float cX2 = 500; //control point
  //linear variables
  float cY1 = 550; //first control y
  float Y2 = random(275, 325); //second y
  float cX1R = random(725, 875); //first x control left
  float cX1L = 200 + (cX1R - 800); //first x conrol right
  //color
  float flamecolorG = 155;
  float flamecolorB = 0;
  float backgroundLight = (Y2 + cX1R - 460)/10;
  noStroke();
  background(backgroundLight);
   while(cY1 > 500) {
     fill(255, flamecolorG, flamecolorB, 150); 
     curve(cX1L , cY1, aX1, aY1, aX2, Y2, cX2, Y2);
     curve(cX1R, cY1, aX1, aY1, aX2, Y2, cX2, Y2);
     cY1 = cY1 - 15;
     Y2 = Y2 + 33;
     cX1R = cX1R - 66;
     cX1L = cX1L + 66;
     flamecolorB = flamecolorB + 33;
     flamecolorG = flamecolorG + 33;     
   }

}


