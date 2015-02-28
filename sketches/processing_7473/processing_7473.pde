
int x = 20;
int y = 20;



void setup () {
  colorMode(HSB, 360, 100, 100);
  size (400, 400);
  background(321,32,84);
  noStroke();
  for (int i=0; i<400; i +=20) {
   for (int j=0; j<400; j+=20){
   fill (72,73,89);
     rect(i,j,x,y);
   }
   }
}

void draw() {
  
 
   } 

void mouseMoved() {
 for (int i=0; i<400; i +=20) {
   for (int j=0; j<400; j+=20){
    if (mouseX > i && mouseX < i+x && mouseY > j && mouseY < j+y) {
   fill (321,32,84);
      rect(i,j+1,x,y);
      
    }
   
      }
}
color c = get(mouseX, mouseY);
      int h = int(hue(c));
      println (h);
      
       for (int i=0; i<400; i +=20) {
   for (int j=0; j<400; j+=20){
    if (mouseX > i && mouseX < i+x && mouseY > j && mouseY < j+y && h == 320) {
   fill (100,32,84);
      rect(i,j+1,x,y);
      
    }
   
      }
}
    }
    


