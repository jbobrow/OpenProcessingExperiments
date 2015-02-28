
int t=0;
int a=0;
int b=0;
int speed=2;
int dir=1;
void setup(){
  size(500,651);
  background(0);
  noStroke();
  fill(150);
  rectMode(CENTER);
  rect(250,300,450,400);
  fill(1);
  rect(220,300,315,350);
  fill(255,5,255,255);
  ellipse(425,200,50,50);
  ellipse(425,150,50,50);
  rect(425,375,50,200);
  smooth();
  rect(250,500,450,25);
  
}

void draw(){
   smooth();
  strokeWeight(t);
  line(pmouseX,pmouseY,mouseX,mouseY);
  t = abs(pmouseX-mouseX);
  
a=a+speed*dir;
b=b+speed*dir;
rect(a,50,50,50);
rect(b,600,50,50);
 
 if(a>width || a <0 ) {
   dir = dir * -1;
  }
   if(b>width || b<0) {
    dir = dir *-1;
  }
  a=a+speed*dir;
b=b+speed*dir;

}

void mousePressed(){
stroke(50);
fill(50,50,255,50);
rectMode(CENTER);
rect(mouseX,mouseY, 30,30);

}

void keyPressed(){
 background (255,5,5,5); 
}
