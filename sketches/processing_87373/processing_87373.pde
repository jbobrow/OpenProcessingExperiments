
float _x = 0.0;
float _y = 0.0;
float _angle = 0.0;
float _lasty = 250.0;
float _lastx = 250.0;
 
float _a = 5.0;
float _b = 3.0;
float _c = 2.0;
float _d = 2.0;
 
 
void setup() {
 frameRate(60);
 size(800,800);
 noCursor();
 background(255);
 smooth();
 noStroke();
}
 
 
void draw() {
  fill(random(255),random(255),random(255),100); 
  noStroke();
  rect(0,0,width,height);
  _angle += 0.5;
  if (_angle > 360) { _angle -= 360; }
   
  float preva = _a;
  float prevb = _b;
  float prevc = _c;
  float prevd = _d;
  _a = mouseX/10;
  _b = mouseY/10;
  _c = mouseX/2;
  _d = mouseY/2;
   
  if ((_a != preva) || (_b != prevb) || (_c !=prevc)) {
    strokeCap(PROJECT);
    strokeWeight(int(random(55)) + 5);
    stroke(0);
  } else {
    strokeCap(ROUND);
    strokeWeight(int(random(25))+5);
    stroke(255);
  }
   
  _x = sin(_a * radians(_angle) + PI / 2) * width/2; 
  _y = sin(_b * radians(_angle)) * height/2;
  _x = sin(_c * radians(_angle) + PI / 1) * width/1;
  _y = sin(_d * radians(_angle)) * height/4;
  _x += width/2;
  _y += height/2;
   
 
  
  noFill();
  for(int i =10; i<1000 ; i+=150){
  ellipse(_lastx,height/2,i,i);
  filter(INVERT);
  ellipse(width/2,_lasty,i,i);
  }
   
  _lastx = _x;
  _lasty = _y;
}
 
void mousePressed() {
  background(255);
}



