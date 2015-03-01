
 
 
float x = 400;
float y = 400;
  
 
 
  
  
void setup() {
  size(600, 400);
  smooth();
  background(500);
}
  
void draw() {
  
  strokeWeight(random(1, 25));
  for (int i =0; i <400;i++) {
  
  
    stroke(0, random(100, 255), random(100, 255));
    point(i*random(0, width), i*random(0, height));
    x = x+5;
    stroke(0, random(100, 255), random(100, 255),80);
    fill(255,255,255,10
    );
    ellipse(i/5*random(0,width),i/5*random(0,width),10,10);
   
   
  }
    
     
  pushMatrix();                     ///////////////logo
  fill(255,255,255,95);
  noStroke();
  rect(width-80,height-55,10,10);
  rect(width-60,height-55,10,10);
  rect(width-70,height-45,10,10);
  rect(width-60,height-35,10,10);
  popMatrix();                      /////////////logo
    
 
}

