
size(400, 400);
smooth();
background(30);
strokeWeight(3);
colorMode(HSB);


for (int i=20; i<=400; i+=30) {
  for (int j=20; j<=400; j+=30) {
    if (i<=200&&j<=200){
      stroke(230);
      fill(1, 150, j+70);
      ellipse(i, j, 20, 20);
    } else if (i>=200&&j<=200) {
      stroke(100, 150, 200);
      line(i, j, i+50, j);
    } else if (i<=200&&j>=200) {
      stroke(150, 150, 200);
      line (i, j, i-50, j);
    } else if (i>=200&&j>=200) {
      fill(220, 150, j-160);
      stroke(230);
      ellipse(i, j, 20, 20);
    }
    }
}

