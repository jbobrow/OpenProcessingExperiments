
//Simple Concentric criclels
//practice of recursion
//based on processing.org's tutorial section

void setup() {
  size(500, 500);
  noStroke();
  noLoop();
}

void draw() {
  drawCircle(width/2, 250, 5);
}

void drawCircle(int x, int radius, int level) {                    
  float tt = 126 * level/4.0;
  fill(tt);
  ellipse(x, height/2, radius*2, radius*2);  
  
 if(level > 1){
     level--;
     drawCircle(x,radius/2,level);
 }
  
  
 

}
