
// define shapes & images
PImage kitchen1;
PShape kitchen2;
PImage speech, fridge, intro, restart, restart2;
PFont type;
PShape steam, steam2;
PShape stove1, stove2, stove3, stove4, stove5;
PShape cup_, head_, wheel_, eye_;
PShape sbutton1, sbutton2, sbutton3;


// variables
float page = 0; // Stores the current page
float speed2 = random(1, 1.5);
float speed1 = random(1.5, 2);
float speed = random(.5, 1);

float size2 = random(30, 40);
float size3 = random(20, 30);
float size4 = random(20, 30);

float q, r, s_, t, u;
float a_, e_, f, g, h_, i;          // time
float x, y_, b, c, d, j, k, l, m, n, o, p, w_;

float crazy1 = random(300, 600);
float crazy2 = random(300, 600);
float crazy3 = random(300, 600);
float crazy4 = random(300, 600);


// variables
float w, targetW, easingW = 0.02;
float h, targetH, easingH = 0.03;
float e, targetE, easingE = 0.034;
float a, targetA, easingA = 0.027;
float s, targetS, easingS = 0.01;
float sh = 0.0;
int y = 338;


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
  size(640, 480);
  smooth();

  //load shapes & images
  kitchen1 = loadImage("kitchen3.png");
  kitchen2 = loadShape("kitchencartoon.svg");
  speech = loadImage("speechbubble.png");
  type = loadFont("AmericanTypewriter-48.vlw");
  steam = loadShape("steam.svg");
  steam2 = loadShape("bigsteam.svg");
  stove1 = loadShape("stove1.svg");
  stove2 = loadShape("stove2.svg");
  stove3 = loadShape("stove3.svg");
  stove4 = loadShape("stove4.svg");
  stove5 = loadShape("stove5.svg");
  fridge = loadImage("fridge.png");
  intro = loadImage("intro.png");
  restart = loadImage("restart.png");
  restart2 = loadImage("restart2.png");
  sbutton1 = loadShape("stovebutton1.svg");
  sbutton2 = loadShape("stovebutton2.svg");
  sbutton3 = loadShape("stovebutton3.svg");
  
  cup_ = loadShape("cup.svg");
  head_ = loadShape("head.svg");
  wheel_ = loadShape("wheel.svg");
  eye_ = loadShape("eye.svg");

  textFont(type);
  textAlign(LEFT); 
}



// various shortcuts  ⎯  START

void steam() {     // steam bubbles
  if(a > 5) {  }
  else {  } 
  r = r + speed; 
  if (r > 60) {
    r = 0;    } 
  shape(steam2, 160, 250 - r, size3, size3); 

  if(a > 5) {  }
  else {  } 
  q = q + speed1; 
  if (q > 70) {
    q = 0;    } 
  shape(steam, 160, 250 - q, size4, size4); 

  if(a > 5) {  }
  else {  } 
  s = s + speed2; 
  if (s > 65) {
    s = 0;    } 
  shape(steam, 160, 250 - s, size2, size2); 
}


void watercloseup() {     // close-up on the water pot
//  e = e + 1;
  pushMatrix();
  b = -360;
  c = -720;
  d = 3.34375;
  translate(b, c);
  scale(d);
  shape(kitchen2, 0, 0, 640, 480);
  steam();
  popMatrix(); 
}


void crazysteam() {     // steam blowing up
  shape(steam, random(-200, 640), random(-200, 480), crazy1, crazy1); 
  shape(steam, random(-200, 640), random(-200, 480), crazy2, crazy2); 
  shape(steam, random(-200, 640), random(-200, 480), crazy3, crazy3); 
  shape(steam, random(-200, 640), random(-200, 480), crazy4, crazy4); 
  shape(steam2, random(-200, 640), random(-200, 480), crazy1, crazy1); 
  shape(steam2, random(-200, 640), random(-200, 480), crazy2, crazy2); 
  shape(steam2, random(-200, 640), random(-200, 480), crazy3, crazy3); 
  shape(steam2, random(-200, 640), random(-200, 480), crazy4, crazy4); 
}


