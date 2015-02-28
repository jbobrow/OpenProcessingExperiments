
size(600,600);
background(230);

fill(255,255,255);
ellipse(300, 300, 300, 300);
  
for (int i = 5; i < width; i += 30) {
if (i < width/2) {
  fill(i,i/3,i/2,50);
  ellipse(width/2, height/2, i, i);
}
}

int i = 0;
if (i < width/2) {
  line(width/2, height/2, 0, 0);
}

fill(0);
ellipse(300,300,5,5);

for (int d = 430; d < 530; d += 10) {
  stroke(150-d);
  strokeWeight(5);
  line(480, d, 530, d);
}


