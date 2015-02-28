
float y;
float x;
float r=10;
float g=100;
float b=40;
int asdf=0;
void setup (){
  size(500,500);
  background(15,86,45);
  strokeWeight(3);
  frameRate(150);
  x = 450;
  y = 450;
}


void draw () {
   if(r+g+b<30) {
    x=450;
    y=450;
    r=random(0,250);
    g=random(0,250);
    b=random(0,250);
    background(r,g,b);
  }
  stroke(random(0,r),random(0,g),random(0,b));
  line(width/2,height/2,cos(radians(asdf))*x+250,sin(radians(asdf))*y+250);
  asdf++;
  rotate(radians(frameCount));
  x=x-0.15;
  y=y-0.15;
  if(abs(x+y)<1) {
    x=450;
    y=450;
    r=random(0,250);
    g=random(0,250);
    b=random(0,250);
  }
 if (mousePressed == true) {
    x=450;
    y=450;
    r=random(0,250);
    g=random(0,250);
    b=random(0,250);
    background(r,g,b);
  }
}
