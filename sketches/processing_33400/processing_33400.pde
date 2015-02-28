
/* add ypos in if you want it to go at a diagonal... this version goes diagonally, get rid of the ypos and put in a variable to make it go vertical*/

int xpos=20;
int ypos=20;

void setup() {
  size(400,400);
  background(200,20,100);
  smooth();
}

void draw() {
  background(200,20,100);
  for(int j=0; j<10; j++) {
    for(int i = 0; i<5; i++) {
      ellipse(xpos+50*i, ypos+50*j,20,20);
    }
  }
  xpos++;
  ypos++;
 
}



