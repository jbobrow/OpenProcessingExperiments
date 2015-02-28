
void setup() {
  size(400,400);
  drawhouse();
}
 
float boxpointX=20;
float boxpointY=210;
float boxWidth=360;
float boxHeight=-150;
float columnWidth=15;
float columnHeight=90;
float columnSpace=40;
float windowSpace=20;
float windowWidth=20;
float windowHeight=-40;

 
void draw() {
}
 
 
void keyPressed() {
  if (key == 'a' || key == 'A') {
    columnWidth--;
    drawhouse();
  }
  else if (key == 'd' || key == 'D') {
    columnWidth++;
    drawhouse();
  }
   
  else if (key == 'w' || key == 'W') {
    boxpointX++;
    drawhouse();
  }
   
  else if (key == 's' || key == 'S') {
    boxpointX--;
    drawhouse();
  }
  if (key == CODED) {
    if (keyCode == UP) {
      boxHeight--;
      windowHeight--;
      drawhouse();
    }
    else if (keyCode == DOWN) {
      boxHeight++;
      windowHeight++;
      drawhouse();
    }
    else if (keyCode == LEFT) {
      boxWidth--;
      drawhouse();
    }
    else if (keyCode == RIGHT) {
      boxWidth++;
      drawhouse();
    }
  }
}
 
void drawhouse() {
  background(255);
    fill(0,100,50);
  rect(0,300,400,100);
   fill(245);
  rect(boxpointX,boxpointY,boxWidth,boxHeight);
  fill(200);
  for(float columnspace=boxpointX;columnspace<boxWidth;columnspace+=columnSpace){
  rect(columnspace+10,boxpointY,columnWidth,columnHeight);
  fill(90);
 for(float columnshadow=boxpointX;columnshadow<boxWidth;columnshadow+=columnSpace){
  rect(columnspace+10,boxpointY,columnWidth,15);
  }
  fill(200);
  for(float windowspace=boxpointX+10;windowspace<boxWidth;windowspace+=windowSpace){
    rect(windowspace,boxpointY-50,windowWidth,windowHeight);
  }
}
}

void mousePressed(){
   save("image.jpg");
  }




