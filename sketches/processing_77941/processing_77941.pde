
float k = 0;
float a = 0;
float t = 0;
float h = 0;
float e = 0;
float r = 0;
float i = 0;
float n = 0;
float p = 0;
float m = 0;
float o = 0;
float c = 0;
float b = 0;
float f = 0;
float g = 0;
float y = 0;
float l = 0;
float j = 0;
float v = 0;
PFont font;
PFont font2;

void setup() {
  smooth();
  noStroke();
  size(500, 600);

  font = createFont("Nyala", 20, true);
  font2 = createFont("Nyala", 25, true);
}

void draw() {
  t += .1;
  h += .1;
  e += .5;

  if (h > 50) {
    h = 50;
  }

  if (e > 200) {
    e = 200;
  }

  if (t > 60) {
    a += .1;
    r += .3;
    b += 5;
  }

  if (t > 80) {
    n += .5;
  }

  if (t > 85) {
    p += .5;
  }

  if (t > 90) {
    m += .5;
  }

  if (t > 95) {
    o += .5;
  }

  if (r > 200) {
    r = 200;
  }

  if (a > 80) {
    a = 80;
  }

  if (t > 160) {
    k += .1;
    i += .3;
    n -= 1.5;
    p -= 1.5;
    m -= 1.5;
    o -= 1.5;
  }

  if (t > 180) {
    f += 5;
  }

  if (t > 200) {
    g += .5;
  }

  if (t > 210) {
    y += .5;
  }

  if (t > 220) {
    l += .5;
  }

  if (t > 230) {
    j += .5;
  }

  if (t > 250) {
    v += .8;
  }
  
  if (t > 320) {
    v -= 3;
    j -= 3;
    l -= 3;
    y -= 3;
    g -= 3;
  }
  
  if (t > 370){  
    b -= 1;
    f -= 1;
    k -= 1;
    a -= 1;
  }

  if (i > 200) {
    i = 200;
  }

  if (k >80) {
    k = 80;
  }

  background(100, 25, 25);

  fill(0, e);
  ellipseMode(CENTER);
  ellipse(250, 532, 550, 30);

  ellipseMode(CORNER);
  fill(0, i);
  ellipse(238, 520, 500, 30);
  fill(0, r);
  ellipse(265, 550, -500, -30); 

  ellipseMode(CENTER);

  fill(250, h);
  triangle(250, -200, 0, 525, 500, 525);
  triangle(250, -200, 50, 525, 450, 525);
  triangle(250, -200, 100, 525, 400, 525);

  fill(0, 30);
  rect(0, 525, 500, 750);

  fill(135, 255, 250, a);
  triangle(800, -500, 240, 530, -180, 530);

  fill(173, 0, 0);
  rect(240, 130, 27, 30);
  rect(227, 200, 54, 80);
  ellipse(250, 115, 48, 60);
  ellipse(266, 195, 45, 45);
  triangle(231, 85, 231, 95, 252, 85);
  triangle(232, 85, 225, 100, 230, 155);
  triangle(229, 90, 232, 150, 250, 100);
  triangle(225, 100, 222, 110, 230, 155);
  triangle(260, 88, 272, 92, 274, 110);
  triangle(272, 92, 276, 110, 270, 140);
  triangle(272, 92, 270, 142, 255, 100);
  triangle(209, 160, 291, 165, 255, 310);
  triangle(208, 310, 292, 315, 255, 160);
  triangle(208, 310, 232, 450, 260, 310);
  triangle(292, 314, 280, 420, 245, 310);
  triangle(240, 320, 255, 525, 232, 420);
  triangle(220, 310, 252, 525, 225, 445);
  triangle(285, 370, 255, 510, 259, 435);
  triangle(255, 510, 290, 330, 285, 420);
  triangle(243, 527, 240, 430, 260, 527);
  triangle(243, 527, 243, 505, 282, 530);
  triangle(258, 480, 260, 527, 245, 510);  
  triangle(210, 162, 285, 165, 255, 145);
  triangle(210, 160, 175, 235, 240, 160);
  triangle(227, 160, 175, 235, 180, 247);
  triangle(175, 235, 215, 285, 185, 225);
  triangle(175, 238, 215, 295, 185, 235);
  triangle(200, 265, 228, 300, 212, 295);
  triangle(210, 292, 208, 275, 225, 275);
  triangle(290, 165, 302, 240, 285, 188);
  triangle(280, 165, 292, 230, 303, 240);
  triangle(292, 230, 284, 285, 303, 240);
  triangle(262, 285, 287, 295, 287, 270);

  fill(255, 250, 35, k);
  triangle(-300, -500, 260, 530, 680, 530);

  textFont(font);
  fill(255, b);
  text("If you take everything at face value...", 20, 35);
  fill(255, f);
  text("...you're only getting half the story.", 210, 55);

  textFont(font2);
  fill(20, 40, 40, n);
  text("tiny", 120, 290);
  text("fragile", 130, 310);

  fill(20, 40, 40, p);
  text("calm", 110, 350);
  text("collected", 90, 370);

  fill(20, 40, 40, m);
  text("quiet", 60, 420);

  fill(20, 40, 40, o);
  text("antisocial", 30, 470);
  text("overachiever", 50, 490);

  fill(245, 250, 50, g); 
  text("writer", 340, 300);

  fill(245, 250, 50, y); 
  text("Christian", 320, 330);

  fill(245, 250, 50, l); 
  text("visual artist", 350, 365);
  text("martial artist", 360, 385);

  fill(245, 250, 50, j); 
  text("anglophile", 305, 425);
  text("mythology nut", 340, 445);
  text("military history buff", 295, 465);

  fill(245, 250, 50, v); 
  text("complete nerd", 360, 505);
}


