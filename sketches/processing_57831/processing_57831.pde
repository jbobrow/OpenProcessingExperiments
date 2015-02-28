
/*reference 
http://www.youtube.com/watch?v=O6QrY_DeBDs&context=C435ae2aADvjVQa1PpcFNAy0bKrfNL4dPehqa-X48rCzwI76w5H_A=
*/

float x;
 float y;
   
 float xVel = 2;
 float yVel = 3;
   
void setup() {
   size(250,250);
   smooth();
    
}
  
void draw() {
  background (#E9B6D4);
   
  x += xVel;
  y += yVel;
    
  if (y > height || y < 0 ){
      yVel = yVel * -1;}
        
   if (x > width || x < 0 ){
      xVel = xVel * -1;}
  
  
   
   fill(#2915E8);
  noStroke();
  ellipse(125,125,x,y);
    
   fill(#526DCE);
  noStroke();
  ellipse(125,125,x/2,y/2);
   
  fill(#417FC2);
  noStroke();
  ellipse(125,125,x/4,y/4); 
    
}

