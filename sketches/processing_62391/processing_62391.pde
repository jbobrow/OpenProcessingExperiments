
int NumberofCars=2;

float [] xCoord=new float[NumberofCars];
float [] yCoord=new float[NumberofCars];
float [] xMove=new float[NumberofCars];
float [] yMove=new float[NumberofCars];


int xFrog = width/2;
int yFrog = 480;

void setup() {
  size(500, 500);
  xCoord[0]=10;
  yCoord[1]=10;
  for (int i = 0; i < NumberofCars; i++) {
    xCoord[i]= random(width);
    yCoord[i]= i*250+50;
    xMove[i]=random(-4, 4);
  }
}

void draw () { 
  background(87, 187, 232);
  drawBackground();          //background
  //frog
  fill(26, 95, 26);
  ellipse(xFrog, yFrog, 20, 20);
  ellipse(xFrog-5, yFrog-9, 10, 10);
  ellipse(xFrog+5, yFrog-9, 10, 10);
  fill(0);
  ellipse(xFrog-5, yFrog-9, 3, 3);
  ellipse(xFrog+5, yFrog-9, 3, 3);
  noStroke();
  noFill();

  //draw the cars at their location 

  for (int i = 0; i < NumberofCars; i++) {
    fill(111, 169, 219);
    rect(xCoord[i], yCoord[i], 33, 16);
    fill(255, 0, 0);
    rect(xCoord[i]-16, yCoord[i]+16, 66, 26);
    fill(0);
    ellipse(xCoord[i], yCoord[i]+43, 16, 16);
    ellipse(xCoord[i]+33, yCoord[i]+43, 16, 16);
    //moves cars across screen 
    xCoord[i]= xCoord[i] + xMove[i];

    noFill();

    if (xCoord[i]>width) {
      xCoord[i]=0;
    }
    if (xCoord[i]<0) {
      xCoord[i]=width;
    }
    //hit test 
    if (dist(xFrog, yFrog, xCoord[i], yCoord[i]) < 45) {

      xFrog = width/2;
      yFrog = 480;
    }
  }
}


void drawBackground() {
  background(72, 245, 73);


  fill(51, 52, 51);
  rect(0, 50, 500, 50);
  rect(0, 300, 500, 50);

  fill(239, 247, 32);
  rect(0, 70, 40, 10);
  rect(100, 70, 50, 10);
  rect(200, 70, 50, 10);
  rect(300, 70, 50, 10);
  rect(400, 70, 50, 10);
  rect(500, 70, 50, 10);

  fill(239, 247, 32);
  rect(50, 320, 50, 10);
  rect(150, 320, 50, 10);
  rect(250, 320, 50, 10);
  rect(350, 320, 50, 10);
  rect(450, 320, 50, 10);


  fill(8, 79, 139);
  rect(0, 150, 500, 100);
}

//controlkeys




void keyPressed() {
  if (key=='d')
    xFrog= xFrog+5;
  if (key=='a')
    xFrog= xFrog - 5;
  if (key=='s')
    yFrog= yFrog+5;
  if (key=='w')
    yFrog= yFrog - 5;
}


