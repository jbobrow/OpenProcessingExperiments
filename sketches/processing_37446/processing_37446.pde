
//Homework 5 - 60-257
// copyright Eric Mackie September 2011 Pittsburgh, PA 15221
float myMouseT, myMouseB;
void setup() {
  size(500, 500);
  noCursor();
}
void draw () {
  myMouseT= mouseY - 5;
  myMouseB = mouseY;
  fill(255, 30);
  rectMode(CENTER);
  rect(width/2, height/2, width, height);

    while (myMouseB<=505){
      fill(255,0,myMouseB/2);
    triangle(mouseX, myMouseB, width/6, height, 5*width/6, height);
    myMouseB = myMouseB +5;
  }
  
  while (myMouseT>=-10) {
    fill(0,255,myMouseT/2);
    triangle(mouseX, myMouseT, width/6, 0, 5*width/6, 0);
    myMouseT = myMouseT - 5;
  }
}

                
