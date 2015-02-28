
//HW9
//Katherine(Kathy) Lee
//Copyright 2012

int [] numbers = { 10, 40, 66, 43, 22, 87, 20, 50, 19, 94 };
float r = random(0, 255);
float g = random(50, 150);
float b = random(150, 200);

void setup() {
  size (400, 400);
  textSize (30);
  background (r, g, b, 5);
  fill (255, 90);
  
  text("length of numbers : " + numbers.length, 10, height*.3);
  text("sum of array : " + findSum(), 10, height*.4);
  text("average of array : " + findAvg(), 10, height*.5);
  text("sum above avg #s : " + sumabvAvg(), 10, height*.6);
}


int findSum() {
  int sum = 0;
  for (int i = 0; i < numbers.length; i = i + 1)
  {
    sum = sum + numbers[i] ;
  }
  return sum;
}

float findAvg() {
  float sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    sum += numbers[i];
  }
  return sum/numbers.length;
}


int sumabvAvg() {
  int sum = 0;
  for (int i = 0; i < numbers.length; i++)
  {
    if (numbers[i] > findAvg())
    {
      sum = sum + numbers[i];
    }
  }
  return sum;
}




/*
int arraylength = 5;//edit for number of shapes
int [] radiusX = new int [arraylength];
int [] locationX = new int [arraylength];
int [] locationY = new int [arraylength];
float [] dx = new float[arraylength];
float [] dy = new float[arraylength];
color[] arrayColor1 = new color[arraylength];
color[] arrayColor2 = new color[arraylength];
float rot;


void setup() {
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
  size(500,500);
  background(255);
  radiusXSetup();
  arrayColorSetup();
  dSetup();
  locationX();
  locationY();
}
void draw() {
  prepWindow();
  drawShapes();
  MoveAndBounceShapes();
}


void drawShapes() {
  for(int i = 0; i< arraylength; i ++) {
    rot = rot + (dy[i]/5+dx[i]/5);
    pushMatrix();
    translate(locationX[i],locationY[i]);
    rotate(radians(rot));
    stroke(0);
    line(-radiusX[i]/1.5, -radiusX[i]/1.5, radiusX[i]/1.5,  radiusX[i]/1.5);
    line(radiusX[i]/1.5,  -radiusX[i]/1.5, -radiusX[i]/1.5, radiusX[i]/1.5);
    noStroke();
    fill(arrayColor1[i]);
    ellipse(0,0, radiusX[i], radiusX[i]);
    fill(arrayColor2[i]);
    rect(0,0, radiusX[i]/1.5, radiusX[i]/1.5);
    stroke(0);
    line(radiusX[i]/1.5,                0, -radiusX[i]/1.5,  0);
    line(0,               -radiusX[i]/1.5,               0,   radiusX[i]/1.5);
    popMatrix();
    
} }


void mouseClicked(){
  arrayColorSetup();
}
void keyPressed(){
  dSetup();
}

void prepWindow() {
  background(255);
}
 
void dSetup() {
  float a = random(-2.5,2.5);
  float b = random(-2.5,2.5);
  for (int i = 0; i<arraylength; i++) {
    dy[i] = a;
    dx[i] = b;
} }

void arrayColorSetup() {
  for (int i = 0; i<arrayColor1.length; i++) {
    arrayColor1[i] = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    arrayColor2[i] = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
    
} }
 
void locationX() {
  for ( int i = 0; i < locationX.length; i ++) {
    locationX[i] = int(random(0+radiusX[i],width-radiusX[i]));
} }
 
void locationY() {
  for ( int i = 0; i < locationY.length; i ++) {
    locationY[i] = int(random(0+radiusX[i],height-radiusX[i]));
} }
 
void radiusXSetup() {
  for ( int i = 0; i < radiusX.length; i ++) {
    radiusX[i] = round(random(25,75));
} }
 
void MoveAndBounceShapes() {
  moveEllipse();
  for(int i = 0; i<arraylength; i++) {
    if(locationX[i] >= width - radiusX[i]/2) {
      locationX[i] = radiusX[i]/2;
    }
    else if(locationX[i]<=0 + radiusX[i]/2) {
      locationX[i] = width - radiusX[i]/2;
    }
    if(locationY[i] >= height - radiusX[i]/2) {
      locationY[i] = radiusX[i]/2;
    }
    else if(locationY[i] <= 0 + radiusX[i]/2) {
      locationY[i] = height-radiusX[i]/2;
    }
} }
 
void moveEllipse() {
  for(int i = 0; i<arraylength; i ++) {
    locationY[i] += dy[i];
    locationX[i] += dx[i];
} }

*/
