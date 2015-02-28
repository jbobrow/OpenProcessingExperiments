
/////////////////////////////////////////////////////////////////////////////////////////////
// Written by Sasa Zivkovic 
// No.mad discourse | www.nomaddiscourse.com
// No.mad process | www.nomadprocess.com
/////////////////////////////////////////////////////////////////////////////////////////////
float sizeGrid = 2;
float scaleFactor = 1;
int grid = 50;

/////////////////////////////////////////////////////////////////////////////////////////////
void setup() {
  size(1000, 500);
  smooth();
  background(255);  
}

/////////////////////////////////////////////////////////////////////////////////////////////
void draw() {
  
  ///// set graphic parameters
  noStroke();
  fill(100, 200);
  background(255);
  
  ///// create ground pattern
  for (int i = 0; i <= width*2; i += grid) {
    for (int j = 0; j <= height; j += grid) {
     if((i % 20) == 0) {
      pushMatrix();
      scale(scaleFactor);
      fill(0, 0, 0, 50);
      my_Norm_Rect(i , j);
      popMatrix();
      } else {
        pushMatrix();
        scale(scaleFactor);
        translate(0, sizeGrid*10);
        fill(0, 0, 0, 50);
        my_Norm_Rect(i, j);
        popMatrix();
      }
    }
  }
  
  ///// set fill for second pattern
  fill(0, 0, 0, 255);
  
  ///// create second pattern
  for (int i = 0; i <= width; i += grid) {
    for (int j = 0; j <= height; j += grid) {
      if((i % 20) == 0) {
      pushMatrix();
      scale(scaleFactor);
      fill(0, 0, 0, 50);
      my_Rot_Rect(i , j);
      popMatrix();
      } else {
        pushMatrix();
        scale(scaleFactor);
        translate(0, sizeGrid*10);
        fill(0, 0, 0, 200);
        my_Rot_Rect(i, j);
        popMatrix();
      }
    }
  }
  
  ///// rounded rectangles 
  fill(255);
  noStroke();
  beginShape();
  int v = 10;
  vertex(width-v, 0);
  bezierVertex(width-v/2, 0, width, 0+v/2, width, v);
  vertex(width, 0);
  endShape();
  beginShape();
  vertex(v, 0);
  bezierVertex(v/2, 0, 0 , v/2, 0, v);
  vertex(0, 0);
  endShape();
  beginShape();
  vertex(v, height);
  bezierVertex(v/2, height, 0 , height- v/2, 0, height - v);
  vertex(0, height);
  endShape();
  beginShape();
  vertex(width-v, height);
  bezierVertex(width-v/2, height, width, height-v/2, width, height-v);
  vertex(width, height);
  endShape();
  noFill();
}
 
/////////////////////////////////////////////////////////////////////////////////////////////

 void my_Rot_Rect(int x, int y) {
  pushMatrix();
  
  ///// relate to mouse position
  int a = mouseX;
  int b = mouseY;
  
  float mx = map(mouseX, 0, width, 0, 40);
  float my = map(mouseY, 0, height, 0, 40);
  
  float g = dist(x, y, a, b);
  float g1 = dist(x, y, a, b);
  
  if (g < 100) {
    g = 100;
  }
  
  float mx1 = mx + g;
  float my2 = my + g;
  
  float mx3 = map(mx1, 0, 1100, 5, 40);
  float my4 = map(my2, 0, 1100, 5, 40);
  
  ///// draw hexagon    
  translate(x, y); 
  rotate(radians(mouseX));
  scale(100/g);
  fill(0, 0, 0, g1);
  float m = sizeGrid;
  beginShape();
  vertex(11.547*m, 0);
  vertex(5.774*m, -10*m);
  vertex(-5.774*m, -10*m);
  vertex(-11.547*m, 0);
  vertex(-5.774*m, 10*m);
  vertex(5.774*m, 10*m);
  endShape(CLOSE);
  popMatrix();
}

/////////////////////////////////////////////////////////////////////////////////////////////

 void my_Norm_Rect(int x, int y) {
  pushMatrix();
  translate(x, y); 
  float m = sizeGrid;
  beginShape();
  vertex(11.547*m, 0);
  vertex(5.774*m, -10*m);
  vertex(-5.774*m, -10*m);
  vertex(-11.547*m, 0);
  vertex(-5.774*m, 10*m);
  vertex(5.774*m, 10*m);
  endShape(CLOSE);
  popMatrix();
}




