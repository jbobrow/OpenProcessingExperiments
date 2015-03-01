
void setup(){
  size(600,600);
background(255);
int x1=0;
int x2=0;
int y1=0;
int y2=0;
int s=0;
int r=0;
int g=0;
int b=0;
}

void draw() {


  
  x1 = int(random (width));
  y1 = int(random(height));
  x2 = int(random(width));
  y2 = int(random(height));
  s = int(random(1,200));
  r = int(random(0,255));
  g = int(random(0,255));
  b = int(random(0,255));
  o = int(random(0,255));
  
  if(mousePressed==true){
  
  fill(r,g,b,o);
  
  ellipse(x1, y1, s, s);
  line(x1,y1,x2,y2);
  ellipse(x2,y2, s, s);
  
  loop();
}}


void keyPressed() {
  if (key=='s') saveFrame(timestamp()+"##.png");
  if (key=='p') savePDF = true;
  if (key=='b') background(255);
}
