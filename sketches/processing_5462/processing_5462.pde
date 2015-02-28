
Dd d1;

void setup() {
    size(400, 400);
    frameRate(60);
    background(255);
}
	  
void draw() {
    stroke(random(0,255),random(0,255),random(0,255));
    d1 = new Dd(random(0,400),random(0,400), random(0,255));
    d1.draww();
}

void mousePressed(){
    background(255);    
}

class Dd{
   
  float posx;
  float posy;
  float colorr;
  
  Dd(float ax, float ay, float ac){
      posx = ax;
      posy = ay;
      colorr = ac;
  }

  void draww(){
    line(posx, posy, mouseX, mouseY);
  }  
}

