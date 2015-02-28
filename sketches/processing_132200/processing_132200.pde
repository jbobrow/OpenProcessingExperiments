
// Assignment 1
// Purpose: Show alternate grids if rectangles and circles, each
// time with an alternate color scheme. Colors are RGB, Red and 
// Green depend on x and y values, blue is assigned randomly. 
// There are almost an infinite variety of colors
int colr = 16;
int colg = 100;
int colb = 100;
boolean drawRect = true;
int y = 0;
int x = 0;

void setup() {
  size(340, 340);
  background(255, 255, 0);
  smooth();
}

void draw() {
  colr = x*16;
  colg = y*16;
  fill(colr, colg, colb);
  if (drawRect==true) 
    rect((x*20)+10, (y*20)+10, 18, 18);
  else
    ellipse((x*20)+20,(y*20)+20,20,20); 
  colr = x*16;
  colg = y*16;
  if (y==15 && x==15){
    background(255,255,0);
    drawRect = !drawRect;
    print (drawRect);
    colb = (int)random(255);
  }
   x = (x+1) % 16;
  if (x==0) y = (y+1)%16;
}



