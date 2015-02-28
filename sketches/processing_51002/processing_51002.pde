
size(700,700);
smooth();
background(255);
 
 
 
 


for (int y=10; y<=height; y+=50) {
  for (int x=0; x<=width; x+=50){ 
   
    strokeWeight(150);
   stroke(0,30);
   point(x, y);
    
    strokeWeight(90);
   stroke(0,30);
   point(x, y);
   
   strokeWeight(30);
   stroke(55,0,0,30);
   point( x, y);
  }
  
}

