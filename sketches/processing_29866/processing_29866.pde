
simpleLine l[];
int lCnt = 6; // Number of triangle sets
 
//---------------------------------------------------------------
 
void setup() {
  size(900,900);
  smooth();
  PFont font;
  font = loadFont("Baskerville-48.vlw");
  textFont (font,48);
  textSize(12);
  textAlign(LEFT,CENTER);
  strokeWeight(1);
  l = new simpleLine[lCnt];
  for (int i=0; i<lCnt; i++)
    l[i] = new simpleLine(i);
}
 
//---------------------------------------------------------------
 
void draw() {
  background(100);
  for (int i=0; i<lCnt; i++)
    l[i].show();
}
 
//---------------------------------------------------------------
 
class simpleLine {
  PVector posA, posB, posC,posD;
  PVector dirA, dirB, dirC, dirD;
  int idx;
   
  simpleLine(int indexNum) {
    idx = indexNum;
    posA = new PVector();
    posB = new PVector();
    posC = new PVector();
     posD = new PVector();
    dirA = new PVector();
    dirB = new PVector();
    dirC = new PVector();
     dirD = new PVector();
    posA.x = random(width);
    posA.y = random(height);
    posB.x = random(width);
    posB.y = random(height);
    posC.x = random(width);
    posC.y = random(height);
     posD.x = random(width);
    posD.y = random(height);
    dirA.x = random(-1,5);
    dirA.y = random(-1,5);
    dirB.x = random(-1,5);
    dirB.y = random(-1,5);
    dirC.x = random(-1,5);
    dirC.y = random(-1,5);
        dirD.x = random(-1,1);
    dirD.y = random(-1,1);
  }
   
  void show() {
    posA.add(dirA);
    posB.add(dirB);
    posC.add(dirC); 
     posD.add(dirD); 
    if (posA.x < 0 || posA.x >= width)  dirA.x *= -1;
    if (posA.y < 0 || posA.y >= height) dirA.y *= -1;
    if (posB.x < 0 || posB.x >= width)  dirB.x *= -1;
    if (posB.y < 0 || posB.y >= height) dirB.y *= -1;
    if (posC.x < 0 || posC.x >= width)  dirC.x *= -1;
    if (posC.y < 0 || posC.y >= height) dirC.y *= -1;
     if (posD.x < 0 || posD.x >= width)  dirD.x *= -1;
    if (posD.y < 0 || posD.y >= height) dirD.y *= -1;
 // -------------------------------------------------------------------------   
    stroke(50);
    line(posA.x, posA.y, posB.x, posB.y);
    fill(60);
    text("Audrey ("+int(posA.x)+", "+int(posA.y)+")", posA.x, posA.y - 15);

   
   line(posB.x, posB.y, posC.x, posC.y); 
    fill(255);
    text("Isabella ("+int(posB.x)+", "+int(posB.y)+")", posB.x, posB.y - 100);

    
   line(posC.x, posC.y, posA.x, posA.y); 
    fill(0);
    text("Jeremy ("+int(posC.x)+", "+int(posC.y)+")", posC.x, posC.y - 1);

    
    line(posA.x, posA.y, mouseX, mouseY); 
    text("LOVE ("+int(mouseX)+", "+int(mouseY)+")", mouseX, mouseY - 1);
    line(posB.x, posB.y, mouseX, mouseY); 
    line(posC.x, posC.y, mouseX, mouseY); 
    
    fill(190,245,150);
    triangle(posA.x, posA.y, posB.x, posB.y,posC.x, posC.y);
    
    fill(0,200,200);
    triangle(posA.x, posA.y, posB.x, posB.y,mouseX, mouseY);
    
    fill(130);
    triangle(posA.x, posA.y, posC.x, posC.y,mouseX, mouseY);    
     
  }
  
}




