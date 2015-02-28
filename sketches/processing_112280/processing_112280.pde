
size (500,500);
smooth();
background (255);

strokeWeight(1);
for(int x=0; x<500; x=x+20){
  for(int y=0; y<500; y=y+20){
    stroke(255,46,23);
    line (x, y, x+30, y+40);
    line (x+30, y+40, x, y);
    line (x+30, y+40, x-90, y-90);
  }
}


