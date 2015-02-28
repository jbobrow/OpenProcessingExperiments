
/*
Colour Change
Daria Lanz
daria@darialanz.com
Learning Processing
June 2009
*/


float c1 = 0;
float c2 = 255;

float c1dir = 0.1;
float c2dir = -0.1;

void setup() {
  size(600,400);
};

void draw() {
  
  noStroke();
  
  //Draw a rectangle on the left
  fill(c1,0,c2);
  rect(0,0,width/2, height);
  
  //Draw rectangle on right
  fill(c2,0,c1);
  rect(300,0,width/2,height);
  
  //Adjust colour values
  c1=c1+c1dir;
  c2=c2+c2dir;
  
  //Reverse direction of colour change
  if (c1 < 0 || c1 >255) {
    c1dir *= -1;
  };
  
  if (c2 < 0 || c2 > 255) {
    c2dir *= -1;
  };
  
};

