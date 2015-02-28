

int rot = 189;
int g =30;
int blau = 55;
int d = 60;
int r=0;
float b =0;
void setup () {
  size(800,600);
  frameRate(12);
  noStroke();
  smooth();
  background(2,4,12);
  
   
}

void rcolor(){
  fill(rot,g,blau,random(7));
}
 
void draw(){
  fill(2,4,12,b+random(10,30));
  rect(0,0,width,height);
  rcolor();
  ellipse (380,300,80+r,80+r);
  rcolor();
  ellipse (360,230,90+r,90+r);
  rcolor();
  ellipse (430,350,60+r,60+r);
  rcolor();
  ellipse (440,300,80+r,80+r);
  rcolor();
  ellipse (400,190,70+r,70+r);
  rcolor();
  ellipse (410,260,80+r,80+r);
  rcolor();
  ellipse (390,260,100+r,80+r) ;
  rcolor();
  ellipse (420,260,120+r,120+r);
  rcolor();
  ellipse (430,310,50+r,50+r);
  rcolor();
  ellipse (330,310,110+r,110+r);
  rcolor();
  ellipse (350,310,60+r,60+r);
  rcolor();
  ellipse (360,360,75+r,75+r);
  rcolor();
  ellipse (460,340,90+r,90+r);
  rcolor();
  ellipse (320,380,80+r,80+r);
  rcolor();
  ellipse (320,270,80+r,80+r);

}

void mousePressed() {
  b = b + 1;
  r=r+int(random(20));
  rot = rot + int(random(-20,20));
  blau = blau + int(random(-20,20));
  g = g + int(random(-20,20));
}

void keyPressed() {
  fill(2,4,12);
  rect(0,0,width,height);
  r = -10;
  b=0;
  rot = 189;
  g =30;
  blau = 55;
}





