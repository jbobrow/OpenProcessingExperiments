
float x;
float y;
 
int r;
int g;
int b;

float sizex;
float sizey;

boolean colorchange;

void setup(){
  size (600,600);
  background (0);
  r = 113;
  g = 131;
  b = 191;
  colorchange = false;
}

void draw() {
   background (0);
  noStroke ();
  fill (0);
    x=mouseX;
  y=mouseY;
  fill (r,g,b);
  
ellipse(0, 250, 165, 165);  // Left circle
pushStyle();  // Start a new style
strokeWeight(30);
fill(113,131,191);
ellipse(165, 250, 165, 165);  // Left-middle circle

pushStyle();  // Start another new style
stroke(216,191,255);
ellipse(330, 250, 165, sizex);  // Right-middle circle
popStyle();  // Restore the previous style

popStyle();  // Restore original style

ellipse(500, 250, 165, 165);  // Right circle


strokeWeight (2);
fill (37,33,0,0);
rect (90,60,165,165);
 
stroke(255);
fill (37,33,0,0);
rect (60,40,110, 110);
 
stroke (255);
fill (37,33,0,0);
rect (30,20,55,55);
 
stroke (255);
fill (37,33,0,0);
rect (150,100,275,275);

stroke (255);
fill (37,33,0,0);
rect (300,200,550,sizex);
 
ellipse(0, 200, 132, 132);  // Left circle

pushStyle();  // Start a new style
strokeWeight(5);
fill(113,131,191);
ellipse(150, 150, 99, sizex);  // Middle circle
popStyle();  // Restore original style

ellipse(500, 250, 165, sizex);  // Right circle


if(mousePressed){
     r = r -10;
   g = g -2;
   b--;
   


if (b<=0){
  r = 113;
  g = 131;
  b = 191;
   }
}
}
void mouseDragged (){
sizex+= 40;
if (sizex>=600) {
  sizex=200;
}
}
