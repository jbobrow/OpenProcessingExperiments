
//Valentina Pherson
//Creative Computing
//April 7, 2013
//Classes and Sin waves

Car[] traffic = new Car[27];
float incrementor = 0;
float xPos = 0;
 
void setup() {
  size(500, 500);
  background(0);
  for (int i=0; i<27; i++) {
    traffic[i]=new Car(int(random(255)), int(random(255)), int(random(255)), i*0, i*50);
  }
}
void draw() {
   background(0);
   incrementor += .02;//remove maybe?
   for (int i=0; i<27; i++) {
    stroke(230, 234, 28);
  }
  for (int i=0; i<27; i++) {
    stroke(0);
    traffic[i].drawCar();
    traffic[i].move();
  }
}
class Car {
  int r;
  int g;
  int b;
 
  float yOff = sin(incrementor) * 100;//maybe remove?
  
  Car(int _r, int _g, int _b, float _xPos, float _yPos) {
    r = _r;
    g = _g;
    b = _b;
 

    yOff = sin(incrementor) * 100;
  }
  
  void drawCar() {
    fill(r, g, b);
    rect(xPos, 250+ yOff, 100, 30); //I tried adding  [i] to yPos for these, but it didn't work
    ellipse(xPos + 10, 280+yOff, 10, 10);//I tried adding  [i] to yPos for these, but it didn't work
    ellipse(xPos + 80, 280+ yOff, 10, 10);//I tried adding  [i] to yPos for these, but it didn't work
    rect(xPos + 80, (250+yOff) +5, 15,10);//I tried adding  [i] to yPos for these, but it didn't work
  }
    void move() {
      xPos += 0.5; 
    yOff = sin(incrementor) * 100;
     if(xPos > width + 15){
    xPos = -15;
    }
  }
}
