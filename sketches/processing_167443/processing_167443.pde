

//import processing.pdf.*;

float k = 0;
float num = -500;

void setup() {
  size(640, 640);
  background(255);
  smooth();
  strokeWeight(2);
  //beginRecord(PDF, "every.pdf");
}

void draw() {

  stroke(k, 100, 400, 60);
  k= k+1;
  if(k>300){
    k=0;
  }
  translate(width/2, height/2);
  
  for (int i = 0; i < 360; i+=20) {

    float x = sin(radians(i+num)) * num;
    float y = cos(radians(x)) * num;
    point(x, y);
    point(y, x);
    point(-x, -y);
    point(-y, -x);
  }
  
  if (num < 270) num += 0.5;
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}

