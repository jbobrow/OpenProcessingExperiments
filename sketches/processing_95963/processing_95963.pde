

int x1=0;
int y1=0;
int i=0;


void setup () {
  size (400,400);
  background(190,64,0);

}

void draw() {
  if (mousePressed) {
  //background(190,64,0);
  line(x1,y1, mouseX,mouseY);
  
  } else {
  }
  saveFrame("output.png");
}

void mousePressed() {
  
 x1=mouseX;
 y1=mouseY;
  
}




