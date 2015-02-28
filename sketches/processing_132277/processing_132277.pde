
size(400, 400);
background(56, 50, 250);
smooth();
//noStroke();

strokeWeight(2);
//Purple circles
for (int y = 0; y <= height; y += 50) {
  for (int x = 0; x <= width; x += 50) {
    fill(212, 153, 245, 160);
    ellipse(x, y, 50, 50);
  }
}

//Boxes
//stroke(1);
strokeWeight(3);
noFill();
for (int a = 10; a <= 375; a+= 50) {
  for (int b = 10; b <= 375; b += 50) {
    rect(a, b, 30, 30);
  }
}

noStroke();
//Blue circles
for (int j = 0; j <= height; j += 50) {
  for (int k = 0; k <= width; k += 50) {
    fill(33, 170, 206);
    ellipse(j, k, 20, 20);
  }
}



