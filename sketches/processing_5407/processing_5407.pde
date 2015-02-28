
boolean vector = false;

// shapes & images
PImage bg2;
PShape cup_;
PShape head_;
PShape wheel_;
PShape eye_;
PShape eyeblack;
PShape buttons;
PShape thirsty;
PShape robot1;
PShape steam, steam2, todo, heart, mompin, aplus, ribbon, star, prize, pic;

// variables
float w, targetW, easingW = 0.02;
float h, targetH, easingH = 0.03;
float e, targetE, easingE = 0.033;
float a, targetA, easingA = 0.027;
float s = 0.0, targetS, easingS = 0.01;
float l = 0.0;
int y = 338;
float speed = 1;
float speed2 = 0;
float x;
float z;
float angle;
float angle2;
float q, r, t, u, i, o, p, m, n, b, v;

// button colors
color clear = color (200, 255, 255, 100);
color red = color (237, 34, 36);
color yellow = color (246, 235, 22); 
color purple = color (143, 80, 160); 
color green = color (113, 192, 91); 
color blue = color (69, 85, 165); 
color orange = color (249, 159, 27); 
color white = color (255); 
color magenta = color (206, 76, 140); 
color teal = color (68, 195, 211); 



void setup() {
  size(320, 480);
  smooth();
  strokeCap(ROUND);
  frameRate(30);

  // load images
  bg2 = loadImage("kitchen2.png");

  // load shapes
  robot1 = loadShape("robot1.svg");
  cup_ = loadShape("cup.svg");
  head_ = loadShape("head.svg");
  wheel_ = loadShape("wheel.svg");
  eye_ = loadShape("eye.svg");
  eyeblack = loadShape("eyeblack.svg");
  buttons = loadShape("buttonsblack.svg");
  thirsty = loadShape("thirsty.svg");
  steam = loadShape("steam.svg");
  steam2 = loadShape("bigsteam.svg");
  todo = loadShape("todo.svg");
  heart = loadShape("heart.svg");
  mompin = loadShape("mompin.svg");
  aplus = loadShape("aplus.svg");
  ribbon = loadShape("ribbon.svg");
  star = loadShape("star.svg");
  prize = loadShape("prize.svg");
  pic = loadShape("pic.svg");
}



// drawing the robot

void neck1() {     // NECK
  strokeWeight(14);
  stroke(80);
  line(h, 202, w, y);
  strokeWeight(4);
  stroke(0);
  line(h+7, 202, w+7, y);
  line(h-7, 202, w-7, y);
}

void head1() {     // HEAD
  shape(head_, h-72.5, 142); 
}

void antenna1() {     // ANTENNA
  strokeWeight(5);
  line(a+42, 100, h+27, 161);

  strokeWeight(2);
  fill(237, 28, 36);
  ellipse(a+42, 100, 10, 10);
}

void cup1() {     // CUP
  shape(cup_, h-24.5, 107); 
}

void drink1() {     // DRINK
  stroke(0);
  strokeWeight(1);

  fill(clear);
  noStroke();
  beginShape();
  vertex(h-19, 128);
  bezierVertex(h-19, 128, h-8, 124, h-1, 125);
  bezierVertex(h+6, 126, h+8, 128, h+12, 126);
  bezierVertex(h+16, 125, h+20, 126, h+19, 128);
  bezierVertex(h+19, 128, h+14, 162, h+14, 162);
  bezierVertex(h+10, 163, h-5, 164, h-14, 162);
  bezierVertex(h-14, 162, h-19, 128, h-19, 128);
  endShape();

  beginShape();
  vertex(h-19, 128);
  bezierVertex(h-19, 128, h-8, 124, h-1, 125);
  bezierVertex(h+6, 126, h+8, 128, h+12, 126);
  bezierVertex(h+16, 125, h+20, 126, h+19, 128);
  bezierVertex(h+19, 128, h+20, 131, h+12, 131);
  bezierVertex(h+4, 131, h-1, 130, h-7, 132);
  bezierVertex(h-14, 134, h-19, 128, h-19, 128);
  endShape();
  stroke(0);

  line(h-21.5, 114, h-14.5, 161);
  line(h+20.5, 114, h+13.5, 161);
}

void eyesblack() {     // EYES TURNED OFF
  strokeWeight(2);
  x = x + speed * 10;
  fill(x);
  ellipse(e-42, 220, 17, 17);
  ellipse(e+45, 220, 17, 17);
}

