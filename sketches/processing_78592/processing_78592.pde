
BewegeLinieX BewegeLinienX[] = new BewegeLinieX[3];
BewegeLinieY BewegeLinienY[] = new BewegeLinieY[7];

void setup() {
  size(720,480);
  background(0);
  fill(255);
  noStroke();
  smooth();
  randomSeed(BewegeLinienY.length);
  float noiseX, noiseY;
  for (int i=0; i < BewegeLinienY.length; i++) {
    noiseY = noise(random(5))*5;
    // BewegeLinien (x,y,breite,hoehe,speed)
    BewegeLinienY[i] = new BewegeLinieY(0,random(10,height),width,abs(random(-30,30)),noiseY);
  }
  for (int i=0; i < BewegeLinienX.length; i++) {
    noiseY = noise(random(10))*5;
    // BewegeLinien (x,y,breite,hoehe,speed)
    BewegeLinienX[i] = new BewegeLinieX(random(10,width),0,abs(random(-20,20)),height, noiseY);
  }
}
float generate;
void draw() {
  background(0);
  for (int i=0; i < BewegeLinienX.length; i++) {
    BewegeLinienX[i].display();
    BewegeLinienX[i].update();
  }
  for (int i=0; i < BewegeLinienY.length; i++) {
    BewegeLinienY[i].display();
    BewegeLinienY[i].update();
  }
}

void keyPressed() {
    if(keyCode == ENTER) {
     saveFrame("line-######.png");
    } 
}


class Linie {
  float xpos, _xpos;
  float ypos, _ypos;
  float breite, _breite;
  float hoehe, _hoehe;

  Linie(float _xpos, float _ypos, float _breite, float _hoehe) {
    xpos = _xpos;
    ypos = _ypos;
    breite = _breite;
    hoehe = _hoehe;
    rectMode(CORNER);
  }

  void display() {
    fill(255);
    rect(xpos, ypos, breite, hoehe);
  }
}

class BewegeLinieY extends Linie {
  
 float speed, _speed;
 
 BewegeLinieY(float xpos, float ypos, float breite, float hoehe, float _speed) {
   super(xpos,ypos,breite,hoehe); 
   speed = _speed;
 }
  
 void update() {
   if(ypos <= 0 + hoehe || ypos >= height - hoehe) {
     speed = (speed * -1);
   }
   ypos += speed;
 } 
}

class BewegeLinieX extends Linie {
  
  float speed, _speed;
 
 BewegeLinieX(float xpos, float ypos, float breite, float hoehe, float _speed) {
   super(xpos,ypos,breite,hoehe); 
   speed = _speed;
 }
  
 void update() {
   float generate = 1;
   if(xpos <= 0 + breite || xpos >= width - breite) {
     speed = (speed * -1);
   }
   xpos += speed;
 } 
}
