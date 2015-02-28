
size (250, 250);
smooth ();

strokeWeight (2);

for(int i=20; i<260; i +=20){
  line (i-20, 0, i-20, 250);
}

strokeWeight (1);

for(int i=20; i<260; i +=40){
  line (i-17, 0, i-17, 250);
}

strokeWeight (4);
for(int i=20; i<260; i +=40){
  line (i-14, 0, i-14, 250);
}

strokeWeight (5);
for(int i=20; i<260; i +=40){
  line (i, 0, i, 250);
}

strokeWeight (1);

for(int i=20; i<260; i +=40){
  line (i+5, 0, i+5, 250);
}

strokeWeight (3);
for(int i=20; i<260; i +=40){
  line (i+12, 0, i+12, 250);
}

strokeWeight (5);
line (248, 250, 248, 0);


noStroke ();
for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (y, x, y, 140);
    ellipse (x, y, 20, 20);
  }
}

for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
   fill (y, x, x, 140);
    ellipse (x+10, y, 20, 20);
  }
}

for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (y,x,x,120);
    ellipse (x+5, y+10, 20, 20);
  }
}

