
//Matthew Iannacci
//Problem Set 1
//Question 7

void setup() {
  size(500,500);
  smooth();
}
  
void draw() {
    
  line(0,0,500,500);
  fill(0,255,0);  
  for(int x=0; x<=height; x+=100) {
  for(int y=0; y<=width; y+=100) {
 
  rect(x,y,100,100);
  line(0,0,500,500);
  
  
  triangle(150,250,250,375,75,375);
  triangle(250,150,375,250,375,75);
  
  }
  }
} 
   
   

