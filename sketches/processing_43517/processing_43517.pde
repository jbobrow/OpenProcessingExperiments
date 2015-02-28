
//adapted from a game posted by Hikari Iwasaki April 13, 2011 
//on openprocessing.org

PFont font;

void draw() {
  font = loadFont("Courier-32.vlw");
  textFont(font, 32);

  if (keyPressed) {
    if (key == 'T' || key == 't') {
      text("t", 140, 100);
      text("t", 270, 100);
      text("t", 290, 100);
      text("t", 490, 100);
      text("t", 280, 200);
      text("t", 450, 300);
    }
    else if (key == 'H' || key == 'h') {
      text("h", 160, 100);
      text("h", 510, 100);
      text("h", 300, 200);
    }
    else if (key == 'E' || key == 'e') {
      text("e", 180, 100);
      text("e", 330, 100);
      text("e", 420, 100);
      text("e", 530, 100);
      text("e", 320, 200);
      text("e", 390, 200);
      text("e", 470, 200);
      text("e", 470, 300);
    }
    else if (key == 'B' || key == 'b') {
      text("b", 230, 100);
    }
    else if (key == 'A' || key == 'a') {
      text("a", 250, 100);
      text("a", 410, 300);
    }
    else if (key == 'L' || key == 'l') {
      text("l", 310, 100);
      text("l", 450, 200);
      text("l", 490, 300);
      text("l", 510, 300);
    }
    else if (key == 'O' || key == 'o') {
      text("o", 380, 100);
      text("o", 210, 200);
      text("o", 410, 200);
    }
    else if (key == 'V' || key == 'v') {
      text("v", 400, 100);
    }
    else if (key == 'R' || key == 'r') {
      text("r", 440, 100);
    }
    else if (key == 'M' || key == 'm') {
      text("m", 80, 200);
    }

    else if (key == 'I' || key == 'i') {
      text("i", 100, 200);
    }

    else if (key == 'N' || key == 'n') {
      text("n", 120, 200);
    }
    else if (key == 'D' || key == 'd') {
      text("d", 140, 200);
    }

    else if (key == 'S' || key == 's') {
      text("s", 160, 200);
      text("s", 430, 300);
      text("s", 530, 300);
    }
    else if (key == 'F' || key == 'f') {
      text("f", 230, 200);
    }
    else if (key == 'P' || key == 'p') {
      text("p", 370, 200);
      text("p", 430, 200);
    }
    else if (key == 'C' || key == 'c') {
      text("C", 390, 300);
    }
  }

  text("'", 50, 100);
  text("'", 60, 100);
  text(".", 80, 100);
  text(".", 100, 100);
  text(".", 120, 100);
  text("-", 140, 120); //t
  text("-", 160, 120); //h
  text("-", 180, 120); //e

  text("-", 230, 120); //b
  text("-", 250, 120); //a
  text("-", 270, 120); //t
  text("-", 290, 120); //t
  text("-", 310, 120); //l
  text("-", 330, 120); //e

  text("-", 380, 120); //o
  text("-", 400, 120); //v
  text("-", 420, 120); //e
  text("-", 440, 120); //r

  text("-", 490, 120); //t 
  text("-", 510, 120); //h
  text("-", 530, 120); //e

  text("-", 80, 220); //m
  text("-", 100, 220); //i
  text("-", 120, 220); //n
  text("-", 140, 220); //d
  text("-", 160, 220); //s

  text("-", 210, 220); //o
  text("-", 230, 220); //f

  text("-", 280, 220); //t
  text("-", 300, 220); //h
  text("-", 320, 220); //e

  text("-", 370, 220); //p
  text("-", 390, 220); //e
  text("-", 410, 220); //o
  text("-", 430, 220); //p
  text("-", 450, 220); //l
  text("-", 470, 220); //e
  text(".", 490, 200);
  text("'", 500, 200);
  text("'", 510, 200); 

  text("-", 390, 320); //C
  text("-", 410, 320); //a
  text("-", 430, 320); //s
  text("-", 450, 320); //t
  text("-", 470, 320); //e
  text("-", 490, 320); //l
  text("-", 510, 320); //l
  text("-", 530, 320); //s
}

void setup() {
  size(800, 400);
  background(0);
  noFill();
  noStroke();
}


