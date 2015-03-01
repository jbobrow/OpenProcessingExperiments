
void setup() {
  size(640, 640);
  strokeWeight(10);
  /* So we don't have any pointy connections. */
  strokeJoin(ROUND);
}

void draw() {
  background(30);
  translate(width/2, height/2);
  /* To fit the shape to the origonal logo, we minus -105. Add "frameCount" to move. */
  rotate(radians(-105+frameCount*3));

  /* We want 3 of our shapes to be put together. To rotate them to fit, we go to 360 by adding 120. */
  for (int q = 0; q < 360; q+=120) {
    /* Colors */
    if (q == 0)  fill(255, 0, 0);
    if (q == 120)fill(0, 255, 0);
    if (q == 240)fill(255, 255, 0);

    /* Our individual shape starts here. */
    beginShape();
    /*  The outside shell. */
    for (int i = 0; i <= 119; i++) {
      float x = sin(radians(q+i));
      float y = cos(radians(q+i));
      vertex(x*206, y*206);
    }
    /* 
     Then we go to our inner shell, we start at 170 so we have a direct link to our inner shell instead
     of it cutting through. To get the diagonal lines, we go to 80.
     Also there is a little problem when you add strokeWeight so 170 should be 200. Otherwise some lines are 
     not the correct size;
     */
    for (int i = 170; i >= 80; i--) {
      float x = sin(radians(q+i));
      float y = cos(radians(q+i));
      vertex(x*53, y*53);
    }
    endShape();
  }
  /* Our inner circle */
  fill(0, 150, 255);
  ellipse(0, 0, 106, 106);
}



