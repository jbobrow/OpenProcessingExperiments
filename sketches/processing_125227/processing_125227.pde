
boolean jacky;
float a=0;
int r=0;
int v=0;
int b=0;

void setup() {
  size(800,800);
  loop();
  jacky = false;
}


void draw() {
  r = int(random(100,255));
  v = int(random(100,255));
  b = int(random(255));
  a = a+2;
  
  /*fill(r,v,b);
  stroke(r,0,b);
  strokeWeight(3);
  line(mouseX,mouseY,random(mouseX+200),random(mouseY+200));
  */
  
  ellipse(width/2, height/2, random(800),random(800));
  stroke(0);
  fill(a);
  
  if (a >= 255) {
    a = a-255;
  }
  
}

void mousePressed(){
  if (jacky==false) {
    loop();
    jacky=true;
  }
  
  else {
  noLoop();
  jacky=false;
  }

}
