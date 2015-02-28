
PImage bee;
Float bx;
Float by;


Circle[] circles;

void setup(){
  size(1000,1000);
  bx = (random(width));
  by = (random(height));
  bee = loadImage("bee.png");
  circles = new Circle[1000];
  for(int i = 0; i < circles. length; i++){
    circles[i] = new Circle(bx,by,0,0,0,random(width));
  }
}

void draw(){
  background(180,204,255);
  //image(bee,bx,by);
 for(int i = 0; i < circles.length; i++){
   circles[i].move();
   circles[i].displayC();
 }
 }













class Circle{
float x,y,angle,poop,poops,offset;


Circle(float _x, float _y, float _angle, float _poop, float _poops,float _offset ){
  x = _x;
  y = _y;
  angle = _angle;
  poop = _poop;
  poops = _poops;
  offset = _offset;
}


void move(){
  x = (poops - 1000)*cos(radians(angle/10))*sin(radians(angle));
  y = (poop - 1000)*sin(radians(angle))*cos(radians(angle*10));
  poop = (random(width));
  poops = (random(height));
   angle+= .2;
}


void displayC(){
  //ellipse(x+width/2+offset,y+height/2+offset,20,20);
  image(bee,x+width/2+offset,y+height/2+offset); 
  noStroke();
  smooth();
}
}

