
boolean finish = false;
int SZButton = 100;
int time = 3100;
int points;

void setup () {
  size (300,300);
  smooth ();
}

void draw () {
  background (0);
  Copyrigth();
  Button();
  Time();
  Points();
  Finish();
}

void Button () {
  fill (170,0,0);
  ellipse (width/2, height/2, SZButton, SZButton);
  if ((mouseX >= 97) && (mouseX <= 197) && (mouseY >= 97) &&
  (mouseY <= 197)) {
  fill (200,0,0);
  } else {
    fill (255,0,0);
  }
  ellipse (width/2, height/2-10, SZButton-6, SZButton-6);
  if ((mouseX >= 97) && (mouseX <= 197) && (mouseY >= 97) &&
  (mouseY <= 197) && (mousePressed)) {
    background (0);
    fill (170,0,0);
    ellipse (width/2, height/2, SZButton, SZButton);
    fill (220,0,0);
    ellipse (width/2, height/2-3, SZButton-6, SZButton-6);
  }
}

void Copyrigth () {
  if (key == 'k' || key == 'K') {
    textSize (12);
    text ("© Kike Fontán 2011", 20, 290);
  }
}

void Time () {
  time = int(time-0.1);
  String Up =(time+"  segundos");
  fill (254);
  textSize (20);
  text (Up, width/2-68, 50);
  fill (0);
  rect (103,30,22,30);
  noFill();
  if (time == 100) {
    time = 100;
    noLoop ();
    finish = true;
  }
}

void mouseClicked () {
  if ((mouseX >= 97) && (mouseX <= 197) && (mouseY >= 97) &&
  (mouseY <= 197)) {
  points = points+1;
  }
}

void Points () {
  fill (254);
  textSize (20);
  String pnt = (points+" puntos");
  text (pnt, width/2-44, 250);
}

void keyPressed () {
    redraw ();
  }
  
void Finish () {
  if (finish == true) {
    background (0);
    textSize (30);
    fill (254);
    text ("Has conseguido ...", 23,100);
    text ("puntos", 150,160);
    textSize (60);
    text (points+" ", 35,170);
    textSize (10);
    text ("Pulsa cualquier tecla para salir", 146,290);
    if (keyPressed) {
      exit ();
    }
  }
}

