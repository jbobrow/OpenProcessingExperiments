
//Problem Set 4
//Question 2
//Matt Iannacci

float area = 10;
float r = random(50);

void setup(){
  size(400,400);
   }
 
void draw() {
    
   background(0);
  for (int gridY=0; gridY<area; gridY++) {
    for (int gridX=0; gridX<area; gridX++) {
 
      float shiftX = random(-mouseX, mouseX)/10;
      float shiftY = random(-mouseX, mouseX)/10;
      
      float areaX = width/area * gridX;
      float areaY = height/area * gridY;
 
      fill(mouseX,mouseY,100,200); 
      rect (areaX+shiftX, areaY+shiftY, areaX+shiftX, areaY+shiftY) ;
           
    }
    }
  }


