
size(250, 250);
background(#E0E4CC);
smooth();

//lines
strokeWeight(0.5);

stroke(#594F4F, 225);
for(int dx = 0; dx < 340; dx += 28){
  for(int dy = 0; dy < 340; dy += 28){
    line(-20, -20, random (dx), random(dy));}
}

stroke(#547980, 225);
for(int dx = 0; dx < 340; dx += 28){
  for(int dy = 0; dy < 340; dy += 28){
    line(-20, -50, random (dx), random(dy));}
}

stroke(#547980, 225);
for(int dx = 0; dx < 340; dx += 38){
  for(int dy = 0; dy < 340; dy += 38){
    line(-20, -80, random (dx), random(dy));}
}


stroke(#594F4F, 225);
for(int dx = 0; dx < 340; dx += 48){
  for(int dy = 0; dy < 340; dy += 48){
    line(-20, -30, random (dx), random(dy));}
}