void antennablack() {     // ANTENNA TURNED OFF
  strokeWeight(5);
  line(a+42, 100, h+27, 161);

  strokeWeight(2);
  fill(x);
  ellipse(a+42, 100, 10, 10);
}

void buttonsblack() {     // BUTTONS TURNED OFF
  strokeWeight(1);
  fill(x);
  rect(e-12, 221, 7, 7);

  fill(x);
  rect(e-3, 221, 7, 7);

  fill(x);
  rect(e+6, 221, 7, 7);

  fill(x);
  rect(e-12, 230, 7, 7);

  fill(x);
  rect(e-3, 230, 7, 7);

  fill(x);
  rect(e+6, 230, 7, 7);

  fill(x);
  rect(e-12, 239, 7, 7);

  fill(x);
  rect(e-3, 239, 7, 7);

  fill(x);
  rect(e+6, 239, 7, 7);
}

void wheel1() {     // WHEEL
  strokeWeight(4);
  pushMatrix();
  translate(w, y);
  rotate(s);
  shape(wheel_, -48.5, -48.5);
  popMatrix();
}

void eyes1() {     // EYES
  shape(eye_, e-51.5, 210.5); 
  shape(eye_, e+35.5, 210.5);
}

void buttonsrandom() {     // BUTTONS TURNING ON
  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e-12, 221, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e-3, 221, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e+6, 221, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e-12, 230, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e-3, 230, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e+6, 230, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e-12, 239, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e-3, 239, 7, 7);

  fill(random(0, 255), random(0, 255), random(0, 255));
  rect(e+6, 239, 7, 7);
}

void buttons1() {     // BUTTONS ON
  strokeWeight(1);
  fill(red);
  rect(e-12, 221, 7, 7);

  fill(yellow);
  rect(e-3, 221, 7, 7);

  fill(purple);
  rect(e+6, 221, 7, 7);

  fill(green);
  rect(e-12, 230, 7, 7);

  fill(blue);
  rect(e-3, 230, 7, 7);

  fill(orange);
  rect(e+6, 230, 7, 7);

  fill(white);
  rect(e-12, 239, 7, 7);

  fill(magenta);
  rect(e-3, 239, 7, 7);

  fill(teal);
  rect(e+6, 239, 7, 7);
}

void stilleasing() {     // NO CONTROL BY USER
  targetW = x;
  w = w + ((targetW - w) * easingW);
  targetH = x;
  h = h + ((targetH - h) * easingH);
  targetE = x;
  e = e + ((targetE - e) * easingE);
  targetA = x;
  a = a + ((targetA - a) * easingA);
  targetS = x;
  s = targetS * easingS;
}

void easing() {     // INTERACTIVE WITH USER
  targetW = mouseX;
  w = w + ((targetW - w) * easingW);
  targetH = mouseX;
  h = h + ((targetH - h) * easingH);
  targetE = mouseX;
  e = e + ((targetE - e) * easingE);
  targetA = mouseX;
  a = a + ((targetA - a) * easingA);
  targetS = mouseX;
  s = targetS * easingS;
}           



