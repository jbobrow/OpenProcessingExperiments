

int xPos = 20;
int yPos = 20;
int S = 30;
int sw;
int r, g, b;
void setup() {
  size(800, 600);
  background(215, 215, 215);

  fill(255, 255, 255);
  noStroke();
  rect(100, 0, 800, 600);

  fill(150);
  rect(10, yPos-10, 80, 300); 
  fill(255, 0, 0);
  rect(xPos, yPos, S, S);
  fill(255, 125, 0);
  rect(xPos, yPos+S, S, S);
  fill(255, 200, 0);
  rect(xPos, yPos+S+S, S, S);
  fill(255, 255, 0);
  rect(xPos, yPos+S+S+S, S, S);
  fill(155, 255, 0);
  rect(xPos, yPos+S+S+S+S, S, S);
  fill(0, 255, 0);
  rect(xPos, yPos+S+S+S+S+S, S, S);
  fill(0, 255, 155);
  rect(xPos, yPos+S+S+S+S+S+S, S, S);
  fill(0, 255, 255);
  rect(xPos, yPos+S+S+S+S+S+S+S, S, S); 
  fill(0, 155, 255);
  rect(xPos, yPos+S+S+S+S+S+S+S+S, S, S);
  fill(0, 0, 255);
  rect(xPos+S, yPos, S, S);
  fill(155, 0, 255);
  rect(xPos+S, yPos+S, S, S);
  fill(255, 0, 255);
  rect(xPos+S, yPos+S+S, S, S);
  fill(255, 0, 125);
  rect(xPos+S, yPos+S+S+S, S, S);
  fill(255, 255, 255);
  rect(xPos+S, yPos+S+S+S+S, S, S);
  fill(175, 175, 175);
  rect(xPos+S, yPos+S+S+S+S+S, S, S);  
  fill(90, 90, 90);
  rect(xPos+S, yPos+S+S+S+S+S+S, S, S);
  fill(40);
  rect(xPos+S, yPos+S+S+S+S+S+S+S, S, S);
  fill(0);
  rect(xPos+S, yPos+S+S+S+S+S+S+S+S, S, S);

  stroke(255);
  strokeWeight(1);

  noFill();
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S, S+S, S);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S, S+S, S);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S, S+S, S);
  rect(xPos, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S, S+S, S);

  stroke(0);
  line(xPos+5, yPos+S+S+S+S+S+S+S+S+S+S+S+15, xPos+S+25, yPos+S+S+S+S+S+S+S+S+S+S+S+15);
  strokeWeight(3);
  line(xPos+5, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+15, xPos+S+25, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+15);
  strokeWeight(5);
  line(xPos+5, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+15, xPos+S+25, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+15);
  strokeWeight(7);
  line(xPos+5, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+15, xPos+S+25, yPos+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+S+15);
  
  sw = 1;
  r = 0;
  g = 0;
  b = 0;
  
}

void draw() {



  if (mousePressed) {

    if (mouseX>150 && mouseX<780 && mouseY>20 && mouseY<580) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }
 

    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos && mouseY<yPos+S) {
      r = 255;
      g = 0;
      b = 0;
    }

    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S && mouseY<yPos+S+S) {
      r = 255;
      g = 125;
      b = 0;
    }

    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S && mouseY<yPos+S+S+S) {
      r = 255;
      g = 200;
      b = 0;
    }
    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S+S && mouseY<yPos+S+S+S+S) {
      r = 255;
      g = 255;
      b = 0;
    }
    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S+S+S && mouseY<yPos+S+S+S+S+S) {
      r = 155;
      g = 255;
      b = 0;
    }
    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S) {
      r=0;
      g=255;
      b=0;
    }
    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S) {
      r=0;
      g=255;
      b=155;
    }
    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S+S) {
      r=0;
      g=255;
      b=255;
    }
    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S+S+S) {
      r=0;
      g=155;
      b=255;
    }
    if (mouseX>xPos && mouseX<xPos+S && mouseY>yPos+S+S+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S+S+S) {
      r=0;
      g=155;
      b=255;
    }    
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos && mouseY<yPos+S) {
      r=0;
      g=0;
      b=255;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S && mouseY<yPos+S+S) {
      r=155;
      g=0;
      b=255;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S+S && mouseY<yPos+S+S+S) {
      r=255;
      g=0;
      b=255;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S+S+S && mouseY<yPos+S+S+S+S) {
      r=255;
      g=0;
      b=125;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S && mouseY<yPos+S+S+S+S+S) {
      r=255;
      g=255;
      b=255;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S) {
      r=175;
      g=175;
      b=175;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S) {
      r=90;
      g=90;
      b=90;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S+S) {
      r=40;
      g=40;
      b=40;
    }
    if (mouseX>xPos+S && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S+S+S) {
      r=0;
      g=0;
      b=0;
    }
       

    if (mouseX>xPos && mouseX<xPos+S+S && mouseY> yPos+S+S+S+S+S+S+S+S+S*3 && mouseY<yPos+S+S+S+S+S+S+S+S+S*4) {
      stroke(0);
      sw = 1;
    }
    if (mouseX>xPos && mouseX<xPos+S+S && mouseY> yPos+S+S+S+S+S+S+S+S+S*5 && mouseY<yPos+S+S+S+S+S+S+S+S+S*6) {
      stroke(0);
      sw = 3;
    }
    if (mouseX>xPos && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S+S+S+S*7 && mouseY<yPos+S+S+S+S+S+S+S+S+S+S+S*8) {
      stroke(0);
      sw = 5;
    }
    if (mouseX>xPos && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S+S+S+S*9 && mouseY<yPos+S+S+S+S+S+S+S+S+S+S+S*9) {
      stroke(0);
      sw = 7;
    }

    strokeWeight(sw);
    stroke(r,g,b);
  }






  println(sw);
}

