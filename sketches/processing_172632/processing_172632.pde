

float speedX = 6;
float speedY = 2.5;

//first big rect 
float big1X = 235;
float big1Y = 200;
float big1Width = 150;
float big1Height = 200;

//small rect 
float small1X = 235;
float small1Y = 200;
float small1Width = 70;
float small1Height = 90;




void setup() {
  size(600, 600);
  background(255);
  smooth();
}

void rect1() {
  noFill();
  stroke(0);
  strokeWeight(4);
  rect(big1X, big1Y, big1Width, big1Height); 
}

void rect2() {
  fill(255);
  stroke(0);
  strokeWeight(4);
  rect(small1X, small1Y, small1Width, small1Height);
}




void lines() {
  stroke(150);
  strokeWeight(1);
  line(235, 200, small1X, small1Y);
  line(235, 400, small1X, small1Y + small1Height);
  line(small1X + small1Width, small1Y, 385,200);
  line(small1X + small1Width, small1Y + small1Height, 385, 400);

}

void move() {
  small1X = small1X + speedX;
  small1Y = small1Y + speedY;
}


void bounce() {
  if (small1X>width-small1Width) {
    speedX = speedX * -1;
  }
  if (small1X<0) {
    speedX = speedX * -1;
  }
  if (small1Y>height-small1Height) {
    speedY = speedY * -1;
  }
  if (small1Y<0 ) {
    speedY = speedY * -1;
  }
}

void gravity() {
  speedY += 0.2;


}

void draw() {
  background(255);
  rect1();
  lines();
  rect2();
  move();
  bounce(); 
  gravity();
}





