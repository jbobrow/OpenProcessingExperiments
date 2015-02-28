
int [] [] oncamio;
int posx = 500;
int posy = 300;
int movx = 0;
int movy = 0;
int mode = 0;
int dirx;
int diry;

int cotxes = 30;

void setup() {
  size(1000, 600);
  noSmooth();
  rectMode(CENTER);
  oncamio = new int [7] [cotxes];

  for (int i = 0; i<cotxes-1; i++) {
    oncamio [2] [i] = int(random(255));
    oncamio [3] [i] = int(random(155));
    oncamio [4] [i] = int(random(155));

    oncamio [0] [i] = 500;
    oncamio [1] [i] = 300;
  }
}

void draw() {

  background(0, 255, 255);

  if (mode == 0) {
    mode0();
  }
  else if (mode == 1) {
    mode1();
  }
  else {
    mode2();
  }

  fill(255, 0, 0);
  text("MODE", 10, 10);
  text(mode, 50, 10);
}

void mousePressed () {

  for (int i = 0; i<cotxes-1; i++) {
    oncamio [0] [i] = oncamio [0] [i] + (mouseX-posx)/3;
    oncamio [1] [i] = oncamio [1] [i] + (mouseY-posy)/3;
  }
}

void keyPressed() {
  if (keyPressed == true) {
    mode++;
    if (mode > 2) {
      mode = 0;
    }
  }
  for (int i = 0; i<cotxes-1; i++) {

    oncamio [5] [i] = int(random (-8, 8));
    oncamio [6] [i] = int(random (-8, 8));
  }
}

 void mode0() {
 
    for (int i = 0; i<cotxes-1; i++) {

      oncamio [0] [i] = oncamio [0] [i] + int(random(-10, 10));
      oncamio [1] [i] = oncamio [1] [i] + int(random(-10, 10));     

      posx = oncamio[0] [i];
      posy = oncamio[1] [i];

      ///////////////////////////////////////////////////////////////////////

      if ( oncamio[0] [i] < 60) { 
        oncamio[0] [i] = 61;
      }
      if ( oncamio[1] [i] < 60) { 
        oncamio[1] [i] = 61;
      }
      if ( oncamio[0] [i] > width-60) { 
        oncamio[0] [i] = width-61;
      }
      if ( oncamio[1] [i] > height-60) { 
        oncamio[1] [i] = height -61;
      }

      ////////////////////////////////////////////////////////////////////////

      //llum//
      stroke(0, 0, 0);
      fill(255, 255, 0);
      ellipse(posx+5, posy-50, 20, 40);

      //cos//
      noStroke();
      fill(oncamio [2] [i], oncamio [3] [i], oncamio [4] [i]);
      rect(posx, posy, 100, 50, 15);
      ellipse(posx, posy-20, 80, 75);

      //rodes//
      noStroke();
      fill(0);
      ellipse(posx-30, posy+20, 35, 35);
      ellipse(posx+30, posy+20, 35, 35);

      //vidre//
      fill(0, 0, 255);
      rect(posx+10, posy-30, 35, 25, 3, 50, 3, 3);
    }
 }
void mode1() {

  for (int i = 0; i<cotxes-1; i++) {

    oncamio [0] [i] = oncamio [0] [i] + oncamio [5] [i];
    oncamio [1] [i] = oncamio [1] [i] + oncamio [6] [i];     

    posx = oncamio[0] [i];
    posy = oncamio[1] [i];

    ///////////////////////////////////////////////////////////////////////

    if ( oncamio[0] [i] < 60) { 
      oncamio[5] [i] = -oncamio[5] [i];
    }
    if ( oncamio[1] [i] < 60) { 
      oncamio[6] [i] = -oncamio[6] [i];
    }
    if ( oncamio[0] [i] > width-60) { 
      oncamio[5] [i] = -oncamio[5] [i];
    }
    if ( oncamio[1] [i] > height-60) { 
      oncamio[6] [i] = -oncamio[6] [i];
    }

    ////////////////////////////////////////////////////////////////////////

    //llum//
    stroke(0, 0, 0);
    fill(255, 255, 0);
    ellipse(posx+5, posy-50, 20, 40);

    //cos//
    noStroke();
    fill(oncamio [2] [i], oncamio [3] [i], oncamio [4] [i]);
    rect(posx, posy, 100, 50, 15);
    ellipse(posx, posy-20, 80, 75);

    //rodes//
    noStroke();
    fill(0);
    ellipse(posx-30, posy+20, 35, 35);
    ellipse(posx+30, posy+20, 35, 35);

    //vidre//
    fill(0, 0, 255);
    rect(posx+10, posy-30, 35, 25, 3, 50, 3, 3);
  }
}

void mode2() {
  for (int i = 0; i<cotxes-1; i++) {

    oncamio [5] [i] = int(random (0, 500));
    oncamio [6] [i] = int(random (0, 500));

    if (oncamio [5] [i] < 1) { 
      dirx = 3;
    }
    else if (oncamio [5] [i] < 2) { 
      dirx = -3;
    }

    if (oncamio [6] [i] < 1) { 
      diry = 3;
    }
    else if (oncamio [6] [i] < 2) { 
      diry = -3;
    }

    oncamio [0] [i] = oncamio [0] [i] + dirx;
    oncamio [1] [i] = oncamio [1] [i] + diry;     

    posx = oncamio[0] [i];
    posy = oncamio[1] [i];

    ///////////////////////////////////////////////////////////////////////

    if ( oncamio[0] [i] < 60) { 
      oncamio[0] [i] = 61;
    }
    if ( oncamio[1] [i] < 60) { 
      oncamio[1] [i] = 61;
    }
    if ( oncamio[0] [i] > width-60) { 
      oncamio[0] [i] = width-61;
    }
    if ( oncamio[1] [i] > height-60) { 
      oncamio[1] [i] = height -61;
    }

    ////////////////////////////////////////////////////////////////////////

    //llum//
    stroke(0, 0, 0);
    fill(255, 255, 0);
    ellipse(posx+5, posy-50, 20, 40);

    //cos//
    noStroke();
    fill(oncamio [2] [i], oncamio [3] [i], oncamio [4] [i]);
    rect(posx, posy, 100, 50, 15);
    ellipse(posx, posy-20, 80, 75);

    //rodes//
    noStroke();
    fill(0);
    ellipse(posx-30, posy+20, 35, 35);
    ellipse(posx+30, posy+20, 35, 35);

    //vidre//
    fill(0, 0, 255);
    rect(posx+10, posy-30, 35, 25, 3, 50, 3, 3);
  }
}



