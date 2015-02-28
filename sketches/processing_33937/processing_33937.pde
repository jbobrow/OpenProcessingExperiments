
int arraysize=30;
int arrayx[] = new int [arraysize];
int arrayy[]= new int [arraysize];
int clicks=0;

void setup() {

  size (500, 500);
  background (255);
}


void draw () {
  
  for (int i=0; i<arraysize  && i<clicks;i=i+1) {
     ellipse (arrayx[i], arrayy[i],15, 15);
     
  if (i>0) {
    line (arrayx[i-1], arrayy[i-1], arrayx[i], arrayy[i]);
  }
  }
}




void mousePressed() {  
  arrayx[clicks]=mouseX;
  arrayy[clicks]=mouseY;
  clicks ++;
}





