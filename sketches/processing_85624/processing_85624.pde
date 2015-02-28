
/* 
Part of the ReCode Project (http://recodeproject.com)
Based on "Variation on 9 Squares" by Roger Vilder
Originally published in "Computer Graphics and Art" vol1 no2, 1976
Copyright (c) 2012 Gerald Kogler - OSI/MIT license (http://recodeproject/license).
*/

int s = 1920;        //size of sketch
int num = 5;        //num of lines and columns in grid
float margin = 0;  //margin around rectangles areas
float overlap = 0; //overlap of reactangle areas
float ease = 0.3;   //easing/division factor for non/linear distribution
char mode = 'e';    //mode 'l'==linear, 'e'==exponential distribution
color bg = 0; 
float r;
Square[] squares = new Square[num*num];

void setup() {
  size(920,580);
  noFill();
  stroke(255);
  r = ((width-2*margin)/num)/2+overlap/num;

  //make instances of squares
  for (int y=0; y<num; y++) {
    for (int x=0; x<num; x++) {
      squares[x+y*num] = new Square(x,y,((x+y*num)%2==0));
    }
  }
}

void draw() {
  background(bg);
  for (int i=0; i<num*num; i++) {
    squares[i].draw();
  }
}

void keyPressed() {
  if (key == 'q') {
    save("RogerVilder-"+mode+ease+".png");
  }
  else if (key == 'b') {
    if (bg == 0) {
      bg = 255;
      stroke(0);
    }
    else {
      bg = 0;
      stroke(255);
    }
  }
  else if (key == 'm') {
    if (mode == 'l') mode = 'e';
    else mode = 'l';
  }
  else if (key == '+') {
    if (ease > 0.15) ease-=0.1;
  }
  else if (key == '-') {
    if (ease < 1.0) ease+=0.1;
  }
}


class Square {
  int x,y;       //position in grid
  boolean hor;   //orientation of squares
  
  Square(int x, int y, boolean hor){
    this.x = x;
    this.y = y;
    this.hor = hor;
  }
  
  void draw() {
    float step = 0;
    for (float angle=0; angle<=HALF_PI; angle+=step) {
      if (mode == 'e') step = (HALF_PI+0.1-angle)*ease;
      else step = HALF_PI/(ease*10);
      
      float cx = margin + x*(2*r-overlap);
      float cy = margin + y*(2*r-overlap);
      float sx,sy;      
      if (hor) {
        sx = r +r * cos(angle);
        sy = r+ r * sin(angle);
      }
      else {
        sx = r + r * sin(angle);
        sy = r + r * cos(angle);
      }
      float sw = (r - sx) * 2;
      float sh = (r - sy) * 2;
      rect(cx+sx, cy+sy, sw, sh);
    }
  }
}
//===========SaveImage
void keyReleased() {
  if (key=='s' || key=='S') saveFrame(timestamp()+".png"); }
  String timestamp() {
  return String.format("%1$ty%1$tm%1$td_%1$tH%1$tM%1$tS", Calendar.getInstance());
}
 
//==============
