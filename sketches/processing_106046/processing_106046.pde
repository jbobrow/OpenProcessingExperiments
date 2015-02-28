
//declare array for
int balls = 50;
int [] posX=new int [balls];
int [] posY=new int [balls];
int [] speedX=new int [balls];
int [] speedY=new int [balls];
int [] hue = new int [balls];
int [] opacity = new int [balls];
int [] diameter=new int [balls];


int brush = 20; //brush size for painting color

//int [] gravity= new int [balls];
float gravity;
void setup() {
  size (500, 500);
  noStroke();
  colorMode(HSB, 255);

  //values
  for (int i=0;i<balls;i++) {
    posX[i]=int(random(0, width));
    posY[i]=int(random(0, height));
    speedX[i]=int(random(1, 5));
    speedY[i]=int(random(2, 8));
    hue[i]=int(random(100, 130));
    opacity[i]=int (random(50, 150));
    diameter[i]=int (random(10, 25));
    // gravity[i]=int(0.1);
    gravity=0.3;
  }
  //brush
  for (int i=0;i<balls;i++) {
    fill(hue[i], 255, 255);
    ellipse(mouseX, mouseY, brush, brush);
  }
}

//set of balls here.
void draw() {
  background(189, 255, 175);
  for (int i=0;i<balls;i++) {
    posX[i]=posX[i]+speedX[i];
    posY[i]=posY[i]+speedY[i];
    fill (hue[i], 255, 255, opacity[i]);
    ellipse(posX[i], posY[i], diameter[i], diameter[i]);
  }
  wallBounce();
  erase();
}

//funtions!!!

//make balls bounce off the walls
void wallBounce() {
  for (int i=0;i<balls;i++) {
    if (posX[i]>width-diameter[i]/2) {
      speedX[i]=-speedX[i];
      posX[i]=width-diameter[i]/2;
    }
    if (posX[i]<diameter[i]/2) {
      speedX[i]=-speedX[i];
      posX[i]=diameter[i]/2;
    }
    if (posY[i]>height-diameter[i]/2) {
      speedY[i]=-speedY[i];
      posY[i]=height-diameter[i]/2;
    }

    if (posY[i]<diameter[i]/2) {
      speedY[i]=-speedY[i];
      posY[i]=diameter[i]/2;
    }
  }
}

void keyPressed() {
  for (int i=0; i<balls; i++) {
    //function gravity
    if (key==CODED) {
      if (keyCode==DOWN) {
        speedY[i]=speedY[i]+int(gravity);
        if (posY[i]>height-diameter[i]/2) {
          speedY[i]=speedY[i]*-int(0.5);
        }
      }
      //move to the edge
      if (keyCode==LEFT) {
        posY[i]=height-diameter[i]/2;
      }
    }
    //reset to random
    if (keyCode==UP) {
      posX[i]=int(random(0, width));
      posY[i]=int(random(0, height));
    }
  }
}
//pain over function
void erase() {
  for (int i=0;i<balls;i++) {
    if (dist(mouseX, mouseY, posX[i], posY[i])<brush) {
      hue[i]=147; //paint different color over rain
    }
  }
}