void crazysteam1() {     // steam blowing up
  shape(steam, random(-200, 640), random(-200, 480), crazy1, crazy1); 
  shape(steam2, random(-200, 640), random(-200, 480), crazy2, crazy2); 
}


void crazystove() {     // smoke from oven
  k = k + 1;
  if(k > 10) {
    shape(stove1, 0, 0);
  }   if(k > 15) {
    shape(stove2, 0, 0);
  }   if(k > 20) {
    shape(stove3, 0, 0);
  }   if(k > 25) {
    shape(stove4, 0, 0);
  }   if(k > 30) {
    shape(stove5, 0, 0);
  }   if(k > 35) {
    k = 10;
  }   else {}
}


void dyingstove() {     // smoke dies down
  j = j + 1;
  if(j > 0) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    shape(stove5, 0, 0);
  }   if(j > 2) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    shape(stove4, 0, 0);
  }   if(j > 4) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    shape(stove3, 0, 0);
  }   if(j > 6) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    shape(stove4, 0, 0);
  }   if(j > 8) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    shape(stove3, 0, 0);
  }   if(j > 10) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    shape(stove2, 0, 0);
  }   if(j > 12) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    shape(stove1, 0, 0);
  }   if(j > 14) {
    shape(kitchen2, 0, 0, 640, 480);
    steam();
  }
}


void ovencloseup() {     // close-up on the oven
  pushMatrix();
  n = -360;
  o = -720;
  p = 2.75;
  translate(n, o);
  scale(p);
  shape(kitchen2, 0, 0, 640, 480);
  steam();
  crazystove();
  popMatrix();
}


void ovencloseup2() {     // close-up on the oven without smoke
  pushMatrix();
  n = -360;
  o = -720;
  p = 2.75;
  translate(n, o);
  scale(p);
  shape(kitchen2, 0, 0, 640, 480);
  steam();
  popMatrix();
}

// shortcuts  ⎯  END



// drawing the robot  ⎯  START

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

// drawing the robot  ⎯  END




