
int counter;
// Konkuk University 
// Department of Dynamic Media 
// SOS iDesign 
// Name: KIM Sunhyun
// ID:201420067 

int x = 0;
int y = 0;
int speed = 3;     

void setup() {
  size(600, 600);
  smooth();
}

void draw() {
  background(255);
  pushMatrix(); 

  x = x + speed;

  popMatrix();
  if ((x > width) || (x < 0)) {
    speed = speed * -1;
    if ((y > height) || (y < 0)) 
      speed = speed * -1;
    for (int i = 0; i < 10; i = i +1) {
      line(10, 10, 10, 10);
    }
  }
  stroke(0);
  strokeWeight(2);
  fill(x);

  strokeWeight(3);
  ellipse(500, x+200, y, 500);
  ellipse(450, x+200, y, 500);
  ellipse(390, x+200, y, 500);
  ellipse(100, x+200, y, 500);
  ellipse(x+200, 500, 500, y);
  ellipse(x+200, 500, 500, y); 
  strokeWeight(1);
  ellipse(x+200, 400, 800, y);
  ellipse(x+200, 30, 1000, y);
  strokeWeight(7);
  ellipse(190, x-100, y, 650); 
  strokeWeight(3);

  strokeWeight(6);
  ellipse(470, x+400, y, 470);
  ellipse(x+400, 470, 470, y);
  strokeWeight(10);
  ellipse(x+100, 100, 750, y);
  strokeWeight(3);
  ellipse(x+100, 150, 550, y);
  ellipse(x+100, 200, 550, y);
  strokeWeight(1);
  ellipse(60, x+200, y, 800);
  ellipse(120, x+200, y, 600);
  ellipse(540, x+200, y, 900);
  strokeWeight(6);
  strokeWeight(30);
  stroke(x);
  line(y+600, x, y+600, y+600);
  line(x, y+600, y+600, y+600);

  //scale(30);
  //color(0);

  translate(100, 100, 400);
}
