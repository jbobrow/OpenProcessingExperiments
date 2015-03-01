
void setup(){
  size(500,500);
  background(0);
}

float value1 = 255;
float value2 = 255;
float value3 = 255;
float value4 = 0;
float value5 = 0;
float value6 = 0;


 void draw(){
   fill(value1, value2, value3);
   ellipse (pmouseX, pmouseY, pmouseX, pmouseY);
   fill(value4,value5,value6);
  ellipse (pmouseX, pmouseY, pmouseX-125, pmouseY-125);
}
void keyPressed() {
  if (key == 'a' || key == 'A') {
    value1 = random(255);
    value2 = random(255);
    value3 = random(255);
    value5 = random(255);
    value4 = random(255);
    value6 = random(255);
  } else {
    value1 = 0;
    value2 = value1;
    value3 = value2;
    value5 = 255;
    value6 = 255;
    value4 = 255;
  }
  
}
  






