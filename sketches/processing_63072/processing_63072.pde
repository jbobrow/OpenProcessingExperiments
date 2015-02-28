
size(600, 600);
smooth();
noFill();
strokeWeight(.5);
background(255);

for (int i=5; i<=1250; i=i+50) {
  for (int j=5; j<=1250; j=j+50) {
//arc(i,j,i,j,PI+HALF_PI,TWO_PI+PI);
stroke(255,188,3,80);

arc(0,600,i,j,HALF_PI,TWO_PI);
stroke(0,188,3,80);

arc(600,0,i,j,HALF_PI,PI);

endShape();
  }
}


