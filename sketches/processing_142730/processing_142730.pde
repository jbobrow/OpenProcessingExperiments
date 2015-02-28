
void setup (){
  size (500,500);
  background (0);
}

void draw () {
  
  

 float a = map(second(),0,59,140,500);
 
 pushMatrix();
  fill(255,255,255,10);
  translate (90, a);
  rotate (a);
  noStroke();
  ellipse(0,0,20, 150);
  popMatrix();
  
  
pushMatrix();
  fill(150,150,150,10);
  translate (80,a);
  rotate (a);
  noStroke();
  ellipse(0,0,150, 20);
  popMatrix();
 
   pushMatrix();
  fill(200,200,200,10);
  translate (a,90);
  rotate (-a);
  noStroke();
  ellipse(0,0,150, 20);
  popMatrix();
  
  
pushMatrix();
  fill(100,100,100,10);
  translate (a,80);
  rotate (-a);
  noStroke();
  ellipse(0,0,20,150);
  popMatrix(); 
}

