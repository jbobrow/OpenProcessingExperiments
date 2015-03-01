
/*--------------
Casey Hamilton Crazy Lines
--------------*/

void setup() {
   background(0);
  size(500,500);
}

void draw() {
 
  float x=random(0,255);
  
  int m = width/10;
  
  strokeWeight(1);
  stroke(x,0,x);
  //line (x1, y1, x2, y2) 
  line(m, random(m, height/2-m/2), width/2-m/2, random(m,height/2-m/2)); //box starts at left margin, y random set within margin and desired box height, length is half the width minus half the margin to make room for box next to it
  stroke(0, 0, x);
  line(width/2+m/2, random(m, height/2-m/2), width-m, random(m, height/2-m/2)); //box margin starts where top left ended early, right side is width minus the margin
  stroke(x,x,x);
  line(m, random(height/2+m/2, height-m), width/2-m/2, random(height/2+m/2, height-m)); //height is set lower for bottom row of boxes(second random number set bottom margin)
  stroke(0,x,x);
  line(width/2+m/2, random(height/2+m/2, height-m), width-m, random(height/2+m/2, height-m));
}

//Thanks Brandon!


