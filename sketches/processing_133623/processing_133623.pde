
int resolution = 100;
float radius = 300;
float circleX;
float circleY;

Brush [] myBrushs; 

void setup() {
  size (800, 600);
  colorMode(HSB, 255);
  frameRate(60);
circleX = width * 0.5;
circleY = height *0.5;

  //state length
  myBrushs = new Brush[100];
  //fill every index position with a new object
  for (int i=0; i<myBrushs.length; i=i+1) {
    //float newX = map( i, 0, myBrushs.length,0,width);
    float newHue = map(i, 0, myBrushs.length, 0, 255);
    color newColor = color( newHue, 255, 255);
    myBrushs [i] = new Brush(newColor);
  }
}

void draw () {
  noStroke();
  fill(200, 30);
  rect(0, 0, width, height);
  beginShape();
  for (int i =0;i<resolution; i++){
    float angle = map(i, 0, resolution, 0, TWO_PI);
    float circleOffX = cos(angle) * radius;
    float circleOffY = sin(angle) * radius;
    float x = circleX + circleOffX;
    float y = circleY + circleOffY;
    fill(0, 0, 0);
    vertex(x, y);
  
  }

  endShape(CLOSE);
  
  for (int i=0; i<myBrushs.length; i=i+1) {
    myBrushs[i]. update();
    myBrushs[i]. display();
  }

}
class Brush {
  float x;
  float y;
  color strokeColor;

  // constructor
  Brush( color theColor) {
    x = random(-100, 100);
    y = random(-100, 100); //  position of hair
    strokeColor = theColor;
  }

  void update() {
    x = x + random (-1, 1);
    y = y + random (-1, 1);
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(random(-50, 15)));// radians convert ( degree) 
    stroke(strokeColor);
    noFill();
    line ( x, y, 0, 0);

    popMatrix ();
  }
}



