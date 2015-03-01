
PFont font;
PShape person;
PShape person2;

void draw() {
  font = createFont("Garamond",32);
  person = loadShape ("Person.svg");
  person2 = loadShape ("Person3.svg");
  fill(0);
  textFont(font, 32);

  if (keyPressed) {
    if (key == 'k') {
      text("K", 48, 70);
      shape(person,200,200,100,100);
    }
       else if (key == 'n') {
      text("n", 70, 70);
      text("n", 210, 120);
      shape(person,200,300,100,100);
    }
    else if (key == 'o') {
      text("o", 90, 70);
      text("o", 480, 70);
      text("o", 140, 120);
      text("o", 280, 120);
      shape(person,200,400,100,100);
    }
    else if (key == 'w') {
      text("w", 108, 70);
       text("w", 498, 70);
       shape(person,200,500,100,100);
    }
    else if (key == 'l') {
      text("l", 133, 70);
      shape(person,500,100,100,100);
    }
    else if (key == 'e') {
      text("e", 150, 70);
      text("e", 210, 70);
      text("e", 410, 70);
      text("e", 521, 70);
      text("e", 190, 120);
      text("e", 320, 120);
      shape(person,300,200,100,100);
    }
    else if (key == 'd') {
      text("d", 170, 70);
      text("d", 230, 120);
      shape(person,400,200,100,100);
    }
    else if (key == 'g') {
      text("g", 190, 70);
      shape(person,500,200,100,100);
    }
    else if (key == 'h') {
      text("h", 280, 70);
       text("h", 390, 70);
       shape(person,500,400,100,100);
    }
    else if (key == 'a') {
      text("a", 301, 70);
      shape(person,500,300,100,100);
    }
    else if (key == 's') {
      text("s", 320, 70);
      text("s", 340, 120);
      shape(person,500,500,100,100);
    }
    else if (key == 't') {
      text("t", 372, 70);
      text("t", 120, 120);
      text("t", 380, 120);
      shape(person,400,300,100,100);
    }
    else if (key == 'p') {
      text("p", 460, 70);
      shape(person,400,400,100,100);
    }
    else if (key == 'r') {
      text("r", 540, 70);
      shape(person,400,500,100,100);
    }
    else if (key == 'b') {
      text("b", 300, 120);
      shape(person,300,300,100,100);
    }
    else if (key == 'i') {
      text("i", 362, 120);
      shape(person,300,400,100,100);
    }
    else if (key == 'y') {
      text("y", 400, 120);
      shape(person,300,500,100,100);
    }
    else if (key == 'c') {
      shape(person2,0,400,100,100);
    }
    else if (key == 'f') {
      shape(person2,0,300,100,100);
    }
    else if (key == 'j') {
      shape(person2,100,300,100,100);
    }
    else if (key == 'm') {
      shape(person2,100,400,100,100);
    }
    else if (key == 'q') {
      shape(person2,100,500,100,100);
    }
    else if (key == 'u') {
      shape(person2,0,200,100,100);
    }
    else if (key == 'v') {
      shape(person2,0,100,100,100);
    }
    else if (key == 'x') {
      shape(person2,100,200,100,100);
    }
    else if (key == 'z') {
      shape(person2,0,500,100,100);
    }
  }

  text("_", 50, 80);
  text("_", 70, 80);
  text("_", 90, 80);
  text("_", 110, 80);
  text("_", 130, 80);
  text("_", 150, 80);
  text("_", 170, 80);
  text("_", 190, 80);
  text("_", 210, 80);
  
  text("_", 280, 80);
  text("_", 300, 80);
  text("_", 320, 80);
  
  text("_", 370, 80);
  text("_", 390, 80);
  text("_", 410, 80);
  
  text("_", 460, 80);
  text("_", 480, 80);
  text("_", 500, 80);
  text("_", 520, 80);
  text("_", 540, 80);
  
  text("_", 120, 130);
  text("_", 140, 130);
  
  text("_", 190, 130);
  text("_", 210, 130);
  text("_", 230, 130);
  
  text("_", 280, 130);
  text("_", 300, 130);
  text("_", 320, 130);
  text("_", 340, 130);
  text("_", 360, 130);
  text("_", 380, 130);
  text("_", 400, 130);
  }
  
void setup() {
  size(600, 600);
  background(255);
  noFill();
  noStroke();
}


