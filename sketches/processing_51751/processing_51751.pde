

float angle;
float jitter;
MRect r1;
TRI r2;
ELL r3;
int test;

void setup() {
  size(300, 300);
  r1 = new MRect(random(100), 20, random(100), 20); //creates rectangle of random size
  r2 = new TRI(random(100), random(100),random(100), random(100), random(100), random(100));
  r3 = new ELL(random(100), random(100),random(100), random(100));
  test = int(random(3));
  
}

void draw() {
 background(102);
  //from example rotate
  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c); //one movement is that it rotates
  if(test == 0){ //randomly choses a picture/shape
    r1.display();
    r1.move(mouseX-(width/2), mouseY+(height*0.1), 30); //moves it with the mouse
  }
  else if(test == 1){
    r2.display();
    r2.move(mouseX-(width/2), mouseY+(height*0.1), 30);
  }
  else if(test <= 2){
    r3.display();
    r3.move(mouseX-(width/2), mouseY+(height*0.1), 30);
  }
}
class MRect 
{
  float w; // single bar width
  float xpos; // rect xposition
  float h; // rect height
  float ypos ; // rect yposition
  
  MRect(float iw, float ixp, float ih, float iyp) {
    w = iw;
    xpos = ixp;
    h = ih;
    ypos = iyp;
  }
  void move (float posX, float posY, float damping) {
    float dif = ypos - posY; //makes it move with mouse
    if (abs(dif) > 1) {
      ypos -= dif/damping;
    }
    dif = xpos - posX;
    if (abs(dif) > 1) {
      xpos -= dif/damping;
    }
  }
  void display() {
      rect(xpos, ypos, w, h);
  }

}
class TRI{
  float z; 
  float y; 
  float x;
  float r ; 
  float q; 
  float p;
  TRI(float za, float ya, float xa, float ra, float qa, float pa) {
    z = za;
    y = ya;
    x = xa;
    r = ra;
    q = qa;
    p = pa;
  }
  void move (float posX, float posY, float damping) {
    float dif = y - posY; //makes it move with mouse
    if (abs(dif) > 1) {
      y -= dif/damping;
    }
    dif = z - posX;
    if (abs(dif) > 1) {
      z -= dif/damping;
    }
  }
   void display() {
      triangle(z, y, x, r,q,p);
  }  
}
class ELL{
  float x; 
  float y; 
  float w;
  float h; 
  ELL(float x1, float y1,float wi, float he){
   x = x1;
   y = y1;
   w = wi;
   h = he;
  }
  void move (float posX, float posY, float damping) {
    float dif = y - posY; //makes it move with mouse
    if (abs(dif) > 1) {
      y -= dif/damping;
    }
    dif = x - posX;
    if (abs(dif) > 1) {
      x -= dif/damping;
    }
  }
  void display() {
      ellipse(x,y,w,h);
  }
}

