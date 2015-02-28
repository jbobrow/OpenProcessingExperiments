
void setup(){
size (400, 300);
background (260, 200, 255);
smooth();
frameRate(12);
}
 
void draw (){
for (int i=0; i<width; i +=10)
drawGrass (i, 900);
 
}
void drawGrass (int x, int y){
  stroke(random(30), random(60),random(70), 40);
  strokeWeight(random(1));
  line (x, y, pmouseX, pmouseY);
}
 
                


                
                
