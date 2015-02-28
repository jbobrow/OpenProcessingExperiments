
int num = 30;
int R = 200;

int heart_R;
int heart_val = 12;

void setup() {
  size(500, 500);
  background(255);
  smooth();
  noLoop();

  strokeJoin(ROUND);
}

void draw() {
  pushMatrix();
  translate(width/2, height/2);

  fill(255);
  strokeWeight(0.5);

  for (int q = 0; q < num;q++) {
    pushMatrix();
    translate(R*cos(radians(90 + 360 * q/num)), R*sin(radians(90 + 360 * q/num)));
    rotate(radians(360 * q /num)); 
    ellipse(0, 0, 50, 80);
    popMatrix();
  }

  for (int p = 0; p < num;p++) {
    pushMatrix();
    translate(R*cos(radians(360 * p/num)), R*sin(radians(360 * p/num)));
    rotate(radians(360 * p /num)); 
    ellipse(0, 0, 40, 30);
    popMatrix();
  }

  ellipse(0, 0, R*2, R*2);


  for (int j = 0; j < num;j++) {
    for (int i = 0;i < num; i++) {
      line(R*cos(radians(360 * j/num)), R*sin(radians(360 * j/num)), R*cos(radians(360 * i/num)), R*sin(radians(360 * i/num)));
    }
  }


  for (int i = 0; i < heart_val;i++) {
    heart_R = 160;
    pushMatrix();
    translate(heart_R*cos(radians(360*i/heart_val)), heart_R*sin(radians(360*i/heart_val)));
    rotate(radians(90 + 360*i/heart_val));
    fill(0);
    heart(1.5);
    popMatrix();

    heart_R = 120;
    pushMatrix();
    translate(heart_R*cos(radians(45 + 360*i/heart_val)), heart_R*sin(radians(45 + 360*i/heart_val)));
    rotate(radians(90 + 45 + 360*i/heart_val));
    fill(255);
    strokeWeight(3);
    heart(1);
    popMatrix();

    heart_R = 85;
    pushMatrix();
    translate(heart_R*cos(radians(360*i/heart_val)), heart_R*sin(radians(360*i/heart_val)));
    fill(0);
    ellipse(0, 0, 15, 15);
    popMatrix();
  }

  popMatrix();
}


void heart(float r) {

  beginShape();
  for (float i = 0; i< TWO_PI;i+=0.1) {
    curveVertex(calc_x(r, i), calc_y(r, i));
  }
  endShape(CLOSE);
}

float calc_x(float r, float t) {
  float x;

  x = r *(16 * sin(t) * sin(t) * sin(t));

  return x;
}

float calc_y(float r, float t) {
  float y;

  y = -1 * r * (13 * cos(t) - 5 * cos(2*t) - 2 * cos(3 * t) - cos(4 * t) );
  return y;
}



