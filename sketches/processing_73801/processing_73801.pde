
float beginX = 0.0; 
float beginY = 10.0;  
float endX = 570.0;   
float endY = 320.0;   
float distX;         
float distY;          
float exponent = 4;  
float x = 0.0;        
float y = 0.0;        
float step = 0.01;   
float pct = 0.0;      
int EXX[] = new int[50];
int EXY[] = new int[50];
boolean EXstart = false;
boolean Cstart = false;
boolean Dstart = false;
boolean Cplus = false;


void setup()
{
  size(500, 500);
  smooth();
  noStroke();

  distX = endX - beginX;
  distY = endY - beginY;
  for (int x = 10; x < 60; x++) {
    EXX[x-10] = x;
  }
  for (int x = 10; x < 30; x++) {
    EXY[x-10] = x;
  }
}

void draw()
{
  frameRate(200);
  baseD();

  if (keyPressed) {
    if (key == 'C'|| key =='c') { 
      EXstart = true;
    }
  }
  if (EXstart) {
    projectEX();
  }
  if (keyPressed) {
    if (key == 'X'|| key =='x') { 
      drawC();
    }
  }
  if (keyPressed) {
    if (key == 'Z'|| key =='z') { 
      drawC();
      Cdraw();
    }
  }
}

void drawC() { //circle brush
  int C1 = int(random(0, 255));
  int C2 = int(random(0, 255));
  int C3 = int(random(0, 255));
  int width = int(random(50, 100));
  int height = int(random(30, 120));
  ellipse(mouseX, mouseY, width, height);
  fill(C1, C2, C3, 120);
}

void baseD() { //first brush

  ellipse(mouseX, mouseY, 15, 15);


  if (keyPressed) {
    if (key == 'q' || key =='Q') { 
      fill(255, 0, 0);
    }

    if (key =='w' || key =='W') {
      fill (0, 255, 0);
    }
    if (key =='e' || key == 'E') {
      fill ( 0, 0, 255);
    }
    if ((key == 'q' || key =='Q') && mousePressed) { 
      fill(255, 255, 0);
    }
    if ((key == 'w' || key =='W') && mousePressed) { 
      fill(0, 255, 255);
    }
    if ((key == 'e' || key =='E') && mousePressed) { 
      fill(255, 0, 255);
    }
  }
}
void Cdraw() { //circle brush plus 


  ellipse(mouseX, mouseY, 15, 15);
  if (pmouseX - 5 > mouseX || pmouseX + 5 < mouseX) {
    for (int x = 0; x <= abs(pmouseX -mouseX); x++)
      ellipse(mouseX-x, mouseY, 15, 15);
  }
  if (pmouseY - 5 > mouseY || pmouseY + 5 < mouseY) {
    for (int x = 0; x <= abs(pmouseY -mouseY); x++)
      ellipse(mouseX, mouseY-x, 15, 15);
  }
  if ((pmouseY - 5 > mouseY || pmouseY + 5 < mouseY) && ( pmouseX - 5 > mouseX || pmouseX + 5 < mouseX)) {
    for (int x = 0; x <= abs(pmouseX -mouseX); x++)
      ellipse(mouseX-x, mouseY-x, 15, 15);
  }

  if (keyPressed) {
    if (key == 'q' || key =='Q') { 
      fill(255, 0, 0);
    }

    if (key =='w' || key =='W') {
      fill (0, 255, 0);
    }
    if (key =='e' || key == 'E') {
      fill ( 0, 0, 255);
    }
    if ((key == 'q' || key =='Q') && mousePressed) { 
      fill(255, 255, 0);
    }
    if ((key == 'w' || key =='W') && mousePressed) { 
      fill(0, 255, 255);
    }
    if ((key == 'e' || key =='E') && mousePressed) { 
      fill(255, 0, 255);
    }
  }
}
void projectEX() {
  ellipse(20, 26, 10, 10);
  fill(0, 2);
  rect(0, 0, width, height);
  pct += step;
  if (pct < 1.0) {
    x = beginX + (pct * distX);
    y = beginY + (pow(pct, exponent) * distY);
  }
  fill(255);
  ellipse(x, y, 20, 20);
  if (mousePressed) {
    pct = 0.0;
    beginX = x;
    beginY = y;
    endX = mouseX;
    endY = mouseY;
    distX = endX - beginX;
    distY = endY - beginY;
  }



  int C1 = int(random(0, 255));
  int C2 = int(random(0, 255));
  int C3 = int(random(0, 255));
  for (int a = 0; a < 50 ; a++) {
    for (int b = a; b< 50; b ++) {

      if (mouseX == EXX[a] && mouseY == EXY[b]) {




        fill(random(0, 255), random(0, 255), random(0, 255));
        ellipse(x +random(0, 100), y + random(0, 10), random(100, 150), random(50, 100));
        ellipse(x +random(0, 100), y + random(0, 100), random(100, 150), random(50, 100));
        ellipse(x +random(0, 100), y + random(0, 10), random(100, 150), random(50, 100));
        ellipse(x +random(0, 100), y + random(0, 100), random(100, 150), random(50, 100));
        ellipse(x +random(0, 100), y + random(0, 10), random(100, 150), random(50, 100));
        ellipse(x +random(50, 150), y + random(0, 100), random(100, 150), random(50, 100));

        ellipse(x +random(50, 150), y + random(0, 100), random(100, 150), random(50, 100));





        EXstart = false;
      }
    }
  }
}


