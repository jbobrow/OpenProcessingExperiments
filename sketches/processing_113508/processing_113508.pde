
int eSize = 12; //star_size
int eSize2 = 10;
int eSize3 = 8;
int eSize4 = 5;

size(800, 800);
background(0, 10, 50);
noStroke();
smooth();

//white_milky_way
for (int x = 0; x < 200; x += 6) {
  for (int y = 0; y < 200; y += 6) {
    stroke(255, 3);
    line(-200+x, 800, 800, -200+y); //left
    line(950+x, -200, -200, 950+y); //right
  }
}


//pink_center_star
for (int x = 0; x < width; x += random(79)) {
  for (int y = 0; y < width; y += random(62)) {
    float a1 = random(50, 255);

    if (x + y > 600 && x + y < 950) {
      fill(240, 200, 240, a1);
    }
    else {
      fill(255, 0);
    }

    ellipse(x, y, eSize, eSize);
  }
}

//blue_center_star
for (int x = 0; x < width; x += random(61)) {
  for (int y = 0; y < height; y += random(72)) {
    float a1 = random(50, 255);

    if (x + y > 600 && x + y < 950) {
      fill(200, 220, 240, a1);
    }
    else {
      fill(255, 0);
    }

    ellipse(x, y, eSize2, eSize2);
  }
}

//yellow_center_star
for (int x = 0; x < width; x += random(74)) {
  for (int y = 0; y < height; y += random(81)) {
    float a1 = random(50, 255);
    float a2 = random(0, 200);

    if (x + y > 600 && x + y < 950) {
      fill(255, 255, 230, a1);
    }
    else {
      fill(255, 0);
    }
    ellipse(x, y, eSize3, eSize3);
    fill(255, a2);
    ellipse(random(800), random(800), eSize4, eSize4); //other_star
  }
}

//orihime
for (int x = 130; x <= 230; x += 2) {
  for (int y = 130; y <= 230; y += 2) {
    stroke(240, 200, 240, 4);
    line(x, 180, 180, y);
  }
}

//hikoboshi
for (int x = 550; x <= 650; x += 2) {
  for (int y = 550; y <= 650; y += 2) {
    stroke(200, 200, 240, 4);
    line(x, 600, 600, y);
  }
}



