

size(398,398);
background(0);
smooth();
noStroke();

for (int y = 2; y < 398; y += 12) {
  for (int x = 2; x < 398; x += 12) {
    fill(102,x*.4,104);
    rect(x,y,10,10);
  }
}




