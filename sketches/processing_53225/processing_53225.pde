
PFont AM;
PFont AM2;

PImage main;
PImage fork;

PImage lake;
PImage water;
PImage shack_caves;

PImage shack;
PImage inside_shack;
PImage lake_caves;

PImage caves;
PImage cave1;
PImage danger;
PImage hole;
PImage faster;
PImage cave2;
PImage inside;
PImage haha;
PImage cave3;
PImage eyes;
PImage eaten;
PImage toolate3;

boolean pmp = false;

float my = 100;

int frame;

float ex;


void setup () {
  size(700, 500);
  smooth();
  frame = 1;

  //text setup
  textAlign(CENTER, CENTER);
  AM = loadFont("5AM-90.vlw");
  textFont(AM, 90);
  AM2 = loadFont("5AM-150.vlw");

  //image load
  main = loadImage("main.jpg");
  fork = loadImage("fork.jpg");

  lake = loadImage("lake.jpg");
  water = loadImage("water.jpg");
  shack_caves = loadImage("shack_caves.jpg");

  shack = loadImage("shack.jpg");
  inside_shack = loadImage("inside2.jpg");
  lake_caves = loadImage("lake_caves.jpg");

  caves = loadImage("caves.jpg");
  cave1 = loadImage("cave1.jpg");
  danger = loadImage("danger.png");
  hole = loadImage("hole.jpg");
  faster = loadImage("faster.jpg");
  cave2 = loadImage("cave2.jpg");
  inside = loadImage("inside.jpg");
  haha = loadImage("toolate.jpg");
  cave3 = loadImage("cave3.jpg");
  eyes = loadImage("eyes.png");
  eaten = loadImage("eaten.jpg");
  toolate3 = loadImage("toolate3.jpg");
}

void draw() {
  background(100);
  fill(0);
  noStroke();
  rectMode(CORNER);
  rect(0, 0, width, 100);
  rect(0, 400, width, 100);
  fill(255);

  if (frame == 1) {
    //main
    image(main, 0, my);
    textFont(AM2, 125);
    text("IMPRISONMENT", width/2, height*.45);
    if (mousePressed) {
      if (mouseX<500 && mouseX>200 && mouseY>100 && mouseY<300) {
        frame++;
      }
    }
  }

  //fork
  if (frame == 2) {
    image(fork, 0, my);
    textFont(AM, 15);
    text("LAKE", width/2-42, height/2);
    text("SHACK", width/2+55, height/2);
    if (mousePressed) {
      if (mouseX<318 && mouseX>293 && mouseY>246 && mouseY<256) {
        frame ++;
      }
      else if (mouseX<417 && mouseX>393 && mouseY>246 && mouseY<256) {
        frame = frame + 4;
      }
    }
  }

  //lake  
  if (frame == 3) {
    image(lake, 0, my);
    text("GET CLOSER", width*.1, 360);
    text("LEAVE", width*.9, 360);
    if (mousePressed) {
      if (mouseX<95 && mouseX>46 && mouseY>355 && mouseY<373) {
        frame ++;
      }
      else if (mouseX<644 && mouseX>615 && mouseY>355 && mouseY<373) {
        frame = frame + 2;
      }
    }
  }
  if (frame == 4) {
    image(water, 0, my);
    if (mousePressed) {
      if (mouseX<527 && mouseX>469 && mouseY>303 && mouseY<333) {
        frame++;
      }
    }
  }
  if (frame == 5) {
    image(shack_caves, 0, my);
    text("SHACK", width*.1, 200);
    text("CAVES", width*.78, 200);
    if (mousePressed && pmp == true) {
      if (mouseX<86 && mouseX>55 && mouseY>191 && mouseY<211) {
        frame ++;
      }
      else if (mouseX<559 && mouseX>530 && mouseY>191 && mouseY<211) {
        frame = frame + 4;
      }
    }
  }

  //shack
  if (frame == 6) {
    image(shack, 0, my);
    text("One Way", width/2, height/2);
    if (mousePressed && pmp == true) {
      if (mouseX<370 && mouseX>330 && mouseY>246 && mouseY<264) {
        frame++;
      }
    }
  }     
  if (frame == 7) {
    image(inside_shack, 0, my);
    if (mousePressed && pmp == false) {
      if (mouseX<410 && mouseX>348 && mouseY>202 && mouseY<375) {
        frame++;
      }
    }
  }
  if (frame == 8) {
    image(lake_caves, 0, my);
    text("lake", width*.1, 320);
    text("caves", width*.65, 330);
    if (mousePressed) {
      if (mouseX<81 && mouseX>56 && mouseY>312 && mouseY<330) {
        frame = frame - 5;
      }
      else if (mouseX<468 && mouseX>436 && mouseY>320 && mouseY<340) {
        frame++;
      }
    }
  }
  if (frame == 9) {
    image(caves, 0, my); 
    if (mousePressed && pmp == false) {
      if (mouseX<309 && mouseX>119 && mouseY>159 && mouseY<376) {
        frame++;
      }
      else if (mouseX<483 && mouseX>400 && mouseY>233 && mouseY<327 ) {
        frame = frame + 4;
      }
      if (mouseX<width && mouseX>513 && mouseY>200 && mouseY<330) {
        frame = frame + 6;
      }
    }
  }
  if (frame == 10) {
    image(cave1, 0, my);
    image(danger, width*.58, height*.52);
    if (mousePressed && pmp == false) {
      if (mouseX<473 && mouseX>409 && mouseY>266 && mouseY<364) {
        frame++;
      }
    }
  }
  if (frame == 11) {
    image(hole, 0, my);
    if (mouseX<400 && mouseX>350 && mouseY>250 && mouseY<300) {
      fill(255, 0, 0, 100);
      rect(width/2, height/2, 50, 50);
      if (mousePressed && pmp == true) {
        frame++;
      }
    }
  }
  if (frame == 12) {
    image(faster, 0, my);
    if (mousePressed && pmp == false) {
      frame = frame - 10;
    }
  }
  if (frame == 13) {
    image(cave2, 0, my);
    if (mousePressed && pmp == true) {
      if (mouseX<360 && mouseX>340 && mouseY>230 && mouseY<260) {
        frame++;
      }
    }
  }
  if (frame == 14) {
    image(inside, 0, my);
    if (mousePressed && pmp == false) {
      if (mouseX>170 && mouseX<206 && mouseY>324 && mouseY<374) {
        frame = frame + 2;
      }
      else if (mouseX<350 && mouseX>280 && mouseY>220 && mouseY<290) {
        frame = frame - 12;
      }
    }
  }
  if (frame == 15) {
    image(toolate3, 0, my);
    ex = random(-3,3);
    image(eyes, ex, my);
    if (mouseX<500 && mouseX>300 && mouseY>100 && mouseY<300) {
      fill(255, 0, 0, 100);
      rectMode(CENTER);
      rect(width/2, height/2-10, 50, 50);
      if (mousePressed && pmp == true) {
          frame = frame -13;
        }
      }
    }
  if (frame == 16) {
    image(haha, 0, my);
    if (mouseX<500 && mouseX>300 && mouseY>100 && mouseY<300) {
      fill(255, 0, 0, 100);
      rectMode(CENTER);
      rect(width/2, height/2-10, 50, 50);
      if (mousePressed && pmp == true) {
          frame = frame -14;
        }
      }
  }

  pmp = mousePressed;
}


void keyPressed() {
  if (key==' ') {
    if (frame >= 16)
      frame = 2;
    else
      frame++;
  }
}


