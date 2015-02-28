
void setup() {
  size(400,400);
  makeShape();
}

float shapeWidth = 50;
float shapeHeight = 250;
float rectWidth = 25;
float rectHeight = 75;
float xProportion=random(0,1);
float yProportion=random(0,1);
Float x=random(rectWidth/2,rectWidth);
float y=random(rectHeight/2,rectHeight);

void draw() {
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    shapeWidth = shapeWidth + (mouseX-pmouseX);
    shapeHeight = shapeHeight + (mouseY-pmouseY);
    makeShape();
  }
  else  if (mouseButton == RIGHT) {
    rectWidth = rectWidth + (mouseX-pmouseX);
    rectHeight = rectHeight + (mouseY-pmouseY);
    x=x+xProportion*(mouseX-pmouseX);
    y=y+yProportion*(mouseY-pmouseY);
    makeShape();
  }
}
 
void makeShape() {
  background(255);
  line(0,350,400,350);
  beginShape();
  fill(255);
  vertex(width/2 - shapeWidth, height-50-shapeHeight);
  vertex(width/2 + shapeWidth, height-50-shapeHeight);
  vertex(width/2 + shapeWidth, height-50);
  vertex(width/2 - shapeWidth, height-50);
  vertex(width/2 - shapeWidth, height-50-shapeHeight);
  endShape();
  beginShape();
  fill(random(150,250));
  vertex(width/2 - shapeWidth+shapeWidth*xProportion, height-50-shapeHeight+shapeHeight*yProportion-rectHeight);
  vertex(width/2 - shapeWidth+shapeWidth*xProportion, height-50-shapeHeight+shapeHeight*yProportion);
  vertex(width/2 - shapeWidth+shapeWidth*xProportion+rectWidth, height-50-shapeHeight+shapeHeight*yProportion);
  vertex(width/2 - shapeWidth+shapeWidth*xProportion+rectWidth, height-50-shapeHeight+shapeHeight*yProportion-rectHeight);
  vertex(width/2 - shapeWidth+shapeWidth*xProportion, height-50-shapeHeight+shapeHeight*yProportion-rectHeight);
  endShape();
  //vertical line
  beginShape();
  vertex(width/2 - shapeWidth+shapeWidth*xProportion+x, height-50-shapeHeight+shapeHeight*yProportion-rectHeight);
  vertex(width/2 - shapeWidth+shapeWidth*xProportion+x, height-50-shapeHeight+shapeHeight*yProportion);
  endShape();
  //horizontal line
  beginShape();
  vertex(width/2 - shapeWidth+shapeWidth*xProportion, height-50-shapeHeight+shapeHeight*yProportion+y-rectHeight);
  vertex(width/2 - shapeWidth+shapeWidth*xProportion+rectWidth, height-50-shapeHeight+shapeHeight*yProportion+y-rectHeight);
  endShape();
}
//output
void keyPressed(){
  if((key=='b')||(key=='B')){
    save("image.jpg");
    println("saved");
  }
}

