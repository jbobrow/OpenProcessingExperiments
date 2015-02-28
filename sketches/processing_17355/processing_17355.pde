
void setup(){
size (400, 300);
background (209, 250, 255);
smooth();
frameRate(12);
}

void draw (){
for (int i=0; i<width; i +=10)
drawGrass (-i, 400);

}
void drawGrass (int x, int y){
  stroke(random(17), random(173),random(73), 60);
  strokeWeight(random(2));
  line (x, y, pmouseX, pmouseY);
}

                
                
