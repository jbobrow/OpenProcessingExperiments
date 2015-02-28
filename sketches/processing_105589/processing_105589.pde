

int box=50;
int cols;
int rows;
boolean hover;

void setup() {
  size(500, 500); //size
  cols=width/box;
  rows=height/box; //size of squares\
  //  hover=false;
  //  for (int i=0; i<cols; i++) {
  //    for (int j=0; j<rows; j++) {
  //      int x=i*box;
  //      int y=j*box;
  //      fill(255, 255, 255);
  //      stroke(1);
  //      rect(x, y, box, box);
}
void draw() {
  fill(255,255,255);
  for (int i=0; i<cols; i++) { //for loop inside of for loop
    for (int j=0; j<rows; j++) {
      int x=i*box;
      int y=j*box;
      //      fill(mouseX,mouseY,mouseX);
      stroke(1);
      rect(x, y, box, box);
      if (mouseX>x && mouseX<(x+box) && mouseY>(y) && mouseY<(y+box)) {
        fill(255, 0, 0);}
        else {
          fill(255,255,255);}
      }
    }
  }


//void draw() {
//  for (int i=0; i<cols; i++) { //for loop inside of for loop
//    for (int j=0; j<rows; j++) {
//      int x=i*box;
//      int y=j*box;
//      //      fill(mouseX,mouseY,mouseX);
//      stroke(1);
//      fill(255,255,255);
//      rect(x, y, box, box);
//      showRed();
//      if (hover==true) {
//        fill(255, 0, 0);
//      }
//      if (hover==false) {
//        fill(255, 255, 255);
//      }
//    }
//  }
//}

//void showRed() {
//  for (int i=0; i<cols; i++) { 
//    for (int j=0; j<rows; j++) {
//      int x=i*box;
//      int y=j*box;
//      //      fill(mouseX,mouseY,mouseX);
//      stroke(1);
//      rect(x, y, box, box);
//      if (mouseX>x&&mouseX<(x+box)&&mouseY>y&&mouseY<(y+box)) {
//        hover=!hover;
//      }
//    }
//  }
//}



