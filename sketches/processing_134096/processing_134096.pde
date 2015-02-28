
//Assignment 2
//Evolution of a Line
//The program examines of a line into various shapes.
//I could have added more but ran out of time.
//You can use the link to show execution of the code

color[] palette = {#FFCD03, #54FF87, #24EBCB, #35B2FF, #2439EB, #8225FF};
float x, y;
float dY = 0;
float dX = 200;
int stage = 0;
int eSize = 5;
float eX, eY;
int eSizeX = 200;
int eSizeY = 200;

void setup() {
  size(800, 600);
  background(palette[0]);
  //noLoop();
}

void draw() {
  background(palette[0]); 
  if (stage==0) {
    dY =constrain(dY, 0, 200);
    dX =constrain(dX, 0, 200);
    strokeWeight(5);
    //stroke(palette[1]);
    //fill(palette[4]);
    noFill(); 
    x = 200;
    y = 400;

    beginShape();
    vertex(x, y);
    vertex(x+(2*dX), y);
    vertex(x+dX, y-dY);
    vertex(x, y);
    endShape(); 
    dY++;
    if (dY>199) dX--;
    if (dX<=0) dY -= 2;
    println(dY);
    if (dY==0) stage = 1;
  }
  if (stage==1) {
    eSize = constrain(eSize, 0, 200);
    fill(palette[1]);
    ellipse(x, y, eSize, eSize);
    eSize++;
    if (eSize>=199) {
      stage = 2;
      eX = x;
      eY = y;
    }
  }
  if (stage==2) {
    eX = constrain(eX, 0, 400);
    eY = constrain(eY, 300, 600);
    eX++;
    fill(palette[3]);
    ellipse(eX, eY, eSize, eSize);
    if (eX>=399) eY--;
    if (eY==300) stage = 3;
  }
  if (stage==3) {
    fill(palette[4]);
    ellipse(eX,eY,eSizeX,eSizeY);
    eSizeX++;
    eSizeY--;
  }
    
}



