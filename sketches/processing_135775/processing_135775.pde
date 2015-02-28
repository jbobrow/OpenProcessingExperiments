

float startAngle = 0;
float angleVel = 0.1;



void setup() {
  size(800, 800);
  smooth();
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(1);



  startAngle += 0.015;  //controls speed of wave
  float angle = startAngle; //this will make it stop moving with a static number
  //float angle = startAngle;


  //  Curve Syntax:  curve(x1, y1, x2, y2, x3, y3, x4, y4)
  //x1  float: coordinates for the beginning control point
  //y1  float: coordinates for the beginning control point
  //x2  float: coordinates for the first point
  //y2  float: coordinates for the first point
  //x3  float: coordinates for the second point
  //y3  float: coordinates for the second point
  //x4  float: coordinates for the ending control point
  //y4  float: coordinates for the ending control point
  //  curve(startAngle, mouseY, 0, 0, width/2, height/2, angle, mouseY); 

  for (int x = 1; x <= width/2; x += 24) {  //NoC example NOC_3_09
    float y = map(sin(angle), -1, 1, 0, height/2);
    //fill(109, 24, 170);
    ellipse(x, y, 10, 5);  //the original code
    ellipse(x + 10, y + 10, 10, 5); 
    //ellipse(x-1, y-1, 10, 5); 
    angle += angleVel;
  }
}



