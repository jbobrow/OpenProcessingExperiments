
void setup() {
  size(420, 450);
  background(255);
  noLoop();
}

int st_w = 30;
float y_b;
color ichigo = color(245, 146, 210);
color choco = color(75, 43, 39);

void draw() {
  fill(choco);

  noStroke();
  rect(width/2-(width-st_w)/2, 80, width-st_w, 150);

  strokeWeight(3);
  stroke(52, 30, 27);
  ellipse(width/2, 80, width-st_w, 100);
  noStroke();
  fill(ichigo);
  rect(width/2-(width-st_w)/2, 80+150, width-st_w, 150);
  ellipse(width/2, 80+150+150, width-st_w, 100);

  for (int i = 1; i < width/st_w; i++) {
    y_b = random(80+150+10, 80+150+100);

    if (i % 2 == 0) {
      stroke(choco);
      if (random(1) > 0.5) {
        strokeWeight(random(st_w/2, st_w));
        point(i*st_w, random(y_b+st_w*1.2, y_b+st_w*1.8));
      }
    } else {
      stroke(ichigo);
    }
    strokeWeight(st_w);
    line(i*st_w, random(80+150-60, 80+150), i*st_w, y_b);
  }
}



