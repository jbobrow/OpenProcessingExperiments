
int x = 0;

void setup() {
  size(400, 300);
  background(0);

  smooth();
}

void draw() { 
  stroke(256, 10, 240);
  strokeWeight(3.5);

  line(0, height/2, width/4-10, height/2);
  line(width/4-10, height/2, width/4+30, height/2-40);
  line(width/4+30, height/2-40, width/4+50, height/2);
  line(width/4+50, height/2, width/4+65, height/2);
  line(width/4+65, height/2, width/4+75, height/2+15);
  line(width/4+75, height/2+15, width/4+90, height/2-130);
  line(width/4+90, height/2-130, width/4+100, height/2+60);
  line(width/4+100, height/2+60, width/4+115, height/2);
  line(width/4+115, height/2, width/4+140, height/2);
  line(width/4+140, height/2, width/4+190, height/2-30);
  line(width/4+190, height/2-30, width/4+220, height/2);
  line(width/4+220, height/2, width, height/2);

  filter(BLUR, 1);

  fill(0);
  noStroke();
  rect(x, 0, width, height);

  x += 8;

  if (x > width) {
    x = 0;
  }
}


