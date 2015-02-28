
size(250, 250);
background(#A8B5C4);
smooth();
 

strokeWeight(0.5);
 
stroke(#594F4F, 225);
for(int dx = -110; dx < 340; dx += 20){
  for(int dy = -110; dy < 340; dy += 40){
    rect(dx, dy, random (dx), random(dy));}
}
 
fill(#0D8DA2, 0);
for(int dx = -110; dx < 250; dx += 20){
  for(int dy = -110; dy < 340; dy += 70){
    rect(dx, dy, random (dx), random(dy));}
}
 
fill(#547980, 100);
for(int dx =-110; dx < 340; dx += 38){
  for(int dy = -110; dy < 340; dy += 40){
    rect(dx, dy, random (dx), random(dy));}
}
 
 

fill (#1D553E, 70);
for(int dx =-170; dx < 340; dx += 40){
  for(int dy = -110; dy < 340; dy += 50){
    rect(dx, dy, random (dx), random(dy));}
}
 
 


