
int mrgSpace;
int nBld;
int bWidth;
int bHeight;
int nWin;
int winWidth;
int winHeight;
int winSpace;
int rdHeight;
int nStars;
int sX;
int sY;
int winX;
int winY;
int mSpace;

float xPos;

color bColor;
color wColor;


void setup() {
  size(800, 600);
  noLoop();
  rdHeight=50;
  winWidth=15;
  winHeight=20;
  mSpace=5;
  bColor=#F2A057;
  wColor=#FFFAD1;
}

void draw() {
  //draws background
  background(#1E3A40);

  //assigns random values for number of stars
  nStars=int(random(90, 120));

  //draws stars
  for (int s=0;s<nStars;s++) {
    noStroke();
    pushMatrix();
    translate(int(random(0, width)), (random(0, height)));
    fill(#FFFFFF);
    ellipse(0, 0, 5, 5);
    popMatrix();
  }

  //assigns random value for number of buildings
  nBld=int(random(10, 30)); 

  //assigns random values to building variables 
  for (int n=0;n<nBld;n++) {
    stroke(1);
    bWidth=int(random(80, 160));
    bHeight=int(random(90, height/2));


    //draws buildings   
    pushMatrix();  
    xPos=int(random(bWidth, width-bWidth));
    translate(xPos, (height-rdHeight)-bHeight);
    fill(bColor);
    int bStart=-bWidth/2;
    rect(bStart, 0, bWidth, bHeight);
    popMatrix();


    //windows
    for (int x=0;x<bWidth-20;x=x+20) {
      for (int y=0;y<(bHeight-mSpace-winHeight);y=y+25) {
        pushMatrix();
        translate(xPos+mSpace, ((height-rdHeight)-bHeight*2)+mSpace);
        fill(wColor);    
        rect(bStart+x, bHeight+y, winWidth, winHeight);
        popMatrix();
      }
    }

    //draws the road
    fill (80,64);
    rect(0, height-rdHeight, width, rdHeight);
  }
}


