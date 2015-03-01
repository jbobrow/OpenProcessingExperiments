

size(400, 400);
background(255);

for (int x=0; x<=400; x+=7) {//migi
  stroke(250, 0, 100, 30);
  line(400, 0, x, 400);
  stroke(250, 0, 150, 30);
  line(400, 50, x, 400);
  stroke(250, 0, 200, 30);
  line(400, 100, x, 400);
  stroke(250, 0, 250, 30);
  line(400, 150, x, 400);
  stroke(200, 0, 250, 30);
  line(400, 200, x, 400);
  stroke(150, 0, 250, 30);
  line(400, 250, x, 400);
  stroke(100, 0, 250, 30);
  line(400, 300, x, 400);
  stroke(50, 0, 250, 30);
  line(400, 350, x, 400);
  stroke(0, 0, 250, 30);
  line(400, 400, x, 400);
}

for (int y=0; y<=400; y+=7) {//sita
  stroke(0, 0, 250, 30);
  line(400, 400, 0, y);
  stroke(0, 50, 250, 30);
  line(350, 400, 0, y);
  stroke(0, 100, 250, 30);
  line(300, 400, 0, y);
  stroke(0, 150, 250, 30);
  line(250, 400, 0, y);
  stroke(0, 200, 250, 30);
  line(200, 400, 0, y);
  stroke(0, 250, 250, 30);
  line(150, 400, 0, y);
  stroke(0, 250, 200, 30);
  line(100, 400, 0, y);
  stroke(0, 250, 150, 30);
  line(50, 400, 0, y);
  stroke(0, 250, 100, 30);
  line(0, 400, 0, y);
}

for (int x=0; x<=400; x+=7) {//hidari
  stroke(0, 200, 250, 60);
  line(0, 400, x, 0);
  stroke(0, 200, 200, 60);
  line(0, 350, x, 0);
  stroke(0, 200, 150, 60);
  line(0, 300, x, 0);
  stroke(0, 200, 100, 60);
  line(0, 250, x, 0);
  stroke(0, 200, 50, 60);
  line(0, 200, x, 0);
  stroke(0, 200, 0, 60);
  line(0, 150, x, 0);
  stroke(50, 200, 0, 60);
  line(0, 100, x, 0);
  stroke(100, 200, 0, 60);
  line(0, 50, x, 0);
  stroke(150, 200, 0, 60);
  line(0, 0, x, 0);
}

for (int y=0; y<=400; y+=7) {//ue
  stroke(150, 200, 0, 40);
  line(0, 0, 400, y);
  stroke(200, 200, 0, 40);
  line(50, 0, 400, y);
  stroke(250, 200, 0, 40);
  line(100, 0, 400, y);
  stroke(250, 150, 0, 40);
  line(150, 0, 400, y);
  stroke(250, 100, 0, 40);
  line(200, 0, 400, y);
  stroke(250, 50, 0, 40);
  line(250, 0, 400, y);
  stroke(250, 0, 0, 40);
  line(300, 0, 400, y);
  stroke(250, 0, 50, 40);
  line(350, 0, 400, y);
  stroke(250, 0, 100, 40);
  line(400, 0, 400, y);
}

for (int i=0; i<=400; i+=10) {
  rectMode(CENTER);
  noFill();
  rect(width/2, height/2, i, i);
}


