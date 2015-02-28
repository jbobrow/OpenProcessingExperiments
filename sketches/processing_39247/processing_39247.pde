
float sx;
PImage cow;

void setup () {
  size (600, 600);
  smooth ();
  cow = loadImage ("cow2.png");
}

void draw () {
  if (millis () < 5000 || millis () == 5000) {
    background (0,215,255);
    float s = map (millis (), 0, 5000, height, 150);
    float sx = 300;
    constrain (sx, 150, 450);
    stroke (0);
    strokeWeight(3);
    fill (121, 161, 162);
    arc (sx, s, 200, 200, PI, TWO_PI);
    arc (sx, s+50, 300, 20, 0, PI);
    noStroke ();
    rect (sx-100, s, 200, 51);
    triangle (sx+100, s, sx+100, s+51, sx+150, s+51);
    triangle (sx-100, s, sx-100, s+51, sx-150, s+51);
    fill (0, 255, 0);
    ellipse (sx, s+25, 20, 20);
    ellipse (sx+40, s+25, 20, 20);
    ellipse (sx+80, s+25, 20, 20);
    ellipse (sx-40, s+25, 20, 20);
    ellipse (sx-80, s+25, 20, 20);
    stroke (0);
    line (sx-100, s, sx-150, s+50);
    line (sx+100, s, sx+150, s+50);
  } 
  else {
    noStroke ();
    float sx = 300;
    float gy = map (millis (), 5000, 10000, 210, height);
    float gx = map (millis (), 5000, 10000, sx, width);
    float gz = map (millis (), 5000, 10000, sx, 0);

    fill (0, 255, 0, 150);
    triangle (sx, 220, gx, gy, gz, gy);
  }
  if (millis () >= 10000 || millis () == 15000) {
    frameRate (15);
    fill (random (255), random (255), random (255), random (255));
    triangle (300, 210, 0, height, width, height);
    float gy = map (millis (), 10000, 15000, 210, height);
    float gx = map (millis (), 10000, 15000, sx, width);
    float gz = map (millis (), 10000, 15000, sx, 0);
    float cowx = map (mouseX, 0, width, gx, gz);
    float cowy = map (millis (), 10000, 15000, height, 210);
    cowy = constrain (cowy, 200, height);
    image (cow, 260, cowy, 80, 60);
  }
} 



