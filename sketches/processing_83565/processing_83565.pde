
PSphere a = new PSphere(400,400,5,5,25);
PSphere b = new PSphere(250,410,5,-5,25);
PSphere c = new PSphere(423,125,-5,-5,25);
PSphere d = new PSphere(425,125,-5,5,25);
PSphere h = new PSphere(425,125,-1,5,25);
PSphere v = new PSphere(425,125,1,1,25);
void setup() {
  size(500,500,P3D);
  smooth();
  background(255);
  frameRate(50);
}

void draw() {
  noStroke();
  fill(255,1);
  rect(0,0,width,height);
  directionalLight(255,255,255,width/2,height/2,50);
  a.display();
  b.display();
  c.display();
  d.display();
  h.display();
  v.display();
}
class PSphere {
  float x,y,xspeed,yspeed,a;
    PSphere(float a1,float a2,float a3,float a4,float a5){
     x=a1;
    y=a2;
   xspeed=a3;
  yspeed=a4;
 a=a5;
    }
      void display() {
  x = x + xspeed;
  y = y + yspeed;
  if ((x+a > width) || (x-a < 0)) {
    xspeed = xspeed * -1;
  }
  if ((y+a > height) || (y-a < 0)) {
    yspeed = yspeed * -1;
  }
  translate(x,y,0);
  stroke(0);
  fill(0,65,255);
  sphere(a);
  translate(-x,-y,0);
      }
  }


