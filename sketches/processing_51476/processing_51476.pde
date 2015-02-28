
float grid = 30;


void setup(){
  size(600,600);
  background(255);
  smooth();
  stroke(-10);
  noCursor();
}



void draw(){
  for (float i = 0 + 30; i < width; i += grid){
    for (float j = 0 + 30; j < height; j += grid){
      if (mouseX > i && mouseX < i + grid && mouseY > j && mouseY < j + grid){
        fill (i,j,j,i);
         ellipse(i, j, 50, 50);
      }
         ellipse(j, i, 50, 50);  
    }
  }
}


void mouseClicked(){
 stroke(10);
 
 }


