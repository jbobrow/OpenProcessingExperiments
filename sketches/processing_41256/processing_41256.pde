
float x_position=random(width);
float x_speed=5;
float y_position=50;


void setup() {
  size(700, 250);
}

void draw() {
  background(200);
  stroke(255, 200, 0);
  strokeWeight(3);

  fill(242, 147, 226);
  stroke(0);
  strokeWeight(1);
  car(x_position, y_position, 50, 20);
  fill(59, 181, 255);
  car(x_position-100, y_position+50, 60, 40);
  fill(160, 255, 59);
  car(x_position+50, y_position+100, 40, 20);

  move();

  //bounce
  bounce();

  //display
  display(x_position);

  speed(x_speed);
}


void move() {
  x_position += x_speed;
}

void speed(float x) {
  if (y_position>=100) {
    x_speed = 10;
  }
}

void bounce() {
  if ((x_position > width) || (x_position < 0)) {
    x_speed = x_speed * -1;
  }
}

void display(float x) {
}

void car(float x, float y, float x_size, float y_size) {
  rect(x, y, x_size, y_size);
  fill(0);
  rect(x+3, y-4, 7, 4);
  rect(x+3, y+y_size, 7, 4);
  rect(x+x_size-10, y-4, 7, 4);
  rect(x+x_size-10, y+y_size, 7, 4);
} 

                
                
