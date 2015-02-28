
size(250, 250);
background(0);
smooth();
 
noFill();
 
stroke(#b2af62, 500);
strokeWeight(0.45);
for(int y = 0; y < 250; y+= 10){
  for(int cy1 = 90; cy1 < 400; cy1 += 70){
    for(int cy2 = 50; cy2 < 400; cy2 += 70){
      bezier(y, y, 65, cy1, 300, cy2, 250, 250);}
  }
}
    
    

