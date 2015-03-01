

float a = -200;
float b = 50;

void setup() {
  size(400, 400);
  background(0);

}


void draw() {

  stroke(255);
  rect(350,350,25,25);

a=a+.8;
line(50,350,350,50);
stroke(255);
translate(width/2, height/2);
rotate(PI/4.0);
rect(a, -26, a, 52, b, b, b, b);
stroke(200,10,10);



}


