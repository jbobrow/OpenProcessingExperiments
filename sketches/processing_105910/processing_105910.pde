
void setup() {
  size(900, 600);
}

int numberX=18;                //number of balls in X axis
int numberY=16;                //number of balls in Y axis
float r=10;                    //radius of ball
float gap=15;                  //distance between balls
float posX;                    // the centre of each ball
float posY;
float rad =10;                //radius of fade off


void draw() {
  background(255);



  for (int i=0;i<numberX;i++) {
    for (int n=0;n<numberY;n++) {
      posX=width/2-(numberX*r)-gap*(numberX-1)/2+r+i*(gap+2*r);
      posY=height/2-(numberY*r)-gap*(numberY-1)/2+r+n*(gap+2*r);
      fill(255);
      if (dist(posX, posY, mouseX, mouseY)<=r) {
        fill(0);
      }

      for (int m=0;m<rad;m++) {
        if (dist(posX, posY, mouseX, mouseY)<=2*m*(gap/2+r)*sqrt(2) ) {
          noStroke();
          fill(0+255/rad*m);
          ellipse(posX+(gap/((gap+2*r)*sqrt(2))*(posX-mouseX))/m, posY-(gap/((gap+2*r)*sqrt(2))*(mouseY-posY))/m, 2*r, 2*r);
        }

        // else {
        //   ellipse(posX, posY, 2*r, 2*r);
        //  }
      }
    }
  }
}


