
void setup () {
  size (500,500);
  background (10);
  noStroke();
  smooth();
}

void draw() {
  
     if (mouseX>450){
     background(29,39,145);
   }
 
  
  if (mouseX<450){
  int rX = mouseX/20;
  int shapeType = 1;


    background(10);
  for(int i = 15; i <= 500; i += 50){
   for(int j = 15; j <= 500; j += 50){
     ellipse(i, j, 25, 25);
     
        
        ellipse(i+random(-rX, rX), j+random(-rX, rX), 15, 15);
   }
 
   }
    ellipse (mouseX, mouseY, 25, 25);
 
  }
  }
