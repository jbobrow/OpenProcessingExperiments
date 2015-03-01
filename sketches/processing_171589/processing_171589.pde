
int kiwi;

void setup() {  //setup function called initially, only once
background (230, 28, 105);
size (250, 300);

  }

void draw() {  //draw function loops 
  fill (255,182,193);
  ellipse(56+kiwi, 46+kiwi, 55, 55);
  fill (127,255,212);
  quad(60-kiwi, 100-kiwi, 106, 20, 99, 78, 50, 104);
  fill (0,255,0);
  rect(30+kiwi, 20, 55, 55, 3, 6, 12, 18);

kiwi=kiwi+1;
  
  }
