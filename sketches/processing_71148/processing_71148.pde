
class Lobster { 
  int x1, x2, x3, x4, x5, 
  y1, y2, y3, y4, y5, y6,
  w1, w2, w3, w4, 
  h1, h2, h3, h4,
 d1;
  
  Lobster(int tempx1, int tempx2, int tempx3, int tempx4, int tempx5, 
  int tempy1, int tempy2, int tempy3, int tempy4, int tempy5, int tempy6,
  int tempw1, int tempw2, int tempw3, int tempw4, 
  int temph1, int temph2, int temph3, int temph4,
  int tempd1)
  {
    x1 = tempx1;
    y1 = tempy1;
    w1 = tempw1;
    h1 = temph1;
    
    x2 = tempx2;
    y2 = tempy2;
    w2 = tempw2;
    h2 = temph2;
    
    x3 = tempx3;
    y3 = tempy3;
    w3 = tempw3;
    h3 = temph3;
    
    x4 = tempx4;
    y4 = tempy4;
    w4 = tempw4;
    h4 = temph4;
    
    x5 = tempx5;
    y5 = tempy5;
    y6 = tempy6;
    d1 = tempd1;
 
  }
  
  //this moves the chain
    void move(){
   // pushMatrix();
    
  translate(65,0); 
  fill(211, 23, 45); //color red
  rect(x1, y1, w1, h1); //lobster body
  rect(x2, y2, w2, h2); //top lobster claw (left)
  rect(x3, y3, w3, h3); //bottom lobster claw (right)
  
  //lobster tail from top to bottom (left to right on lobster)
  pushMatrix();
  ellipse(x4, y4, w4, h4);
  translate(0,7);
  ellipse(x4, y4, w4, h4);
  translate(0,7);
  ellipse(x4, y4, w4, h4);
  popMatrix();
  
  //lobster eyes
  fill(0); //black
  ellipse(x5, y5, d1, d1);
  ellipse(x5, y6, d1, d1);
//  popMatrix();
  }
  
  
  void display(){
  fill(211, 23, 45); //color red
  rect(x1, y1, w1, h1); //lobster body
  rect(x2, y2, w2, h2); //top lobster claw (left)
  rect(x3, y3, w3, h3); //bottom lobster claw (right)
  
  //lobster tail from top to bottom (left to right on lobster)
  pushMatrix();
  ellipse(x4, y4, w4, h4);
  translate(0,7);
  ellipse(x4, y4, w4, h4);
  translate(0,7);
  ellipse(x4, y4, w4, h4);
  popMatrix();
  
  //lobster eyes
  fill(0); //black
  ellipse(x5, y5, d1, d1);
  ellipse(x5, y6, d1, d1);
  }
  

}

