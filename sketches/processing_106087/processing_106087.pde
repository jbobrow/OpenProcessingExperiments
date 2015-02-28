
int numCircle=5;
float []xPos= new float[numCircle];//explain what new int means
float []yPos= new float [numCircle];
float []xSpeed= new float[numCircle];
float []ySpeed= new float[numCircle];
float gravity=1;


void setup () {
  size (500, 500);
  smooth(); 
  noStroke(); 
  colorMode(RGB, 256);
  for (int apple = 0; apple < numCircle; apple++) {
    xPos[apple]=250;
    yPos[apple]=250;
    xSpeed[apple]=random(-2,2);
    ySpeed[apple]=random(-20,0);
  }
}

//missing arrays?

void draw() {
  background(255, 25, 0);
  fill(255, 105, 180, 200);
  for (int plum = 0; plum < numCircle; plum++) {
    if (xPos[plum] > width || xPos[plum]<0) {
      xSpeed[plum]=(xSpeed[plum]*-1); //-1 means you're subtracting number
    }
    if (yPos[plum] > height-25 || yPos[plum]<0) {
      if (yPos[plum]>height-25){
        yPos[plum]=height-25;}
      ySpeed[plum]=(ySpeed[plum]*-1);
    }
    ySpeed[plum]=ySpeed[plum]+gravity;
    xPos[plum]=xPos[plum]+xSpeed[plum];
    yPos[plum]=yPos[plum]+ySpeed[plum];
    ellipse (xPos[plum], yPos[plum], 50,50);
  }

 
}
