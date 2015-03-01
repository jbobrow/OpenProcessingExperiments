
float origX;
boolean mouseClick;

void setup(){
  size(800,800);
  origX = width/2;
  background(0);
}

void draw(){
  //pushMatrix();
  //translate(noise(origX)*100,0);
  //rotate(radians(random(-90,90)));
  for (int y=0; y<height; y +=100){
    if (mouseClick == true){
      origX = mouseX;
    } else {
      origX = yLineMaker(origX, y, 100);
    }
    if (origX > width){
      origX = origX - width;
    } else if (origX < 0 ){
      origX = width - origX;
    }

  } 
  //popMatrix();

}

float yLineMaker(float startX, float startY, float lineLength){
  pushMatrix();
  //translate(noise(origX)*100,0);
  rotate(radians(random(-90,90)));

  float endX = startX + random(-10,10);
  float c = map(abs(endX-startX), 0, 10, 0, 255);
  stroke(c);
  strokeWeight(abs(endX-startX));
  line (startX, startY, endX, (startY+lineLength));
    popMatrix();
  return endX;

}

void mousePressed(){
  mouseClick = true;
}
void mouseReleased(){
  mouseClick = false;
}




