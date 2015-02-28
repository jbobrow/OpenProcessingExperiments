
PFont font;
float r; 
float g; 
float b; 
float a; 
float diam;

float y = 50.0;
float speed = 1.0;

int direction = 30;
void setup() {
size(385, 550);
background (0);
font = loadFont("CenturyGothic-Bold-48.vlw");
 
textFont(font);
textSize(18);
smooth();
noStroke();
ellipseMode(RADIUS);

}
void draw() {

 fill(255,0,5);  
rect(0, 400, width, height);
 textSize(22);
 fill(0,147,23);
  text(" A  m  i  g  o  s  d e  l a  T  i  e  r  r  a",19,500);
 fill(0);
  textSize(14);
  text(" COMBAT - MONSANTO",110,530);
 
 

  
fill(r,g,b,a);
ellipse(33, y+50, diam,diam);
ellipse(73,y,diam,diam);
ellipse(113,y+50,diam,diam);
ellipse(153,y,diam,diam);
ellipse(193,y+50,diam,diam);
ellipse(233,y,diam,diam);
ellipse(273,y+50,diam,diam);
ellipse(313,y,diam,diam);
ellipse(353,y+50,diam,diam);

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



void mousePressed(){
 
  // Each time through draw(), new random numbers are picked for a new ellipse. 

 
}

