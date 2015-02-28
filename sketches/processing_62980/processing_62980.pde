
//Lines - pattern01

size(500,500);
smooth();
background(400,30,90);
 
 
 
 
for (int y=0; y<=height; y+=25) {
  for (int x=0; x<=width; x+=25){
    
   strokeWeight(1);
   stroke(150);
   line(900,900, x+1, y-10);
    
   strokeWeight(1);
   stroke(700, 40);
   line(200,200, x, y);
    
  }
}


