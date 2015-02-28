
float y = 0.1;
float x = 5;
float x2 = 5;
float x3 = 5;
float y2 = 0.1;
//variables
  
void setup(){
  size(250,250);
  smooth();
  background(100);
  noStroke();
  
}
  
void draw(){
  fill(0,20);
  rect(0,0,width,height);
  //black background
    
  noFill();
  strokeWeight(1);
  x += 10;
  x2 += 10;
  x3 += 2;
  y2+=-2;
  
   
  stroke(#78EBF4,y);
  ellipse(pmouseX, pmouseY, x, x);
     
  ellipse(pmouseX, pmouseY, x2, x2);
    
  ellipse(pmouseX, pmouseY, x3, x3);  
}
  
void mouseMoved(){
  y=random(15,250);
 
  x = 0;
  x2 = 0;
  x3 = 0;
  
}


