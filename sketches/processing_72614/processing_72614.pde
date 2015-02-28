
int diam = 200;
int numCircles = 700;
Circle[] listofmycircles = new Circle[numCircles];
float noiseScale = 0.01;

void setup() {
  size (600,600);
  background (0);
  stroke (0);
  // constructing your circle
  for(int position = 0; position < numCircles; position +=1) {
    listofmycircles[position] = new Circle (random(100), 
                                            random(200), 
                                            random(107), 
                                            color(0,255,0),
                                            random(5),
                                            random(5));
  }
}
void draw() {
  fill (0/16);
  rect (0,0,width,height);
  for(int position = 0; position < numCircles; position +=1) {
    listofmycircles[position].update();
    listofmycircles[position].display();
  }
}

class Circle {
  //properties
  float x;
  float y;
  float diam;
  color circleColor;
  float velocityX;
  float velocityY;
  
  //constructor
  Circle(float arg1, float arg2, float arg3, color _circleColor, float _velocityX, float _velocityY) {
    x = arg1;
    y = arg2;
    diam = arg3;
    
    circleColor = _circleColor;
    velocityX = _velocityX;
    velocityY = _velocityY;
  }
  
  //methods
  void display() {
     float noiseVal = noise((x)*noiseScale, (y)*noiseScale);
     circleColor = color(noiseVal*255,random(0),0);
     fill(noiseVal*255,random(0),0);
     ellipse(x,y,diam,diam);
  }
  
  void update() {
    x = x + velocityX;
    if ((x<0) || (x>width)) {
      velocityX = -1*velocityX;
    }
    y = y + velocityY;
    if ((y<0) || (y>height)) {
      velocityY = -1*velocityY;
    }
  }
}
