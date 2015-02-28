
size (624, 550);
background (255); 
smooth(); 

float x1, y1; 
float x2, y2; 

float radius =  width +200; 
float  degree = 260; 


x1 =600;
y1 = height; 

for ( int i = -90 ; i <= 200; i++){
  
  degree = degree -3;  
  println("anglulo = " + degree%200); 
  
  float rad = - radians(degree); 

  float x = radius * cos(rad); 
  float y = radius * sin (rad); 

  x2 =x;
  y2= y+y1;

  // draw the line 
  float c = map (i, 9,200, 10,250); 
  stroke( c,225-c,c-90); 
  
  float s = map (i, 9,910, 2,8); 
  strokeWeight(s); 
  line (x1, y1, x2, y2);

}

saveFrame("bannerB.jpg"); 

