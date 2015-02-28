
//background setup
size(250, 250);
background(191, 53, 93);
smooth();

//gradient background
fill(250, 182, 106, 20);
stroke(237, 129, 104, 100);
for(int f=0; f<=height; f+=10) {
  rect(f, f, 250, 250);
  }

//thick blurry curve lines
stroke(242, 220, 134, 70);
noFill();
strokeWeight(5);
for(int l=0; l<=height; l+=10) {
  bezier(0, 0, random (l), random (l), random (l), random (l), 250, 250);
}

//thin clear curve lines
stroke(242, 220, 134, 200);
noFill();
strokeWeight(1);
for(int l=0; l<=height; l+=10) {
  bezier(0, 0, random (l), random (l), random (l), random (l), 250, 250);
}

//small sparkling dots
fill(255, 200);
noStroke();
for(int c=0; c<=height; c+=10) {
  ellipse (random(c), random(c), 3, 3);
}


