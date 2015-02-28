
PImage frame01a;
PImage frame02a;
PImage frame02b;
PImage frame03a;
PImage frame03b;
PImage frame03c;
PImage frame04a;
PImage frame04b;
PImage frame05a;
PImage frame05b;
PImage frame05c;
PImage frame05d;
PImage frame06a;
PImage frame06b;
PImage frame06c;
PImage frame06d;
PImage frame07a;


PFont aktiv;
boolean pmp;
boolean pause  = false;
int startTime;

int selector;

void setup() {
  size(800, 600);
  smooth();
  startTime = millis();  

  frame01a = loadImage("frame01a.jpg");
  frame02a = loadImage("frame02a.jpg");
  frame02b = loadImage("frame02b.jpg");
  frame03a = loadImage("frame03a.jpg");
  frame03b = loadImage("frame03b.jpg");
  frame03c = loadImage("frame03c.jpg");
  frame04a = loadImage("frame04a.jpg");
  frame04b = loadImage("frame04b.jpg");
  frame05a = loadImage("frame05a.jpg");
  frame05b = loadImage("frame05b.jpg");
  frame05c = loadImage("frame05c.jpg");
  frame05d = loadImage("frame05d.jpg");
  frame06a = loadImage("frame06a.jpg");
  frame06b = loadImage("frame06b.jpg");
  frame06c = loadImage("frame06c.jpg");
  frame06d = loadImage("frame06d.jpg");
  frame07a = loadImage("frame07a.jpg");

  aktiv = loadFont("AktivGrotesk-Bold-48.vlw");
  tint(100);
  rectMode(CENTER);
  imageMode(CENTER);
  textMode(CENTER);
  selector = 1;
}


void draw() {

  background(0);
  println(selector);


  if (selector == 1) {
    pause = true;
    frame01();
  }

  else if (selector == 2) {
    println("2");
    pause = true;
    frame02();
  }


  else if (selector == 3) {
    println("3");
    frame03();
  }

  else if (selector == 4) {

    frame04();
  }

  else if (selector == 5) {
    pause = true;
    frame05();
  }

  else  if (selector == 6) {
    frame06();
  }

  else  if (selector == 7) {
    frame07();
  }

  else  if (selector == 8) {
    frame08();
  }

  else  if (selector == 9) {
    frame09();
  }

  else  if (selector == 10) {
    frame10();
  }

  else  if (selector == 11) {
    frame11();
  }

  else  if (selector == 12) {
    frame12();
  }

  else  if (selector == 13) {
    frame13();
  }

  else  if (selector == 14) {
    frame14();
  }

  else  if (selector == 15) {
    frame15();
  }

  else  if (selector == 16) {
    frame16();
  }

  else  if (selector == 17) {
    frame17();
  }



  //  if (pause == false) {
  //    if (millis() - startTime >= 1500) {
  //      selector ++;
  //      println("advancing scenes");
  //      startTime = millis();
  //    }
  //  }

  pmp = mousePressed;
}









//////////// FRAME 13 //////////////

void frame13() {
  println("we're in scene 13");
  image(frame06a, width/2, height/2);
  fill(0);
  float xpos = width/2;
  float ypos1 = 470;
  float ypos2 = height/2;

  float recwidth = 100;
  println("a");

  if (mouseX>xpos-recwidth && mouseX<xpos+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 17;
    }
  }



  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("CHECK OUT THE BRIDGE", xpos, ypos1);

  fill(255);
  text("Sixth Street", xpos, ypos2);
  text("Bridge", xpos, ypos2+20);
}


//////////// FRAME 14 //////////////

void frame14() {
  println("we're in scene 14");
  image(frame06b, width/2, height/2);
  fill(0);
  float xpos1 = 450;
  float xpos2 = width/2;
  float ypos = height/2;

  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos-recwidth && mouseY<ypos+recwidth) {
    if (mousePressed && !pmp) {
      selector = 17;
    }
  }



  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("CHECK OUT THE BRIDGE", xpos1, ypos);
  fill(255);
  text("Riverside—Zoo", xpos2, ypos);
  text("Bridge", xpos2, ypos+20);
}



