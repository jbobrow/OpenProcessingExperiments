
size(485, 485);
background(255, 141, 117);


smooth();

strokeWeight(5);
fill(254, 176, 190);
for (float x=1; x<16; x=x+2) {
  for (float y=1; y<16; y=y+2) {  
   ellipse(x*30, y*30, 50, 50);
  }
}

strokeWeight(2);
fill(105, 229, 151, 50);
for (float x=1; x<14; x=x+1) {
  for (float y=1; y<11; y=y+1) {  
   rect(x*30, y*30, 60, 150);
  }
}

strokeWeight(3);
line(0,0, 485, 485);
line(0, 485, 485, 0);

strokeWeight(2);
fill(255, 141, 117, 50);
for (float x=1; x<16; x=x+1) {
  for (float y=1; y<16; y=y+1) {  
   ellipse(x*30, y*30, 50, 50);
  }
}
