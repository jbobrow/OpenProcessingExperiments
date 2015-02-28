
float x = 0;
float y = 100;
float speed = 1;

void setup() {
  size(800,400);
  noStroke();
};

void draw(){
  background(#ffffff);
  move();
  display();
 
};

void move() {
x = mouseX;
y = mouseY;
}

void display() {
 fill(#000000);
  arc(x, y-75, 150, 125, PI, 2*PI);
  rect(x-75,y-75,150,150);
  fill(#ffffff);
  ellipse(x,y-50,100,100);
  fill(#000000);
  triangle(x-50, y-100, x+50, y-100, x-50, y-50);
}



