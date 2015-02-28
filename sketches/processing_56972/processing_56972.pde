
float x, y, x1, y1;

void setup() {
  size(400, 400);
  keyReleased();
}

void keyReleased(){
  background(222);

  x = random(0, width);
  y = random(0, height);

  x1 = random(0, width);
  y1 = random(0, height);

  noStroke();
  fill(#cc0000,40);
  ellipse(x, y, 5, 5);
  ellipse(x1, y1, 5, 5);
}

void draw() {

  if (dist(x, y, x1, y1) > 10) {
    float xx = x + random(-width/20, width/20);
    float yy = y + random(-height/20, height/20);

    xx = constrain(xx, 0, width);
    yy = constrain(yy, 0, height);

    float yyp, xxp;
    yyp = yy;
    xxp = xx;

    if (random(0, 2) < 1) {
      xx = x;
      xxp = xx;
      if(yy > y) {
        yyp-=3;
      }
      else {
        yyp+=3;
      }
    }
    else {
      yy = y;
      yyp = yy;
      if (xx > x) {
        xxp-=3;
      }
      else{
        xxp+=3;
      }
    }

    strokeWeight(2);
    stroke(#cc0000, 40);
    line(x, y, xxp, yyp);
    x = xx;
    y = yy;
  }
}

