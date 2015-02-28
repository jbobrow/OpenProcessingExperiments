
size (250, 250);

smooth ();

for (int i=20; i<1250; i += 62.5){
line (i-20, 0, i+42.5, 62.5);
line (i+42.5, 0, i-20, 62.5);
}

for (int i=20; i<1250; i += 62.5){
line (i-20, 062.5, i+42.5, 125);
line (i-20, 125, i+42.5, 62.5);
}

for (int i=20; i<1250; i += 62.5){
line (i-20, 125, i+42.5, 187.5);
line (i-20, 187.5, i+42.5, 125);
}

for (int i=20; i<1250; i += 62.5){
line (i-20, 187.5, i+42.5, 250);
line (i-20, 250, i+42.5, 187.5);
}

noStroke ();

for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (255, 100);
    rect (x, y, 35, 35);
  }
}

noStroke ();

for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (173, 209, 216, 110);
    rect (x, y, 20, 20);
  }
}

for(int y=0; y<=height; y+=40) {
  for(int x=0; x<=width; x+=40) {
    fill (198, 216, 173, 100);
    rect (x+15, y+15, 20, 20);
  }
}

