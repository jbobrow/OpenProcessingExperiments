
float number_to_sign=0;
float number_to_sign2=0;
float number_to_sign3=0;
float number_to_sign4=0;
float amp=(PI/2)/2;
float angle = 0;
float offset = 60;
float scalar = 2;
float speed = 0.05;

void setup() {
  size(500, 500);
  smooth();
}

void draw() {

  background(random(255));
  fill(255);
  noStroke();
  float x = offset + cos (angle) * scalar;
  float y = offset + sin (angle) * scalar;
  ellipse(x, y, 4, 4);
  angle += speed;
  scalar += speed;

  float pos= (amp*cos(millis()/800.0));
  translate(width/3, 0);
  rotate(pos);
  stroke(255);
  line(0, 0, 0, 200);
  fill(200, 0, 0);
  noStroke();
  ellipse(0, 200, 30, 30);

  fill(0);
  noStroke();
  ellipse(250, 250, 100, 100);
  float y_value=sin(number_to_sign)*50;
  float x_value=cos(number_to_sign)*50;
  y_value +=height/2;
  x_value+=width/2;
  number_to_sign+=.01;
  stroke(255);
  line(width/2, height/2, x_value, y_value);

  fill(200);
  noStroke();
  ellipse(100, 100, 100, 100);
  float y_value2=sin(number_to_sign2)*50;
  float x_value2=cos(number_to_sign2)*50;
  y_value2 +=height/5;
  x_value2+=width/5;
  number_to_sign2+=.01;
  stroke(255);
  line(width/5, height/5, x_value2, y_value2);

  fill(100);
  noStroke();
  ellipse(380, 380, 100, 100);
  float y_value3=sin(number_to_sign3)*50;
  float x_value3=cos(number_to_sign3)*50;
  y_value3 +=height;
  x_value3+=width;
  number_to_sign3+=.01;
  stroke(255);

  fill(100);
  noStroke();
  ellipse(0, 0, 100, 100);
  float y_value4=sin(number_to_sign4)*50;
  float x_value4=cos(number_to_sign4)*50;
  y_value4 +=height/10;
  x_value4+=width/10;
  number_to_sign4+=.01;
  stroke(255);
}



