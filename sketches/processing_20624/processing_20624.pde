

boolean button = false;
int wth=900;
int hth=450;

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
  background(255);
  smooth();
  noStroke();
  
} 

void draw (){
  
  if (button) { 
  r=random (255);
  g=random (255);
  b=random (255);
  a=random (200);
  diam = random(50,1000);
  x=random(width);
  y=random(height);
  noStroke();
  fill(r,g,b,a);
  ellipse(x,y,diam,diam);
  }
  
  else {
  background (0);
  noStroke ();
  }
  
  fill(45);
  rect(px,py,owth,ohth);
  
  for (int x = 0; x<width; x +=10) {
  for (int y = 0; y<height; y+=40) {
  fill (200, random(255), random(255),10);//set a random color
  rect (x, y, 20, 100);
}
}
  
}
  
void mouseReleased () {
  if ((mouseX > px) && (mouseX < px+owth) && (mouseY < py+ohth )) {
  button =!button;
  }

}  


  

