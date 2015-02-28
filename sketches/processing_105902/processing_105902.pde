
void setup() {
  size(900, 600);
}

int numberX=18;
int numberY=16;
float r=10;
float gap=15;
float posX;
float posY;
float rad =10;


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

          ellipse(posX+(gap/((gap+2*r)*sqrt(2))*(posX-mouseX))/m, posY-(gap/((gap+2*r)*sqrt(2))*(mouseY-posY))/m, 2*r, 2*r);
        }

        // else {


        //   ellipse(posX, posY, 2*r, 2*r);
        //  }
      }
    }
  }
}



