
//PS3_QUESTION.5_KESHIA.KINGSLEY

float area= 10;
float r= random(50);

void setup() {
  size(400, 500);
  strokeWeight(1);
  
}

void draw() {
  background(255);
  translate(30, 230);
  for(int gridX=0; gridX<area; gridX++) {
    for(int gridY=0; gridY<area; gridY++) {
      
      float shiftX= random(-mouseX, mouseX)/10;
      float shiftY= random(-mouseX, mouseX)/10;
      
      float areaX = width/area * gridX;
      float areaY= height/area * gridY;
      
      fill(mouseX, mouseY, 100, 200);
      ellipse(areaX+shiftX ,50, 25, areaY+shiftY);
}
  }
}
  

