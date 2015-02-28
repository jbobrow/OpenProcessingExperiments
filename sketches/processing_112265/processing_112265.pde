
size(500,500);
smooth();
background(0);
 
 
 
 
for (int y=0; y<=height; y+=90) {
  for (int x=0; x<=width; x+=10){
    
   strokeWeight(1);
   stroke(68, 224, 194);
   line(350,350, x+10, y-20);
    
   strokeWeight(1);
   stroke(184,252,246);
   line(350,350, x, y);
    
  }
}



