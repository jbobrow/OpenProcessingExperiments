
int mode = 0 ;


int x=0;
int y=0;

void setup () {
  size (800, 700);
  background (0);
  smooth();
  frameRate (20);
}

void draw () {

  if (mousePressed) {
    if ((mouseX > 50) && (mouseX < 50+40) && (mouseY > 100) && (mouseY < 100+20)) {
      mode = 1;
    }
    if (mousePressed) {
      if ((mouseX > 50) && (mouseX < 50+40) && (mouseY > 350) && (mouseY < 350+20)) {
        mode = 2;
      }
      if (mousePressed) {
        if ((mouseX > 50) && (mouseX < 50+40) && (mouseY > 600) && (mouseY < 600 + 20)) {
          mode = 3;
        }
      }
    }
  }

  fill (0);
  stroke (30);
  strokeWeight (10);
  rect (-60, 5, 160, 690, 20);



  //Buttons
  fill (65, 173, 73);
  ellipse (50, 100, 40, 40);
  ellipse (50, 350, 40, 40);
  ellipse (50, 600, 40, 40);





  //erstes Tool
  noStroke ();
  if (mode == 1) {
    if ( mousePressed) {
      fill (random (30), random (220), random (255), random (255));


      x = mouseX; 
      y = mouseY;

      ellipse (x, y, 10, 10);
      ellipse (x, y, 20, 20);
      ellipse (x, y, 30, 30);


      ellipse (x + 21, y, 15, 15);
      ellipse (x, y + 21, 15, 15);
      ellipse (x - 21, y, 15, 15);
      ellipse (x, y-21, 15, 15);
    }
  }

  // zweites Tool 

  if (mode==2) {
    if ( mousePressed) {
      fill (random (200), random (225), random (250), random (250));
      x = mouseX;
      y = mouseY;


      rect(x, y, +15, +15);
      rect (x, y, -15, -15);
      ellipse (x-15, y, 5, 5);
      ellipse (x, y-15, 5, 5);
      stroke (random(255), random(255), random(255));
      strokeWeight (2);
      line(x, y, x-30, y-50);
      line (x, y, x-50, y-30);
      noStroke ();



      ellipse (x + 50, y, 80, 80);
      ellipse (x +50, y, 60, 60);
      ellipse (x, y + 50, 80, 80);
      ellipse (x, y+50, 60, 60);


      rect(x+30, y+30, 15, 15);
      rect (x+15, y+15, 15, 15);
      rect (x+45, y+45, 15, 15);
      rect (x+60, y+60, 15, 15);
    }
  }

  //drittes Tool

  if (mode==3) {

    if (mousePressed) {
      fill (random (255), random (255), random (255), random (255));
      x = mouseX;
      y = mouseY;


      ellipse (x, y, 50, 50);

      ellipse (x+0, y+40, 50, 70);
      ellipse (x+40, y+0, 70, 50);
      ellipse (x+0, y-40, 50, 70);
      ellipse (x-40, y+0, 70, 50);
      stroke (random (255), random (255), random (255));
      strokeWeight (2);
      line (x, y, x+100, y+200);

      noStroke ();
      fill (random (255));
    }
  }
}

//Funktion

void keyPressed () {
  if (key=='1') {
    mode = 1;
  }
  if (key=='2') {
    mode = 2;
  }
  if (key=='3') {
    mode = 3;
  }
}
