
float r; 
float g; 
float b; 
float a; 
float diam;

float y = 50.0;
float speed = 1.0;

int direction = 30;
void setup() {
size(385, 700);
background (0);
smooth();
noStroke();
ellipseMode(RADIUS);

}
void draw() {

fill(r,g,b,a);
ellipse(33, y+50, diam,55);
ellipse(73,y,diam,diam);
ellipse(113,y+50,diam,55);
ellipse(153,y,diam,diam);
ellipse(193,y+50,diam,55);
ellipse(233,y,diam,diam);
ellipse(273,y+50,diam,55);
ellipse(313,y,diam,diam);
ellipse(353,y+50,diam,55);

y += speed * direction;
if ((y-30 > height-diam) || (y+10 < diam)) {
direction = -direction;
}
}

void mouseMoved(){
 
  // Each time through draw(), new random numbers are picked for a new ellipse. 
  g = random(255);
  r = random(255); 
  b = random(255); 
  a = random(255); 
  diam = random(20);
 
}