void draw() {
  background(255);
  smooth();
  textSize(20);
  textLeading(17);

  float time2 = millis();
  
  
  
  
  // PAGE 0  ⎯  intro
  if(page == 0) {
    t = t + 3;
    float mx = constrain(mouseX, 183, 457);
    image(kitchen1, 183 - mx, 0);
    pushMatrix();
    translate(780 - t, 50);
    scale(1.5);
    pushMatrix();
    rotate(-PI/8);
    translate(-100, 0);
    neck1();
    popMatrix();
    head1();
    antenna1();
    cup1();
    drink1();
    translate(-7, 0);
    eyes1();
    buttons1();
    popMatrix();
    if(t > 240) {
      t = 240;
      image(intro, 25, 60);
    }
    if(keyPressed){
      if(key == ' ') {
        page = 0.5;
      }
    }
  }
  
  // PAGE 0.5  ⎯  end intro
  if(page == 0.5) {
    u = u + 3;
    float mx = constrain(mouseX, 183, 457);
    image(kitchen1, 183 - mx, 0);
    pushMatrix();
    translate(580 + u, 50);
    scale(1.5);
    pushMatrix();
    rotate(-PI/8);
    translate(-100, 0);
    neck1();
    popMatrix();
    head1();
    antenna1();
    cup1();
    drink1();
    translate(-7 + u/3, 0);
    eyes1();
    buttons1();
    popMatrix();
    if(u > 240) {
      page = 1;
    }
  }

  // PAGE 1  ⎯  real kitchen
  if(page == 1) {
    float mx = constrain(mouseX, 183, 457);
    image(kitchen1, 183 - mx, 0);
    image(speech, 30, 357);
    fill(0);
    text("You're standing in your kitchen. Hmm, maybe you should eat something", width/2 - 250, height - 100, 250, height);
    if(mouseX < 534 && mouseX > 436 && mouseY > 100 && mouseY < 425){
      image(fridge, mouseX - 120, mouseY - 120, 100, 100);
    }
    else {
    }
  }

  // PAGE 2  ⎯  fade out
  if(page == 2) {
    image(kitchen1, -274, 0);
    image(speech, 30, 357);
    fill(0);
    text("You're standing in your kitchen. Hmm, maybe you should eat something", width/2 - 250, height - 100, 250, height);
    x = x + 5;
    fill(0, x);
    rect(-2, -2, 642, 482);
    noFill();
    if(x > 254) {
      page = 3;
    }
  }

  // PAGE 3  ⎯  fade in
  if(page == 3) {
    noStroke();
    shape(kitchen2, 0, 0);
    y_ = y_ + 100;
    fill(0, 255 - y_);
    rect(0, 0, 640, 480);
    noFill();
    if(y_ > 400) {
      page = 4;
    }
  }

  // PAGE 4  ⎯  cartoon kitchen
  if(page == 4) {
    a_ = a_ + 1;
    shape(kitchen2, 0, 0);
    image(speech, 30, 357);
    fill(0);
    text("Wait, what is this? Suddenly you're standing in a... cartoon kitchen?!", width/2 - 250, height - 100, 250, height);
    if(a_ > 80) {
      page = 5;
    }
  }

  // PAGE 5  ⎯  water starts to boil
  if(page == 5) {
    a_ = a_ + 1;
    shape(kitchen2, 0, 0);
    if(a_ > 110) {
      steam();
    }
    if(a_ > 190) {
      page = 6;
    }
  }

  // PAGE 6  ⎯  zoom in on water pot
  if(page == 6) {
    e_ = e_ + 1;
    g = g + 1;
    pushMatrix();
    b = b - 6;
    c = c - 12;
    d = 1 + (g/25.6);
    translate(b, c);
    scale(d);
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    popMatrix();
      image(speech, 30, 357);
      fill(0);
      text("The pot of water starts to boil on its own...", width/2 - 250, height - 100 + 10, 250, height);
    if (e_ > 60){
      page = 7;
    }
  }

  // PAGE 7  ⎯  water pot closeup
  if(page == 7) {
    e_ = e_ + 1;
    watercloseup();
  if(e_ > 100) {
    page = 8;
  }
  }

  // PAGE 8  ⎯  option 1
  if(page == 8) {
    watercloseup();
    image(speech, 30, 357);
    fill(0);
    text("What do you do?", width/2 - 250, height - 100, 250, height);
    textSize(15);
    textLeading(13);
    if (mouseX > 100 && mouseX < 180 && mouseY > 405 && mouseY < 430) {
      fill(215, 0, 0);
    } 
    else {
      fill(0);
    } 
    text("Try to turn it off", 100, height - 100 + 25, 90, height);
    if (mouseX > 220 && mouseX < 300 && mouseY > 405 && mouseY < 430) {
      fill(215, 0, 0);
    } 
    else {
      fill(0);
    } 
    text("Just leave it alone", 220, height - 100 + 25, 80, height); 
  }

  // PAGE 9  ⎯  steam blows up
  if(page == 9) {
    f = f + 1;
    watercloseup();
    image(speech, 30, 357);
    fill(0);
    text("What do you do?", width/2 - 250, height - 100, 250, height);
    textSize(15);
    textLeading(13);
    text("Try to turn it off", 100, height - 100 + 25, 90, height);
    text("Just leave it alone", 220, height - 100 + 25, 80, height);    
    if(f > 10) {
      crazysteam1();  
    }
    if(f > 14) {
      watercloseup();
      crazysteam(); crazysteam(); crazysteam(); 
    }  
    if(f > 20) {
      watercloseup();
      crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam(); 
      crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam();
      crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam(); 
      crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam(); crazysteam();
      image(speech, 30, 357);
      textSize(20);
      textLeading(17);
      fill(0);
      text("Oh no, you messed something up, and now it's bubbling even more!", width/2 - 250, height - 100, 250, height);
    }  
    if(f > 22) {
      shape(kitchen2, 0, 0);
      steam();
      crazysteam(); crazysteam(); crazysteam(); 
      image(speech, 30, 357);
      fill(0);
      text("Oh no, you messed something up, and now it's bubbling even more!", width/2 - 250, height - 100, 250, height);
    }
    if(f > 26) {
      shape(kitchen2, 0, 0);
      steam();
      crazysteam1(); 
      image(speech, 30, 357);
      fill(0);
      text("Oh no, you messed something up, and now it's bubbling even more!", width/2 - 250, height - 100, 250, height);
    } 
    if(f > 28) {
      page = 11;
    }
  }
  
  // PAGE 10  ⎯  steam pot zoom out
  if(page == 10) {
    h_ = h_ + 1;
    pushMatrix();
    b = b + 6;
    c = c + 12;
    d = 3.34375 - (h_/25.6);
    translate(b, c);
    scale(d);
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    popMatrix();
    if(h_ > 60) {
    page = 11;
    }
  }
  
  // PAGE 11  ⎯  something wrong with the oven?
  if(page == 11) {
    f = 28;
    i = i + 1;
    shape(kitchen2, 0, 0);
    steam();
    if(i > 30) {
      image(speech, 30, 357);
      fill(0);
      text("Let's not worry about that problem anymo- wait! What's that smell?", width/2 - 250, height - 100, 250, height);
    }
    if(i > 100) {
      page = 12;
    }
  }
  
  // PAGE 12  ⎯  oven starts to smoke
  if(page == 12) {
    i = i + 1;
    shape(kitchen2, 0, 0);
    steam();
    crazystove();
    if(i > 130) {
      page = 13;
    }
  }
  
  // PAGE 13  ⎯  option 2
  if(page == 13) {
    shape(kitchen2, 0, 0);
    steam();
    crazystove();
    image(speech, 30, 357);
    fill(0);
    text("It's coming from the oven... see what's wrong?", width/2 - 250, height - 100, 250, height);
    textSize(15);
    textLeading(13);
    if (mouseX > 100 && mouseX < 180 && mouseY > 420 && mouseY < 440) {
      fill(215, 0, 0);
    } 
    else {
      fill(0);
    } 
    text("Obviously!", 100, height - 60, 90, height);
    if (mouseX > 220 && mouseX < 300 && mouseY > 420 && mouseY < 440) {
      fill(215, 0, 0);
    } 
    else {
      fill(0);
    } 
    text("Who cares", 220, height - 60, 80, height);
  }
  
  // PAGE 13.5  ⎯  "NO" to option 2
  if(page == 13.5) {
    l = l + 1;
    shape(kitchen2, 0, 0);
    steam();
    crazystove();
    image(speech, 30, 357);
    fill(0);
    text("Alright... if you say so... but you might regret it later on...", width/2 - 250, height - 100, 250, height);
    if(l > 60) {
      page = 21;
    }
  }
  
  // PAGE 14  ⎯  "YES" to option 2 / zoom in to oven
  if(page == 14) {
    l = l + 1;
    n = n - 6;
    o = o - 12;
    p = 1 + (l/34.2857143);
    pushMatrix();
    translate(n, o);
    scale(p);
    shape(kitchen2, 0, 0);
    steam();
    crazystove();
    popMatrix();
    if(l > 60) {
      page = 15;
    }
  }
  
  // PAGE 15  ⎯  option 3
  if(page == 15) {
    l = l + 1;
    pushMatrix();
    n = -360;
    o = -720;
    p = 2.75;
    translate(n, o);
    scale(p);
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    if (mouseX > 140 && mouseX < 200 && mouseY > 120 && mouseY < 175) {
      shape(sbutton1, 0, .5);
    } 
    else if (mouseX > 285 && mouseX < 345 && mouseY > 120 && mouseY < 175) {
      shape(sbutton2, 0, .5);
    } 
    else if (mouseX > 435 && mouseX < 495 && mouseY > 120 && mouseY < 175) {
      shape(sbutton3, 0, .5);
    } 
    else {
    } 
    crazystove();
    popMatrix();
    if(l > 70) {
      image(speech, 30, 357);
      fill(0);
      text("There are three dials on the oven. Which do you want to try to turn?", width/2 - 250, height - 100, 250, height);
    }
  }
  
  // PAGE 16  ⎯  smoke dies down
  if(page == 16) {
    pushMatrix();
    n = -360;
    o = -720;
    p = 2.75;
    translate(n, o);
    scale(p);
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    dyingstove();
    popMatrix();
    if(j > 14) {
      page = 16.5;
    }
  }
    
    // PAGE 16.5  ⎯  good choice
    if(page == 16.5) {
      j = j + 1;
      ovencloseup2();
      image(speech, 30, 357);
      fill(0);
      text("Wow, you made the best choice and were able to fix the problem!", width/2 - 250, height - 100, 250, height);
      if(j > 80) {
        page = 19;
      }
    }
    
  // PAGE 17  ⎯  smoke dies down
  if(page == 17) {
    pushMatrix();
    n = -360;
    o = -720;
    p = 2.75;
    translate(n, o);
    scale(p);
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    dyingstove();
    popMatrix();
    if(j > 14) {
      page = 17.5;
    }
  }
    
    // PAGE 17.5  ⎯  ok choice
    if(page == 17.5) {
      j = j + 1;
      ovencloseup2();
      image(speech, 30, 357);
      fill(0);
      text("Hmm, it looks like the smoke has died down... for now...", width/2 - 250, height - 100, 250, height);
      if(j > 80) {
        page = 19;
      }
    }
    
  // PAGE 18  ⎯  smoke stays the same
  if(page == 18) {
    j = j + 1;
    ovencloseup();
    if(j > 14) {
      page = 18.5;
    }
  }
    
    // PAGE 18.5  ⎯  bad choice
    if(page == 18.5) {
      j = j + 1;
      ovencloseup();
      image(speech, 30, 357);
      fill(0);
      text("That wasn't a good choice... turning that dial didn't help at all", width/2 - 250, height - 100, 250, height);
      if(j > 80) {
        page = 19.5;
      }
    }
  
  // PAGE 19  ⎯  zoom out w/o smoke
  if(page == 19) {
    m = m + 1;
    pushMatrix();
    n = n + 6;
    o = o + 12;
    p = 2.75 - (m/34.2857143);
    translate(n, o);
    scale(p);
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    popMatrix();
    if(m > 60) {
    page = 20;
    }
  }
  
  // PAGE 19.5  ⎯  zoom out w/ smoke
  if(page == 19.5) {
    m = m + 1;
    pushMatrix();
    n = n + 6;
    o = o + 12;
    p = 2.75 - (m/34.2857143);
    translate(n, o);
    scale(p);
    shape(kitchen2, 0, 0, 640, 480);
    steam();
    crazystove();
    popMatrix();
    if(m > 60) {
    page = 21;
    }
  }
  
  // PAGE 20  ⎯  have a drink w/o smoke
  if(page == 20) {
    m = m + 1;
    shape(kitchen2, 0, 0);
    steam();
    if(m > 65) {
      image(speech, 30, 357);
      fill(0);
      text("You must be exhausted from all of that! Here, have a drink.", width/2 - 250, height - 100, 250, height);
    }
    if(m > 130) {
      page = 22;
    }
  }
  
  // PAGE 21  ⎯  have a drink w/smoke
  if(page == 21) {
    m = m + 1;
    shape(kitchen2, 0, 0);
    steam();
    crazystove();
    if(m > 60) {
      image(speech, 30, 357);
      fill(0);
      text("You didn't do much, but you look exhausted! Here, have a drink.", width/2 - 250, height - 100, 250, height);
    }
    if(m > 130) {
      page = 22.5;
    }
  }
  
  // INTERACT  ⎯  w/o smoke
  if(page == 22) {
    shape(kitchen2, 0, 0);
    steam();
    easing();
    stroke(0);
    pushMatrix();
    scale(1.2);
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    buttons1();
    wheel1();
    popMatrix();
//    image(restart, 550, 0);
//    if (mouseX > 550 && mouseX < 620 && mouseY > 0 && mouseY < 85) {
//      image(restart2, 550, 0);
//    } 
//    else {
//    } 
  }
  
  // INTERACT  ⎯  w/ smoke
  if(page == 22.5) {
    shape(kitchen2, 0, 0);
    steam();
    crazystove();
    easing();
    stroke(0);
    pushMatrix();
    scale(1.2);
    neck1();
    head1();
    antenna1();
    eyes1();
    cup1();
    drink1();
    buttons1();
    wheel1();
    popMatrix();
//    image(restart, 550, 0);
//    if (mouseX > 550 && mouseX < 620 && mouseY > 0 && mouseY < 85) {
//      image(restart2, 550, 0);
//    } 
//    else {
//    } 
  }
}



