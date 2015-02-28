
// a square sketch produces round circles
size(400, 400);
// smooth the lines out
smooth();
background(0);
// remove outlines
noStroke();
 
 int number = 27;
 
for (int i = 0; i<number; i++) {
  for (int j = 0; j<number; j++) {
    if ((i+j) % 2 == 0) {
      fill(i*2%255,i*100%255,i*100%255);
    }
    else {
      fill(i*100%255,i*2%255,i*100%255); 
    }
     rect(i*width/number, j*height/number, width/number, height/number);
  }
}


