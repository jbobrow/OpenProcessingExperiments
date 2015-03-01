
size(300,300);

background(80,60,110);
stroke(242,178,75);

for (int x = 0; x < 300; x += 4) {
  float n = norm(x,0.0,300.0);
  float y = pow(n,8);
  y *= 300;
  point(x,y);
    strokeWeight(2);
  line(x,0,x,y);
}

for (int x = 0; x < 300; x += 6) {
  float n = norm(x,0.0,300.0);
  float y = 1 - pow(n,8);
  y *= 300;
  strokeWeight(.5);
  line(x,0,x,y);
}

for (int x = 0; x < 300; x += 8) {
  float n = norm(x,0.0,300.0);
  float y = 1 - pow((1-n),8);
  y *= 300;
  strokeWeight(1);
  line(x,y,0,y);
}

for (int x = 0; x < 300; x += 10) {
  float n = norm(x,0.0,300.0);
  float y = pow((1-n),8);
  y *= 300;
  strokeWeight(.25);
  line(x,y,0,y);
}


