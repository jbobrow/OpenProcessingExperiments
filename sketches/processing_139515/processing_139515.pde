
size(450, 450);
smooth();
background(255);
noStroke();
fill(243, 123, 111);

//first coral row
for (int x1 = 34; x1 <= width; x1 += 150){
  for (int y1 = -75; y1<= height; y1+=150) {
rect(x1, y1, 41, 109);
}
}

//second coral row
for (int x2 = 109; x2 <= width; x2 += 150){
  for (int y2 = 0; y2< height; y2+=150) {
rect(x2, y2, 41, 109);
}
}

//first green row
for (int x3 = -75; x3 <= width; x3 += 150){
  for (int y3 = 109; y3<= height; y3+=150) {
    fill(42,180,157);
rect(x3, y3, 109, 41);
}
}

//second green row
for (int x4 = 0; x4 < width; x4 += 150){
  for (int y4 = 34; y4 <= height; y4+=150) {
        fill(42,180,157);
rect(x4, y4, 109, 41);
}
}


