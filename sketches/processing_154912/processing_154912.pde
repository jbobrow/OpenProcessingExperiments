
//Nalini Ramanathan nalinir Copyright 2014
float x;
float y;
float z;
float q;

void setup () {
   size (400, 400);
   float x=500;
   float y=200;
   float z=100;
   float q=400;
}
void draw () {
float x=mouseX;
float y=mouseY;
float z=mouseX;
float q=mouseY;
background (0, 22, 43);
fill(255, 0, 0);
quad(x*.5, y*1.25, x*1.5, y*1.125, x*1.6, y*2, x*.4, y*2);
fill(255, 255, 255);
ellipse(x, y, z, q);
fill(255, 255, 0);
ellipse(x, y*.75, x*.125, y*.125);
fill(0, 0, 0);
ellipse(x*.9, y*.5, x*.075, y*.21875);
ellipse(x*1.1, y*.5, x*.075, y*.21875);
}



