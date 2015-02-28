
// ONE BOUNCING BALL
float xPosition;
float yPosition;
int xDirection = 1;
int yDirection = 1;
float ballSize = random(500);
float speed = 2;
int[] x = {50,100,300,50,10,30,300};
int[] y = {50,100,300,50,10,30,300};

void setup() {
  size(400, 400);
}

void draw() {
  //background(0);
  for(int i = 0; i < 6; i++){

  // BOUNCE OFF RIGHT
  if (x[i] > width-ballSize/2) {
    xDirection = -1;
  } 
  else if (x[i] < ballSize/2) {
    xDirection = 1;
  } 
  else if (y[i] > height-ballSize/2) {
    yDirection = -1;
  } 
  else if (y[i] < ballSize/2) {
    yDirection = 1;
  }

  x[i] += speed * xDirection;
  y[i] += speed * yDirection;
  
  
  
fill(random(255),random(255),random(255),random(255));
  ellipse(x[i], y[i], ballSize, ballSize);
  x[i] += i;
  if(x[i] > width){
    x[i] = 0;
  }
}
}


