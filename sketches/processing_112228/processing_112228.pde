
// +/-                    Geschwindigkeit erhöhen/verringern
// x/y                    rotieren
// o/p                    Abstand erhöhen/verringern (nur bei Vierreck & Ellipse)
// n/m                    Höhe/Breite erhöhen/verringern
// UP/DOWN/LEFT/RIGHT     bewegen
// Rechtsklick             bewegen und loslassen mit Maus
// Linksklick             Verlauf nach innen/aussen





boolean inwards = true;
boolean mouseCentre=false;
float rotation = 0;
int x = 0;
int y = 0;
int speed = 0;
int changeHeight = 0;
int changeWidth = 0;
int space = 0;
int transX = 250;
int transY = 250;
int shape = 0;
//int stroke = 1;





void setup() {
  size(500, 500);
  smooth();
  colorMode(HSB);
}





void keyReleased() {
  if (key == ' ') {
    shape = (shape + 1) % 3;
  }
}





void keyPressed() {
  if (key == '+' && speed < 7) {
    speed++;
  }
  else if (key == '-' && speed > -7) {
    speed--;
  }
  else if (key == 'x' || key == 'X') {
    rotation++;
  }
  else if (key == 'y' || key == 'Y') {
    rotation--;
  }
  else if ((key == 'o' || key == 'O') && space > 0) {
    space--;
  }
  else if ((key == 'p' || key == 'P') && space < 5) {
    space++;
  }
  else if ((key == 'n' || key == 'N') && changeWidth > -30) {
    changeWidth-=3;
  }
  else if ((key == 'm' || key == 'M') && changeWidth < 30) {
    changeWidth+=3;
  }
  //  if (key == 'b' || key == 'B') {
  //    stroke++;
  //  }
  //  if ((key == 'v' || key == 'V') && stroke > 1) {
  //    stroke--;
  //  }
  else if (key == CODED) {
    if (keyCode == LEFT && x > -transX) {
      x-=5;
    }
    else if (keyCode == RIGHT && x < 500-transX) {
      x+=5;
    }
    else if (keyCode == UP && y > -transY) {
      y-=5;
    }
    else if (keyCode == DOWN && y < 500-transY) {
      y+=5;
    }
  }
}





void mouseReleased() {
  if (mouseButton == LEFT) {
    if (inwards == true) {
      inwards = false;
    }
    else {
      inwards = true;
    }
  }
  else if (mouseButton == RIGHT) {
    if (mouseCentre == false) {
      mouseCentre = true;
      cursor(CROSS);
      x = 0;
      y = 0;
    }
    else {
      mouseCentre = false;
      cursor(ARROW);
      transX = mouseX;
      transY = mouseY;
    }
  }
}





void draw() {
  if (shape == 0) {
    rectangle1();
  }
  else if (shape == 1) {
    ellipse1();
  }
  else {
    triangle1();
  }
}




//Viereck ======================================================================================
void rectangle1() {
  if (mouseCentre == true) {
    translate(mouseX, mouseY);
  }
  else {
    translate(transX + x, transY + y);
  }
  rotate(rotation * 0.05 * PI);
  if (space > 0) {
    strokeWeight(1);
  }
  else {
    strokeWeight(3);
  }
  background(0);
  for (int i = 0; i < 708; i++) {
    float hue = (noise(frameCount * (0.022 + speed * 0.002) + i * 0.005) * 500) % 255;
    stroke(hue, 255, 255);
    rectMode(CENTER);
    if (inwards==true) {
      fill(255, 0);
      rect(0, 0, i * (2 + space), i * (2 + space) + changeWidth * 5);
    }
    else {
      rect(0, 0, 1416 - 1 - i * (2 + space), 1416 - 1 - i * (2 + space) +changeWidth * 5);
    }
  }
}




//Ellipse===================================================================================
void ellipse1() {
  if (mouseCentre == true) {
    translate(mouseX, mouseY);
  }
  else {
    translate(transX + x, transY + y);
  }
  rotate(rotation * 0.05 * PI);
  background(0);
  for (int i = 0; i < 708; i++) {
    float hue = (noise(frameCount * (0.15 + speed * 0.015) + i * 0.005) * 500) % 255;
    stroke(hue, 255, 255);
    if (space > 0) {
      strokeWeight(1);
    }
    else {
      strokeWeight(2);
    }
    if (inwards == true) {
      fill(255, 0);
      ellipse(0, 0, 1 + i * (2 + space), 1 + i * (2 + space) + changeWidth * 5);
    }
    else {
      ellipse(0, 0, 1416 - 1 - i * (2 + space), 1416 - 1 - i * (2 + space) + changeWidth * 5);
    }
  }
}




//Dreieck =====================================================================================
void triangle1() {
  if (space > 0) {
    shape = 0;
  }
  if (mouseCentre == true) {
    translate(mouseX, mouseY);
  }
  else {
    translate(transX + x, transY + y);
  }
  rotate(rotation * 0.05 * PI);
  background(0);
  for (int i = 0; i < 708;i++) {
    float hue = (noise(frameCount * 0.15 + i * 0.005) * 500) % 255;
    stroke(hue, 255, 255);
    strokeWeight(3);
    fill(255, 0);
    if (inwards == true) {
      triangle(0, -1 * i + space, 2 * i + space, 1 * i + space, -2 * i + space, 1 * i + space);
    }
    else {
      triangle(0, -708 + i + space, 1416 - i * 2 + space + changeWidth * 5, 708 - i + space, 
      -1416 + i * 2 + space + changeWidth * 5, 708 - i + space);
    }
  }
}


