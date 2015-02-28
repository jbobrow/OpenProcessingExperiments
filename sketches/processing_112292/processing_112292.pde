
size(500,500);
smooth();
background(247, 64, 64);
 
 
for (int y=0; y<=height; y+=10) {
  for (int x=0; x<=width; x+=10){
    
   strokeWeight(1);
   stroke(293, 42, 40);
   line(250,350, x+10, y-20);
    
   strokeWeight(5);
   stroke(255, 103,90);
   line(250,350, x, y);
    
  }
}