// mouse being pressed

void mousePressed() {
  if (page == 1) {
    if (mouseX < 534 && mouseX > 436) {
      page = 2;
    } 
    else {
    } 
  }

  if (page == 8) {
    if (mouseX > 100 && mouseX < 180 && mouseY > 405 && mouseY < 430) {
      page = 9;
    } 
    else if (mouseX > 220 && mouseX < 300 && mouseY > 405 && mouseY < 430) {
      page = 10;
    } 
    else {
    } 
  }
  
  if (page == 13) {
    if (mouseX > 100 && mouseX < 180 && mouseY > 420 && mouseY < 440) {
      page = 14;
    } 
    else if (mouseX > 220 && mouseX < 300 && mouseY > 420 && mouseY < 440) {
      page = 13.5;
    } 
    else {
    } 
  }
  
  if (page == 15) {
    if (mouseX > 140 && mouseX < 200 && mouseY > 120 && mouseY < 175) {
      page = 17;
    } 
    else if (mouseX > 285 && mouseX < 345 && mouseY > 120 && mouseY < 175) {
      page = 16;
    } 
    else if (mouseX > 435 && mouseX < 495 && mouseY > 120 && mouseY < 175) {
      page = 18;
    } 
    else {
    } 
  }
  
//  if (page == 22) {
//    if (mouseX > 550 && mouseX < 620 && mouseY > 0 && mouseY < 85) {
//      page = 0;
//    } 
//    else {
//    } 
//  }
//  
//  if (page == 22.5) {
//    if (mouseX > 550 && mouseX < 620 && mouseY > 0 && mouseY < 85) {
//      page = 0;
//    } 
//    else {
//    } 
//  }
}



// DRINK CHANGE

  // TOP ROW
 void keyPressed() {
  if (key == '1' || key =='r') {
    clear = color (237, 34, 36, 190); 
  }
  else if (key == '2' || key =='y') {
    clear = color (246, 235, 22, 190); 
  } 
  else if (key == '3' || key =='p') {
    clear = color (143, 80, 160, 190); 
  } 

  // MIDDLE ROW
  else if (key == '4' || key =='g') {
    clear = color (113, 192, 91, 190); 
  }
  else if (key == '5' || key =='b') {
    clear = color (69, 85, 165, 190); 
  }
  else if (key == '6' || key =='o') {
    clear = color (249, 159, 27, 190); 
  }

  // BOTTOM ROW
  else if (key == '7' || key =='w') {
    clear = color (255, 190); 
  }
  else if (key == '8' || key =='m') {
    clear = color (206, 76, 140, 190); 
  }
  else if (key == '9' || key =='t') {
    clear = color (68, 195, 211, 190); 
  } 
  else {
    clear = color (200, 255, 255, 100);
  }
}

