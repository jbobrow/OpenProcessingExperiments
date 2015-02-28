
float x_position = 10;
int x_speed = 10;

//float y_position = 10;
//int y_speed = 10;

void setup() {
  size(400, 400);

  PImage c;
  c = loadImage("clown-car.jpg");
  image (c, 10, 10, width/4, height/4);
}

void draw() {

  background(100);

  //move
  move();

  //bounce
  bounce();

  //display
  display(10, 200, 110);
  display(150, 100, 100);
  display(40, 300, 102);
  
}

void move () {
  x_position += x_speed;
}

// || - or (true || false) or && - (true && true) 

void bounce() {
  if ((x_position >= width-55) || (x_position <= 0)) {
    x_speed = x_speed * -1;
  }
}

// w = 90
// h = 50  float y, float w, float h
void display(float x, float y, float w) {
  fill (255, 0, 0);
  noStroke();
  rect(x, y, w, w - 80);
  rect(x+10, y -10, w - 30, w - 80);
  ellipse(x+20, y + 30, w - 90, w - 90);
  ellipse(x+70, y + 30, w - 90, w - 90);
  
}


distance (square) = (x2 - x1) + (y2 - y1)
WRITE A PITAGOREAN FUNCTION THAT SPITS OUT THE DISTANCE!

pow() !!!            
                
