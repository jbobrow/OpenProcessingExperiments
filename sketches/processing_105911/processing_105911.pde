
int number=10;
int[] balls= new int[number];
int ypos=height/2;
int direction=1;

void setup () {
  size(400, 400);
  smooth();
  noStroke();

  //this sets the value of each feild in the array
  for (int i=0; i<number;i++) {
    balls[i]=35*i+20;
  }
}

void draw() {
  background(255);
  fill(2,186,229);
  ypos+=direction;
  //this sets the direction of the balls
  if (ypos>=height || ypos<=0) {
    direction=(direction*-1);
  }

  //this draws the balls
  for (int i=0; i<number; i++) {
    ellipse(balls[i], ypos, 20, 20);
  }
}



