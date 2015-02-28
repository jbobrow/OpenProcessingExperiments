
smooth();
background(255);
size(600, 600);
noFill();

for (int x=0;x<=850;x+=75) {
  ellipse(width/2, height/2, x, x); //red circles radiating from the center
  stroke(255, 0, 0);
  strokeWeight(10);
}

stroke(0);
strokeWeight(1);
for (int x=0;x<=850;x+=25) {
  ellipse(width/2, height/2, x, x); //circles radiating from the center
}

for (int x=0;x<=850;x+=50) {
  ellipse(width/4, height/4, x, x); //top right circles
  ellipse((3*width)/4, height/4, x, x);//top left circles
  ellipse(width/4, (3*height)/4, x, x); //bottom right circles
  ellipse((3*width)/4, (3*height)/4, x, x); //bottom left circles
}


