
//Danielle Gorodenzik
// February 25 2013
//Homework 4

int circleX = 300;
int circleXSpeed = 5;


void setup() {
  size(600, 600);
}


void draw() {

  background(random(255));//outerspace
  //stars
  fill (242, 250, 23);
  ellipse (220, 400, 10, 10);
  ellipse (250, 150, 20, 20);
  ellipse (500, 160, 10, 10);
  ellipse (420, 190, 20, 20);
  ellipse (580, 10, 10, 10);
  ellipse (520, 100, 20, 20);
  ellipse (550, 140, 20, 20);
  ellipse (530, 550, 10, 10);
  ellipse (400, 550, 20, 20);
  ellipse (100, 210, 10, 10);
  ellipse (20, 150, 20, 20);



  fill (0, 242, random(255), 167); //alien spaceship
  noStroke();
  ellipse(circleX, mouseY, 200, 20);
  ellipse(circleX, mouseY, 100, 50);
  ellipse(circleX, mouseY, 60, 20);
  ellipse(circleX, mouseY, 50, 40);
  ellipse(circleX, mouseY, 40, 20);
  ellipse(circleX, mouseY, 40, 40);
  ellipse(circleX, mouseY, 60, 40);

  // more Stars
  fill (242, 250, 23);
  ellipse (10, 10, 10, 10);
  ellipse (50, 100, 20, 20);
  ellipse (500, 60, 10, 10);
  ellipse (400, 90, 20, 20);
  ellipse (600, 10, 10, 10);
  ellipse (250, 100, 20, 20);
  ellipse (50, 100, 20, 20);
  ellipse (350, 250, 10, 10);
  ellipse (400, 290, 20, 20);
  ellipse (600, 210, 10, 10);
  ellipse (250, 150, 20, 20);



  circleX = circleX + circleXSpeed;
  if (circleX > width) {  
    circleXSpeed = -5;
  }
  if (circleX < 0) {
    circleXSpeed = 5;
  }
}