//////////// FRAME 15 //////////////

void frame15() {
  println("we're in scene 15");
  image(frame06c, width/2, height/2);
  fill(0);
  float xpos = width/2;
  float ypos1 = 150;
  float ypos2 = height/2;

  float recwidth = 100;
  println("a");

  if (mouseX>xpos-recwidth && mouseX<xpos+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 17;
    }
  }



  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO TOWARDS THE BRIDGE", xpos, ypos1);

  fill(255);
  text("Sixth Street", xpos, ypos2);
  text("Bridge", xpos, ypos2+20);
}



//////////// FRAME 16 //////////////

void frame16() {
  println("we're in scene 16");
  image(frame06d, width/2, height/2);
  fill(0);
  float xpos1 = 650;
  float ypos1 = 50;
  float xpos2 = width/2;
  float ypos2 = height/2;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 17;
    }
  }



  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("WALK AWAY", xpos1, ypos1);
  fill(255);
  text("Sixth Street", xpos2, ypos2);
  text("Bridge", xpos2, ypos2+20);
}

//////////// FRAME 17 //////////////

void frame17() {
  println("we're in scene 17");
  image(frame07a, width/2, height/2);
  fill(0);
  float xpos = width/2;
  float ypos1 = 470;
  float ypos2 = height/2;

  float recwidth = 100;
  println("a");

  if (mouseX>xpos-recwidth && mouseX<xpos+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 1;
    }
  }



  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("TAKE THE RIVER BACK", xpos, ypos1);

  fill(255);
  text("Sixth Street", xpos, ypos2);
  text("Bridge", xpos, ypos2+20);
}

//////////// FRAME 01 //////////////


void frame01() {
  image(frame01a, width/2, height/2);
  fill(0);
  float xpos1 = 550;
  float ypos = height/2;
  float xpos2 = 200;
  float recwidth = 100;

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos-recwidth && mouseY<ypos+recwidth) {
    if (mousePressed && pmp) {
      //pause = true;
      selector = 3;

    }
  }

  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos-recwidth && mouseY<ypos+recwidth) {
    if (mousePressed && !pmp) {
      //pause = true;
      selector = 2;
    }
  }


  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("WESTBANK", xpos1, ypos);
  fill(255);
  text("Population Density", width/2-50, 120);
  text("Household Income", width/2-50, height/2);
  text("Average Commute", width/2-50, 480);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("EASTBANK", xpos2, ypos);


  //circles//
  
  float a = random(80,90);
  float b = random(50,60);
  float c = random(20,30);

  // dataCircle01
  if (mouseX> 0 && mouseX<=width/4) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, 120+mouseX,a , a);
  }
  else if (mouseX>width/4 && mouseX<=width/2) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, height/2, a, a);
  }
  else {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, 120, a, a);
  }


  // dataCircle02 
  noStroke();
  ellipseMode(CENTER);  
  fill(202, 208, 43, 170);
  ellipse(100, height/2, b, b);


  // dataCircle03
  if (mouseX> 0 && mouseX<=width/4) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, height-120-mouseX, c, c);
  }
  else if (mouseX>width/4 && mouseX<=width/2) {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, height/2, c, c);
  }
  else {
    noStroke();
    ellipseMode(CENTER);
    fill(145, 162, 61, 170);
    ellipse(100, 480, c, c);
  }

}

//////////// FRAME 02 //////////////

