
void atama(int a,int b){
   pushMatrix();
  translate(a,b);
  strokeWeight(1);
  fill(255);
  stroke(0);  
  
  stroke(a, b, 46);
  fill(a,b,0,150);
  ellipse(50, 10, 10, 10);
  ellipse(50, 90, 10, 10);
  ellipse(50, 80, 15, 15);
  ellipse(80, 30, 20, 20);
  ellipse(20, 20, 15, 15);
  ellipse(90, 70, 10, 10);
  ellipse(20, 90, 20, 20);
  ellipse(10, 80, 10, 10);
  ellipse(20, 30, 10, 10);
  ellipse(20, 20, 10, 10);
  
  popMatrix();
}