void draw() {
  
  background(255);
  image(bg2, 0, 0);

  float time = millis();
  float time2 = millis();


  // MOVING ELEMENTS IN THE BACKGROUND
  
  // STEAM
  if(time2 < 900000000) {
    speed = random(.1, .5);
  }
  else {
  } 
  q = q + speed; 
  if (q > 30) {
    q = 0;  
  } 
  shape(steam, 160, 260 - q); 


  if(time2 < 900000000) {
    speed = random(.1, .5);
  }
  else {
  } 
  r = r + speed; 
  if (r > 50) {
    r = 0;  
  } 
  shape(steam2, 160, 260 - r); 


  // FRIDGE
 pushMatrix();
  shape(todo, -20, 400 + u); 
  if(time2 > 50000) {
    speed = random(1, 3);
    u = u + speed; 
  }

  shape(heart, 50, 250 + i); 
  if(time2 > 42000) {
    speed = random(1, 3);
    i = i + speed; 
  }

  shape(aplus, 7, 160 + p);  
  if(time2 > 35000) {
    speed = random(1, 3);
    p = p + speed; 
  }

  shape(mompin, 65, 285 + o); 
  if(time2 > 30000) {
    speed = random(1, 3);
    o = o + speed; 
  } 

  shape(ribbon, -25, 200 + m); 
  if(time2 > 25000) {
    speed = random(1, 3);
    m = m + speed; 
  }

  shape(star, 5, 250 + n); 
  if(time2 > 15000) {
    speed = random(1, 3);
    n = n + speed; 
  }

  shape(prize, 3, 350 + b);  
  if(time2 > 10000) {
    speed = random(1, 3);
    b = b + speed; 
  }
  
  shape(pic, 10, 340 + v); 
  if(time2 > 5000) {
    speed = random(1, 3);
    v = v + speed; 

  } 
  popMatrix();
  angle2 = angle2 + random(-0.1, 0.1);




  if(time < 3000) {     // START UP

    pushMatrix();  
    translate(160, 0); 
    neck1();
    head1();
    antennablack();
    cup1();
    drink1();
    eyesblack();
    buttonsblack();
    wheel1();
    popMatrix();
  } 

  else if (time < 3600) {     // BUTTONS POWER ON

    pushMatrix();
    translate(160, 0);  
    neck1();
    head1();
    antenna1();
    cup1();
    drink1();
    eyes1();
    buttonsrandom();
    wheel1();
    popMatrix();
  } 

  else if (time < 4000) {     // BUTTONS POWER ON

    pushMatrix();
    translate(160, 0); 
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    eyes1();
    buttons1();
    wheel1();
    popMatrix();
  } 

  else if (time < 5000) {     // WANDER RIGHT
    stilleasing();
    x = 80;

    pushMatrix();
    translate(160, 0);
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    buttons1();
    wheel1();
    popMatrix();
  } 

  else if (time < 7000) {     // WANDER LEFT
    stilleasing();
    x = -60;

    pushMatrix();
    translate(160, 0);
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    buttons1();
    wheel1();
    popMatrix();
  } 

  else if (time < 9000) {     // THIRSTY
    stilleasing();
    x = -60;

    stroke(0);
    pushMatrix();
    translate(160, 0);
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    buttons1();
    wheel1();
    popMatrix();

    // THIRSTY
    shape(thirsty, 200, 150); 
  } 

  else if (time < 9500) {     // EYES
    stilleasing();
    x = -60;

    stroke(0);
    pushMatrix();
    translate(160, 0);
    neck1();
    head1();
    antenna1();
    pushMatrix();
    translate(z/4, 0);
    eyes1();
    buttons1();
    z = z + speed * 1;
    popMatrix();
    cup1();
    drink1();
    wheel1();
    popMatrix();
  } 

  else if (time < 10000) {     // NORMAL
    stilleasing();
    x = -60;

    stroke(0);
    pushMatrix();
    translate(160, 0);
    neck1();
    head1();
    antenna1();
    pushMatrix();
    translate(8, 0);
    eyes1();
    buttons1();
    popMatrix();
    cup1();
    drink1();
    wheel1();
    popMatrix();
  } 

  else if (time < 14000) {     // OFF-SCREEN
    stilleasing();
    x = -240;

    stroke(0);
    pushMatrix();
    translate(160, 0);
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    buttons1();
    wheel1();
    popMatrix();
  } 

  else if (time < 900000000) {     // INTERACTIVE
    easing();

    stroke(0);
    pushMatrix();
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    buttons1();
    wheel1();
    popMatrix();
  }

}


// DRINK CHANGE

// TOP ROW
void keyPressed() {
  if (key == '1' || key =='r') {
    clear = color (237, 34, 36, 100); 
  }
  else if (key == '2' || key =='y') {
    clear = color (246, 235, 22, 100); 
  } 
  else if (key == '3' || key =='p') {
    clear = color (143, 80, 160, 100); 
  } 

  // MIDDLE ROW
  else if (key == '4' || key =='g') {
    clear = color (113, 192, 91, 100); 
  }
  else if (key == '5' || key =='b') {
    clear = color (69, 85, 165, 100); 
  }
  else if (key == '6' || key =='o') {
    clear = color (249, 159, 27, 100); 
  }

  // BOTTOM ROW
  else if (key == '7' || key =='w') {
    clear = color (255, 100); 
  }
  else if (key == '8' || key =='m') {
    clear = color (206, 76, 140, 100); 
  }
  else if (key == '9' || key =='t') {
    clear = color (68, 195, 211, 100); 
  } 
  else if (key == '0') {
    clear = color (200, 255, 255, 100);
  } 
  else if (key == ' ') {
    if (vector == true) {
      vector = false; 
    } 
    else {
      vector = true; 
    }
    //vector = !vector;  // This line is the same as the five above
  }
}