void frame02() {
  println("we're in scene 2");
  image(frame02a, width/2, height/2);
  fill(0);
  float xpos1 = 200;
  float ypos1 = height/4;
  float xpos2 = width/2;
  float ypos2 = height/2;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 4;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos2-recwidth && mouseY<ypos2+recwidth) {
    if (mousePressed && !pmp) {
      selector = 5;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("KEEP GOING STRAIGHT", xpos1, ypos1);
  fill(255);
  text("Eastbank", xpos1, ypos2);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO ACROSS THE BRIDGE", xpos2, ypos2);
}

//////////// FRAME 03 //////////////

void frame03() {
  println("we're in scene 3");
  image(frame02b, width/2, height/2);
  fill(0);
  float xpos1 = 480;
  float ypos1 = height/4;
  float xpos2 = 300;
  float ypos2 = height/2;
  float xpos3 = 540;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 6;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos2-recwidth && mouseY<ypos2+recwidth) {
    if (mousePressed && !pmp) {
      selector = 5;
    }
  }


  println("c");
  textMode(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("CONTINUE DOWNT THE BANK", xpos1, ypos1);
  fill(255);
  text("Westbank", xpos3, ypos2);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO ACROSS THE BRIDGE", xpos2, ypos2);
}
//////////// FRAME 04 //////////////

void frame04() {
  println("we're in scene 4");
  image(frame03a, width/2, height/2);
  fill(0);
  float xpos = width/2;
  float ypos1 = 470;
  float ypos2 = height/2;

  float recwidth = 100;
  println("a");

  if (mouseX>xpos-recwidth && mouseX<xpos+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 7;
    }
  }



  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("LETS GO TRAVE DOWN", xpos, ypos1);
    text("THE BIKE PATH", xpos, ypos1+20);
  fill(255);
   text("Riverside—Zoo", xpos, ypos2);
  text("Bridge", xpos, ypos2+20);
}
//////////// FRAME 05 //////////////

