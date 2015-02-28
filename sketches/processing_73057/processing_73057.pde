
size(800, 500);
background(220, 255, 60);


for (int i = 30; i < 500; i = i+5) {
  for (int j = 30; j < 180; j = j+5) {
    point(i, j);
  }
}

for (int i = 260; i < 380; i = i+10) {
  for (int j = 100; j < 200; j = j+10) {
    point(i, j);
  }
}


for (int i = 0; i < 800; i = i+10) {
  for (int j = 0; j < 500; j = j+20) {
    point(i, j);
  }
}


for (int i = 500; i < 800; i = i+5) {
  for (int j = 300; j < 500; j = j+10) {
    point(i, j);
  }
}


for (int i = 90; i < 250; i = i+50) {
  for (int j = 300; j < 500; j = j+50) {
    rect(i, j, 20, 20,5);
  }
}


for (int i = 600; i < 720; i = i+50) {
  for (int j = 100; j < 400; j = j+20) {
    rect(i, j, 10, 10);
  }
}

for (int i = 0; i < 500; i = i+80) {
  for (int j = 0; j < 200; j = j+60) {
    rect(i, j, 10, 10);
  }
}
