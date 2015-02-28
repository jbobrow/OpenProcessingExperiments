
//Grass weaving like blowing further and closer with different opacity.
//Yellow means warm sunshine flowing down from the sky and welcoming you back home.
//Stella Wang, Tainan, 2014/01/26

void setup() {
  size(550, 330);
  background(250);
}

void draw() {
  grass1();
  fill(250, 1);
  noStroke();
  rect(0, 0, width, height);
}

void grass1() {
  float xstep;
  float ystep;
  float border = random(-30, width + 150);
  float y = random(180, height);
  float lastx = border;
  float lasty = y;
  float a = random(40, 100);
  float c = 1;

  for (float x = border; y <= height +30; x += xstep, y += ystep) {
    stroke(random(180), random(150, 255), random(255), y*0.2);
    strokeWeight(1);
    xstep = a*sin(noise(3))+20*c*noise(random(40));
    ystep = a*cos(noise(70)*30)+50*c*noise(random(20));
    line(x, y, lastx, lasty);

    stroke(random(200, 255), random(200, 240), random(200), random(50));
    strokeWeight(random(1, 3));
    noFill();
    ellipse(x, y, lastx*20, lasty*20);

    lastx = x;
    lasty = y;
    c *= -1;
  }
}

void keyPressed() {
  background(250);
}



