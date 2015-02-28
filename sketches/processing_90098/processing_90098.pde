
/*Nafis S Sabir
 Prof. Calli Higgins
 HW 3.2.3*/

int x = 300;//ellipse x location
float y = random(600);//random ellipse y location
int speed = 2;//x-axis speed change
int bounce = 2;//y-axis speed change
float color1 = random(50);//random float color


void setup() {
  size(600, 600);//screen size
}

void draw() {
  background(0);//background color
  fill(255);//starting fill for bounce ball
  ellipse(x, y, 100, 100);//ball size


  if (x > width) {
    speed = speed * -1;//if the ball exceeds the right boundary it changes direction
  }
  else if (x < 0) { 
    speed = speed * -1;//if the ball exceeds the left boundary it changes direction
  } 
  else if (y > height) {
    bounce = bounce * -1;//if the ball exceeds the top boundary it changes direction
  } 
  else if (y < 0) {
    bounce = bounce * -1;//if the ball exceeds the bottom boundary it changes direction
  }
  else if (keyPressed) {
    fill(mouseX, mouseY, color1);//if keyPressed random color change depending on mouse location
    ellipse(x, y, 300, 300);//if keyPressed ball grows
  }

  x = x + speed;//moves the ball left and right
  y = y + bounce;//moves the ball up and down
}



