
size(700,700);
smooth();
background(255);
 
 
 
 


for (int y=10; y<=height; y+=50) {
  for (int x=0; x<=width; x+=50){ 
   
    
    strokeWeight(2);
   stroke(0,30);
   point(x, y);
   
   strokeWeight(3);
   stroke(55,0,0,30);
   point( x, y);
   
   strokeWeight(6);
   stroke(0,0,55,30);
   line(50,650, x, y);
   
   strokeWeight(8);
   stroke(0,55,0,30);
   line(650,650, x, y);
   
   //
   
   
//    strokeWeight(2);
//   stroke(0,3);
//   point(x, y);
//   
//   strokeWeight(2);
//   stroke(0,30);
//   point( x, y);
//   
//   strokeWeight(2);
//   stroke(0,30);
//   line(50,650, x, y);
//   
//   strokeWeight(2);
//   stroke(0,30);
//   line(650,650, x, y);
   
    
  }
}

