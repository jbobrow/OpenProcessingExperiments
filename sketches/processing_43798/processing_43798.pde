
//where I declare my object of type rainDrop

rainDrop [] myDrop;

int noDrops=20;
int colour1=255;
int colour2=255;
int colour3=255;
int externalVariable1=50;
int externalVariable2=50;
int externalVariable3=50;
PFont explanation;

void setup() {

  size(640, 480);
  smooth();

  // say how long array is

  myDrop = new rainDrop[noDrops];

  //fo each index make a drop

  for (int i=0; i<noDrops; i++) {

    myDrop[i]=new rainDrop(i*(width/noDrops), -20, int(random(1, 15)), colour1, colour2, colour3);
  }
}

void draw() {

  background(0);

  fill (255);
  explanation = createFont("FFScala", 12);
  textFont(explanation);
  text("Click the mouse to change the colour of the raindrops. The left mouse button calls variables within the class, the middle variable in the main sketch. The Right button resets the raindrops to white.", 10, 430, 630, 470);

externalVariable1=int(random(255));
externalVariable2=int(random(255));
externalVariable3=int(random(255));

  for (int i=0; i<noDrops; i++) {
    myDrop[i].move();
    myDrop[i].showDrop();
    myDrop[i].mousePressedLeft();
    myDrop[i].mousePressedRight();
    myDrop[i].mousePressedCenter();
  }
}






