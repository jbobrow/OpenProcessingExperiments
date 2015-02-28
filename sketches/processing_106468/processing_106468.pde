
Revolving_Door times_SQ;
Revolving_Door fortyfifth;
Revolving_Door eigth_Ave;
Revolving_Door bedford;
PImage map;

color ace = color(0);
color L = color(34,89,123);

void setup(){
  
size(800,1200, P3D);
background(255);
map = loadImage("subwaymap.jpg");

times_SQ = new Revolving_Door(86,615,100, ace);
fortyfifth = new Revolving_Door(86,99,20, ace);
eigth_Ave = new Revolving_Door(86,747, 60,ace);
bedford = new Revolving_Door(549,747,80,ace);


}

void draw(){
  
  image(map,0,0);
 

  times_SQ.spin(.3);
  fortyfifth.spin(.01);
  eigth_Ave.spin(.05);
  bedford.spin(.09);


println(mouseX);
println(mouseY);


}

class Revolving_Door {
  int x;
  int y;
  float angle;
  float speed;
  int xCenter;
  int yCenter;
  float doorSize;
  color routeColor;

  boolean spin;

  Revolving_Door(int _xCenter,int _yCenter, float _doorSize, color _routeColor) {
    x = 20;
    y = 20;
    angle = 0.5;
    speed = 0.005;
    xCenter = _xCenter;
    yCenter = _yCenter;
    doorSize = _doorSize;
    routeColor = _routeColor;
   }

  void spin(float speed){
    angle = angle + speed;

pushMatrix();
translate(xCenter, yCenter);
rotateZ(angle);

  stroke(routeColor);
  strokeWeight(doorSize * 0.1);
  line(0, 0, (1*doorSize), (0 * doorSize));


  stroke(routeColor);
  strokeWeight(doorSize * 0.1);
  line(0, 0, -0.5 * doorSize, 0.87 * doorSize);


  stroke(routeColor);
  strokeWeight(doorSize * 0.1);
  line(0, 0, -.5 *doorSize, -0.87 * doorSize);

  fill(routeColor);
  ellipse(0, 0, doorSize * 0.6, doorSize* 0.6);
  noStroke();
  fill(255);
  ellipse(0, 0, doorSize * 0.5, doorSize * 0.5);


  popMatrix();
}


void display(){
    x = 20;
    y = 20;
    angle = 0.5;
    speed = 0.005;
xCenter = 100;
yCenter = 100;
    doorSize = 100;
    routeColor = color(56, 34, 123);
}

}



