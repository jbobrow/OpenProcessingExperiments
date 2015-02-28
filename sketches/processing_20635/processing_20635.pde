

boolean button = false;
int wth=900;
int hth=400;

int px = 50;
int py = 50;
int owth = 100;
int ohth = 75;

float r;
float g;
float b;
float a;

float diam;
float x;
float y;

void setup(){
  
  size(wth,hth);
  background(0);
  smooth();
  
} 

void draw (){
  
  if (button) { 
  r=random (255);
  g=random (255);
  b=random (255);
  a=random (50);
  diam = random(20,70);
  x=random(width);
  y=random(height);
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  }
  
  else {
  background (255);
  stroke (255);
  }
  
  fill(0);
  rect(px,py,owth,ohth);
  
}
  
void mousePressed () {
  if ((mouseX > px) && (mouseX < px+owth) && (mouseY < py+ohth )) {
  button =!button;
  }

}  


  

