
//PRESS:
//f for chang the form thats drawn with
//s for save Frame
//b for beginRecord the PDF
//e for endRecord the PDF
//spacebar to clear the screen

//Imports
import processing.opengl.*;
import processing.pdf.*;

//Variables
int Shape = 0;
color c = color(random(100, 255), random(100, 255), 255);
boolean fullscreen = false;


void setup() {
  if (fullscreen) size(screen.width, screen.height);
  if (!fullscreen)  size(600, 600);
  smooth();
}

void draw() {
  Shape();
}

void keyPressed() {
  //Reset
  if (key == ' ') {
    reset();
  }

  //Save Frame
  if (key== 's') {
    println("Frame abspeichern");
    saveFrame("screenshot-####.tif");
  }

  //Begin Record 
  if (key=='b'||key=='B')
  {
    beginRecord(PDF, "zeichnung.pdf");
  }

  //End Record
  if (key=='e'||key=='E')
  {
    endRecord();
    exit();
  }

  //Change Shape
  if (key=='f'||key=='F')
  {
    changeShape();
  }
}

//set color
void mousePressed() {
  c = color(random(100, 255), random(100, 255), 255);
}

void reset() {
  background(170);
}

void changeShape() {
  Shape++;
  if (Shape > 4) {
    Shape = 0;
  }
}


void Shape() {


  if (mousePressed) {
    float mouseSpeed = dist(pmouseX, pmouseY, mouseX, mouseY);
    if (mouseSpeed > 20) mouseSpeed = 20;

    switch (Shape) {
    case 0:
      strokeWeight(20-mouseSpeed);
      stroke(c);
      fill(c);
      line(pmouseX, pmouseY, mouseX, mouseY);
      break;

    case 1:
      noStroke();
      fill(c, mouseSpeed*2);
      rectMode(CENTER);
      rect(0, mouseY, width*2, mouseSpeed+random(10));
      break;

    case 2:
      noStroke();
      fill(c, mouseSpeed*10);
      rectMode(CENTER);
      rect(mouseX, 0, mouseSpeed, height*2);
      break;

    case 3:
      float rad = mouseSpeed;
      noStroke();
      fill(random(255), 170); //greyscale & alpha
      pushMatrix();
      translate(mouseX, mouseY);
      for (int i =0; i<360; i+=45) { //schleife 360° im kreis
        pushMatrix();
        scale(mouseSpeed/15); /// größe von mousespeed abhängig
        rotate(radians(i));
        triangle(0+rad, -20+rad, 10+rad, 0+rad, -10+rad, 0+rad);
        popMatrix();
      }
      popMatrix();
      break;

    case 4:
      float randX = random(-30, 30); 
      float randY = random(-30, 30);
      stroke(random(100, 255), random(100, 255), random(100, 255), 220);
      strokeWeight(20-mouseSpeed);
      line(mouseX, mouseY, mouseX+randX, mouseY+randY); //von mousePos zu mousePos + willkürliche werte
      break;
    }
  }
}







