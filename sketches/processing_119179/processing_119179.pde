
void setup() {
  size(500, 500);
  noStroke();
  
}

void draw() {
  background(00);
  
  pushMatrix();
  translate(0,mouseY/9);
  fill(46,65,210);
  
//1. Reihe
 
  ellipse (50,50,50,50);
  
  
  ellipse (150,50,50,50);
 
  
  ellipse (250,50,50,50);
  
  
  ellipse (350,50,50,50);
  
  
  ellipse (450,50,50,50);
  popMatrix();
  resetMatrix();
  
  //2. Reihe
   
   pushMatrix();
  translate(0,mouseY/25);
   
 
  
  ellipse (50,150,50,50);
  
  ellipse (150,150,50,50);
  
  ellipse (250,150,50,50);
  
  ellipse (350,150,50,50);
  
  ellipse (450,150,50,50);
  
  
  
  popMatrix();
  resetMatrix();
  
  //3. Reihe
  
  ellipse (50,250,50,50);
  
  ellipse (150,250,50,50);
  
  ellipse (250,250,50,50);
  
  ellipse (350,250,50,50);
  
  ellipse (450,250,50,50);
  
  pushMatrix();
   translate(0,mouseY/-25);
  
  //4. Reihe
  
  ellipse (50,350,50,50);
  
  ellipse (150,350,50,50);
  
  ellipse (250,350,50,50);
  
  ellipse (350,350,50,50);
  
  ellipse (450,350,50,50);
  
   popMatrix();
  resetMatrix();
  
  
  pushMatrix();
   translate(0,mouseY/-8);
  //5. Reihe
  
  ellipse (50,450,50,50);
  
  ellipse (150,450,50,50);
  
  ellipse (250,450,50,50);
  
  ellipse (350,450,50,50);
  
  ellipse (450,450,50,50);
  
  popMatrix();
  resetMatrix();
 
}
