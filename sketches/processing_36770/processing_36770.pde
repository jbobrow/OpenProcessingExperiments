
size (500, 500); 
background(20, 74, 74);
smooth();
fill(240, 129, 39); 
int count = 0; 
int otherCount = 0;

// Change this to change the pattern of dark squares
int darkSquares = 10;

for (float x = 0; x < width+10; x=x+(10*sqrt(2))) {
  count = 0;
  for (float y = -10; y < height+10; y=y+(10*sqrt(2))/2){
      
      if(count == 0){
        translate(x+(10*sqrt(2))/2, y);
      }
      else{
        translate(x, y);
      }
      
      rotate(PI/4);
      
      fill(random(225, 255), random(109, 149), random(19,59));
      if(otherCount % darkSquares == 0) fill(0,0,0);
      rect(0, 0, 8, 8);
      
      rotate(-PI/4);
      if(count == 0){
        translate(-x-(10*sqrt(2))/2, -y);
        count = 1;
      }
      else{
        translate(-x,-y);
        count = 0;
      }
      otherCount++;    }
}            
