
char shapeToDraw;
int gState;



void setup() {
  size(500, 500);
  smooth();
  background(255);
  colorMode(HSB);
  shapeToDraw = 'c';
  shapeToDraw = 'r';
  shapeToDraw = 't';
  rectMode(CENTER);
  gState=0;
}

void draw() {
  if(gState==0){
    fill(0);
   text("Drag To Draw", width/2, height/2); 
   if(mousePressed) {
     gState=1;
     background(255);
   }
    
  }
  if(gState==1){

    float myColor = dist(mouseX, mouseY, pmouseX, pmouseY);
    myColor*=10;

    fill(myColor, 255, 255, 70);
    stroke(0);
    if (shapeToDraw == 'c') {
      ellipse(mouseX, mouseY, 50, 50);
    }
    if (shapeToDraw=='r') {
      rect(mouseX, mouseY, 50, 50);
    }
    if (shapeToDraw =='t') { 
      triangle(mouseX, mouseY-30, mouseX+30, mouseY, mouseX-30, mouseY);
    }

    //draw shapes on bottom
    if (dist (mouseX, mouseY, 50, 450)<30) fill(175, 172, 172); 
    else fill (0);
    rect(50, 450, 60, 60);
    if (dist (mouseX, mouseY, 220, 450)<30) fill(175, 172, 172); 
    else fill (0);
    ellipse(220, 455, 60, 60);
    if (dist (mouseX, mouseY, 390, 490)<30) fill(175, 172, 172); 
    else fill (0);
    triangle(390, 490, 450, 490, 420, 430);
    //IF IT IS GREATER THAN 450 DON'T LET THE SHAPES DRAW
  }
}
void mousePressed() {
  checkShapebutton(mouseX, mouseY);
}

void checkShapebutton(float x, float y) {
  float distancerect = dist(x, y, 50, 450);
  if (distancerect <30) {
    shapeToDraw = 'r';
  }
  float distancecirc = dist(x, y, 200, 450);
  if (distancecirc <30) {
    shapeToDraw = 'c';
  }

  float distancetriangle = dist(x, y, 390, 490);
  if (distancetriangle <30) {
    shapeToDraw='t';
  }
}

