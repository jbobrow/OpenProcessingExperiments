
size(400, 400);
background(217, 255, 140);

fill(0, 0, 0, 90);
strokeWeight(5);
stroke(255, 85, 0, 90);

for (int i = 10; i <= 1000; i = i+10){
  for (int j = 10; j <= 1000; j = j + 10){
    point(i+j, i/j);
  }
}

fill(0, 0, 0, 0);
stroke(34, 111, 199, 90);

for (int i = 10; i <= 350; i = i+50){
  for (int j = 10; j <= 350; j = j + 50){
   fill(i+j-100, j-30, i-2*j, i+j-100);
   rect(i, 200 + j, i, j);
 }
}

fill(0, 0, 0, 90);

for(int x = 0; x<=250; x=x+50) {
  for (int y = 100; y<=350; y=y+100){
  strokeWeight(x/40);
  stroke(255, 255, 255, x);
  ellipse(x, y, x, x);
  }
}


