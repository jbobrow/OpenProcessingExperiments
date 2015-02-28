
void setup()   {
  size (392, 410); 
  background(255); 
{  
  smooth();
 
 //vertical lines
  strokeWeight(11); 
  line(50, 0, 50, 410);
  strokeWeight(8);
  line(100, 0, 100, 410);
  strokeWeight(7);
  line( 130, 0, 130, 410); 
  strokeWeight(7);
  line(150, 0, 150, 410);
  strokeWeight(8);
  line( 233, 0, 233, 410);
  strokeWeight(8);
  line(310, 0, 310, 410);
  strokeWeight(8);
  line(334, 0, 334, 410);
  strokeWeight(8);
  line(378, 0, 378, 410);
  
  //horizontal lines 
  strokeWeight(11);
  line(0, 95, 410, 95);
  strokeWeight(11);
  line(0, 156, 410, 156);
  strokeWeight(11);
  line(0, 205, 410, 205);
  strokeWeight(12);
  line(0, 273, 410, 273);
  
  strokeWeight(10);
  line(237, 350, 332, 350);
  strokeWeight(8);
  line(237, 397, 332, 394);
}
   //colors
  
  fill(228, 184, 2);
  noStroke();
  rect(0,0, 45,90);
  
  
  fill(167, 28, 7);
  rect(237, 279, 70, 67);
  
  fill(57, 111, 164);
  rect(56, 355, 41, 18);
  
   fill(57, 111, 164);
   rect(104, 355, 23, 18);
   
   fill(57, 111, 164);
   rect(134, 355, 13, 18);
   
  fill(167, 28, 7);
  rect(382, 355, 10, 18);
} 



