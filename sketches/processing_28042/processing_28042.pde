
void setup(){
size (550, 400);
background (255, 254, 247);
smooth();
frameRate(12);
}
 
void draw (){
for (int i=50; i<width; i +=35)
drawDino (i, 1000);
 
}
void drawDino (int x, int y){
  stroke(random(100), random(90),random(130), 40);
  strokeWeight(random(1));
  line (x, y, mouseX, mouseY);
}


                
                                
