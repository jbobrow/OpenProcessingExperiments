
size(800, 800);
background(255);
noStroke();
//1段目

for (int x = 0; x < 800; x += 5) {
  for (int y = 0; y < 200; y += 5) {
    fill(x+255, y+150, 70);
    rect(x, y, 5, 5);
  }
}

//2段目
for (int x = 0; x < 800; x += 5) {
  for (int y = 200; y < 400; y += 20) {
    fill(x-100, y+50, 0);
    rect(x, y, 5, 5);
  }
}

//3段目
for (int x = 0; x < 800; x += 5) {
  for (int y = 400; y < 600; y += 25) {
    fill(x-200, y+200, 190);
    rect(x, y, 5, 5);
  }
}

//4段目
for (int x = 0; x < 800; x += 5) {
  for (int y = 600; y < 800; y += 30) {
    fill(x-100, y+150, 255);
    rect(x, y, 5, 5);
  }
}






