
size(700,700);
smooth();
background(213, 247, 190);


stroke(27, 30, 224);
strokeWeight(4);

for (int y=0; y<height; y+=30) {
  for (int x=0; x<width; x+=50) {
  line(x, y, x+50, y+40);
  }
}

stroke(255, 255, 28);
strokeWeight(1);
for (int y=0; y<height; y+=20){
  for (int x=0; x<width; x+=4) {
  line(x, y, x+10, y-10);
  }
}



