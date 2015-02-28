
int lineLength;
int x;
int y;
int howManySets;


void setup() {
  size (300, 300);
}

void draw() {
  background(255);

  x=mouseX;
  y=mouseY;
  howManySets==int(random(1, 4));

  for (int i = 0; i < howComplex; i++) {
    lineLength=250;


    for (int j = 0; j < 7; j++) {

      float antennaRight=x+10*j*linelength;
      float antennaLeft=x-10*j*linelength;
      float antennaY=y-10*j*linelength;

      line(x, y, antennaRight, antennaY);
      ellipse(antennaRight, antennaY, 5, 5);

      line(x, y, antennaLeft, antennaY);
      ellipse(antennaLeft, antennaY, 5, 5);

      //ellipse(x-30,y-20,5,5);
      //ellipse(x-30,y-20,5,5);
    }
  }



  line(x, y+25, x, y+275);
}



