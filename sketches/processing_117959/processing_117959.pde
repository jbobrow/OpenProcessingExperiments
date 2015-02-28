
void setup(){
 
  size(200,200);
 
  float value = 25;
  ellipse(value, 50, 50, 50);
  
  // 25 is in the middle of 0 - 50
  // after this m = 100, as this is in the middle of 0 - width (200)
  float m = map(value, 0,50,0,width);
  ellipse(m, 100, 50,50);
  
}


