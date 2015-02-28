
size(250, 250);
background(#DEDCB7);
smooth();
stroke (250);
strokeWeight(2);
noFill();
for(int x = 0; x < 250; x +=30) {
  bezier (0, 230, x, 30, 180, x, 250, 230);
  bezier (0, 15, x, 220, 150, x, 250, 30);
}
smooth();
strokeWeight(1);
stroke(#362525, 160);
for(int x = 30; x < 340; x += 10) {
   line(0, random (x), 250, 0);
 }
stroke(#4F908C, 160);
for(int x = 30; x < 250; x += 10) {
   line(250, random (x), 0, 250);
}



