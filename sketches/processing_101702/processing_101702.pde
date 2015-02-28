
// initial position for our circle
float circle_x[] = {
};
float circle_y[] = {
};
// how much to move the circle on each frame
float move_x[] = {
};
float move_y[] = {
};
float coH[] = {
};
float ra[] = {
};

void setup() {
  size(600, 400);
  stroke(#0D7424);
  smooth();
}

void draw() {
  fill(0, 10);
  rect(0, 0, width, height);
  noFill();

  int i = 0;
  while (i < circle_x.length) {
    float sz = random(10, 30) * ra[i];
    //sz = sz * ra;
    //float sz = 60;

    colorMode(HSB, 100);
    stroke(coH[i], 80, 80);
    colorMode(RGB);

    ellipse(circle_x[i]+random(-5, 5), circle_y[i]+random(-5, 5), sz, sz);
    circle_x[i] += move_x[i];
    circle_y[i] += move_y[i];

    if (circle_x[i] > width - sz/2) {
      circle_x[i] = width - sz/2;
      move_x[i] = -move_x[i];
    }
    if (circle_y[i] > height - sz/2) {
      circle_y[i] = height - sz/2;
      move_y[i] = -move_y[i];
    }
    if (circle_x[i] < sz/2) {
      circle_x[i] = sz/2;
      move_x[i] = -move_x[i];
    }
    if (circle_y[i] < sz/2) {
      circle_y[i] = sz/2;
      move_y[i] = -move_y[i];
    }
    i += 1;
  }
}

void mousePressed() {
  circle_x = append(circle_x, mouseX);
  circle_y = append(circle_y, mouseY);
  move_x = append(move_x, random(-1, 1));
  move_y = append(move_y, random(1, 2));
  coH = append(coH, random(100));
  if (random(20) > 14) {
    ra = append(ra, 2);
  } 
  else {
    ra = append(ra, 1);
  }
}
