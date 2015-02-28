
size(600, 200);
background(25, 88, 245);
smooth();

strokeWeight(1);
stroke(255);
for (int y = 10; y <=200; y += 4){
  for (int x = 100; x <= 600; x += 10){
    line (x, y, x + 50, y + 2);
  }
}

strokeWeight(2);
stroke(255);
for (int y = 50; y <=500; y += 4){
  for (int x = 500; x <= 600; x += 10){
    line (x, y, x - 5, y + 20);
  }
}

strokeWeight(1);
stroke(32,188,132);
for (int y = 20; y <=500; y += 10){
  for (int x = 50; x <= y; x += 5){
    line (x, y, x - 20, y - 20);
  }
}

strokeWeight(2);
stroke(32,188,132);
for (int y = 2; y <=500; y*= 5){
  for (int x = 2; x <= y; x*= 10){
    line (x, y, x + 30, y + 30);
  }
}

strokeWeight(2);
stroke(32,188,132);
for (int y = 2; y <=500; y*= 5){
  for (int x = 2; x <= y; x*= 10){
    line (x, y, x + 800, y + 300);
  }
}