void frame05() {
  println("we're in scene 3");
  image(frame03b, width/2, height/2);
    fill(0);
  float xpos1 = width/4;
  float xpos2 = 580;
  float xpos3 = width/2;
  float ypos = height/2;

  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos-recwidth && mouseY<ypos+recwidth) {
    if (mousePressed && !pmp) {
      selector = 2;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos-recwidth && mouseY<ypos+recwidth) {
    if (mousePressed && !pmp) {
      selector = 3;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("EASTBANK", xpos1, ypos);
  text("WESTBANK", xpos2, ypos);
  fill(255);
   text("Riverside—Zoo", xpos3, ypos);
  text("Bridge", xpos3, ypos+20);
}
//////////// FRAME 06 //////////////

void frame06() {
  println("we're in scene 6");
  image(frame03c, width/2, height/2);
    fill(0);
  float xpos = width/2;
  float ypos1 = 470;
  float ypos2 = height/2;

  float recwidth = 100;
  println("a");

  if (mouseX>xpos-recwidth && mouseX<xpos+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 8;
    }
  }



  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("LETS GO TRAVE DOWN", xpos, ypos1);
    text("THE RIVER", xpos, ypos1+20);
  fill(255);
   text("Riverside—Zoo", xpos, ypos2);
  text("Bridge", xpos, ypos2+20);
}
//////////// FRAME 07 //////////////

void frame07() {
  println("we're in scene 7");
  image(frame04a, width/2, height/2);
  fill(0);
  float xpos1 = 100;
  float ypos1 = 560;
  float xpos2 = width/2;
  float ypos2 = height/2;
  float ypos3 = 170;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 9;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos2-recwidth && mouseY<ypos2+recwidth) {
    if (mousePressed && !pmp) {
      selector = 10;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("DRIFT TO THE SIDE", xpos1, ypos1);
  fill(255);
  text("Sixth Street", xpos2, ypos3);
  text("Bridge", xpos2, ypos3+20);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("KEEP GOING STRAIGHT", xpos2, ypos2);
}
//////////// FRAME 08 //////////////

void frame08() {
  println("we're in scene 8");
  image(frame04b, width/2, height/2);
  fill(0);
  float xpos1 = 100;
  float ypos1 = 560;
  float xpos2 = 650;
  float ypos2 = height/2;
  float xpos3 = width/2;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 11;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos2-recwidth && mouseY<ypos2+recwidth) {
    if (mousePressed && !pmp) {
      selector = 12;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("CHECK OUT THE WATER", xpos1, ypos1);
  fill(255);
  text("Los Angeles", xpos3, ypos2);
  text("River", xpos3, ypos2+20);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO ON TO THE CONCRETE", xpos2, ypos2);
}

//////////// FRAME 09 //////////////

void frame09() {
  println("we're in scene 9");
  image(frame05a, width/2, height/2);
fill(0);
  float xpos1 = 650;
  float ypos1 = 50;
  float xpos2 = width/2;
  float ypos2 = height/2;
  float ypos3 = 370;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 10;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos3-recwidth && mouseY<ypos3+recwidth) {
    if (mousePressed && !pmp) {
      selector = 13;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO BACK TO THE TOP OF THE BRIDGE", xpos1, ypos1);
  fill(255);
  text("Sixth Street", xpos2, ypos2);
  text("Bridge", xpos2, ypos2+20);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO INTO THE TUNNEL", xpos2, ypos3);
}

//////////// FRAME 10 //////////////

void frame10() {
  println("we're in scene 10");
  image(frame05b, width/2, height/2);
fill(0);
  float xpos1 = 100;
  float ypos1 = 560;
  float xpos2 = width/2;
  float ypos2 = height/2;
  float ypos3 = 170;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 9;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos2-recwidth && mouseY<ypos2+recwidth) {
    if (mousePressed && !pmp) {
      selector = 14;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO UNDER THE BRIDGE", xpos1, ypos1);
  fill(255);
  text("Sixth Street", xpos2, ypos3);
  text("Bridge", xpos2, ypos3+20);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("KEEP GOING FORWARD", xpos2, ypos2);
}
//////////// FRAME 11 //////////////

void frame11() {
  println("we're in scene 11");
  image(frame05c, width/2, height/2);
fill(0);
  float xpos1 = 100;
  float ypos1 = 560;
  float xpos2 = 650;
  float ypos2 = height/2;
  float xpos3 = width/2;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 15;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos2-recwidth && mouseY<ypos2+recwidth) {
    if (mousePressed && !pmp) {
      selector = 12;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("TRAVEL FURTHER ALONG THE WATER", xpos1, ypos1);
  fill(255);
  text("Los Angeles", xpos3, ypos2);
  text("River", xpos3, ypos2+20);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("GO BACK TO THE BANKS", xpos2, ypos2);
}
//////////// FRAME 12 //////////////

void frame12() {
  println("we're in scene 12");
  image(frame05d, width/2, height/2);
fill(0);
  float xpos1 = 450;
  float ypos1 = 560;
  float xpos2 = 200;
  float ypos2 = height/2;
  float xpos3 = width/2;
  float recwidth = 100;
  println("a");

  if (mouseX>xpos1-recwidth && mouseX<xpos1+recwidth &&
    mouseY>ypos1-recwidth && mouseY<ypos1+recwidth) {
    if (mousePressed && !pmp) {
      selector = 16;
    }
  }
  println("b");
  if (mouseX>xpos2-recwidth && mouseX<xpos2+recwidth &&
    mouseY>ypos2-recwidth && mouseY<ypos2+recwidth) {
    if (mousePressed && !pmp) {
      selector = 11;
    }
  }


  println("c");
  textAlign(CENTER);
  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("WALK FURTHER ALONG THE BANKS", xpos1, ypos1);
  fill(255);
  text("Los Angeles", xpos3, ypos2);
  text("River", xpos3, ypos2+20);

  fill(145, 162, 61, 170);
  textFont(aktiv);
  textSize(12);
  text("CHECK OUT THE WATER", xpos2, ypos2);
}



