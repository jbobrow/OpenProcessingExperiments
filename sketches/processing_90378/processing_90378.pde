
int posX;
int posY;

int posX1;
int posY1;

int c;

int inc;
int incY;

int inc1;
int incY1;

int r;
int g;
int b;

void setup () {
size (500,500);
background (0);

posX = 100;
posY = 200;
posX1 = 400;
posY1 = 400;
c=1;
inc = 2;
incY = 5;
inc1 = 1;
incY1 =1;
r = 1; 
g = 1;
b = 1;
}

void draw () {
  
  
  fill(20,0,c%255,10);
  rect(0,0,500,500);
  
  noStroke ();
  fill (r,g,b);
  ellipse (posX, posY,50,50);
  
  ellipse (posX1, posY1, 50,50);
  
  stroke (50);
  line ( posX1, posY1, mouseX, mouseY);
  
  stroke (0);
  line (posX,posY,mouseX,mouseY);
  
  noStroke ();
  ellipse (0,0, c%255,c%255);
  
  c++;
  
  posX = posX + inc;
  
  if (posX < 0 ) { 
    inc = inc * -1;
  }
  
  if (posX > width) { 
    inc = inc * -1;
  }
  
  posY= posY + incY;
  
  if (posY > height) {
    incY = incY * -1;
  }
  
  if (posY < 0) {
    incY = incY * -1;
  }
  
//--------------------

posX1 = posX1 + inc1;
  
  if (posX1 < 0 ) { 
    inc1 = inc1 * -1;
  }
  
  if (posX1 > width) { 
    inc1 = inc1 * -1;
  }
  
  posY1= posY1 + incY1;
  
  if (posY1 > height) {
    incY1 = incY1 * -1;
  }
  
  if (posY1 < 0) {
    incY1 = incY1 * -1;
  }

//----------------------------
 r += 5;
 g += 1;
 b += 2;
 
 if (r>255) {
   r = r * -1;
 }
 if (g>255) {
   g = g * -1;
 }
 if (b>255) {
   b = b * -1;
 }

}


