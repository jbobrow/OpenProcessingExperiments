
int d = 60;
int r=0;
 
void setup () {
  size(800,600);
  frameRate(12);
  noStroke();
  smooth();
  background(2,4,12);
  
   
}
 
void draw(){
  fill(2,4,12,random(8,30));
  rect(0,0,width,height);
  fill(189,30,55,random(10));
  ellipse (380,300,80+r,80+r);
  fill(189,30,55,random(10));
  ellipse (360,230,90+r,90+r);
  fill(189,30,55,random(10));
  ellipse (430,350,60+r,60+r);
  fill(189,30,55,random(10));
  ellipse (440,300,80+r,80+r);
  fill(189,30,55,random(10));
  ellipse (400,190,70+r,70+r);
  fill(189,30,55,random(10));
  ellipse (410,260,80+r,80+r);
  fill(189,30,55,random(10));
  ellipse (390,260,100+r,80+r) ;
  fill(189,30,55,random(10));
  ellipse (420,260,120+r,120+r);
  fill(189,30,55,random(10));
  ellipse (430,310,50+r,50+r);
  fill(189,30,55,random(10));
  ellipse (330,310,110+r,110+r);
  fill(189,30,55,random(10));
  ellipse (350,310,60+r,60+r);
  fill(189,30,55,random(10));
  ellipse (360,360,75+r,75+r);
  fill(189,30,55,random(10));
  ellipse (460,340,90+r,90+r);
  fill(189,30,55,random(10));
  ellipse (320,380,80+r,80+r);
  fill(189,30,55,random(10));
  ellipse (320,270,80+r,80+r);

}

void mousePressed() {
  r=r+int(random(20));
}

void keyPressed() {
  fill(2,4,12);
  rect(0,0,width,height);
  r = -10;
}





