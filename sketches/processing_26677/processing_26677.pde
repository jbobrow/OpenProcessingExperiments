
color buttonone = #36A6FF;
color buttontwo = #EA071A;
color buttonthree = #73FF4D;
color buttonfour = #000000;
color buttonfive = #FFFFFF;
color buttonsix = #FF0F78;
color buttonseven = #FFF752;
color buttoneight = #FF9100;
color penColor = #000000;
int thick = 1;
float oldX, oldY; 


void setup () {
  size(450,450);
  smooth();
  background (255);
}

void draw () {
  noStroke();
  //button one - blue
  fill (buttonone);
  rect (10,10,20,20);
  //button two - red
  fill(buttontwo);
  rect (10,30,20,20);
  //button three - green
  fill (buttonthree);
  rect (10,50,20,20);
  //button four - black
  fill (buttonfour);
  rect (10,70,20,20);
  //button five -white
  fill(buttonfive);
  rect(10,90,20,20);
  //button six
  fill(buttonsix);
  rect(10,110,20,20);
  //button seven
  fill(buttonseven);
  rect(10,130,20,20);
  //button eight
  fill(buttoneight);
  rect(10,150,20,20);
  //seeing where mouse is when pressed
  if (mousePressed && mouseButton == LEFT) {
    if (mouseX<30 && mouseX>10) {
      if (mouseY<30 && mouseY>10) {
        penColor = buttonone;
        thick=1;
      }
      else if (mouseY<50 && mouseY>30) {
        penColor = buttontwo;
        thick=4;
      }
      else if (mouseY<70 && mouseY>50) {
        penColor = buttonthree;
        thick=3;
      }
      else if (mouseY<90 && mouseY>70) {
        penColor = buttonfour;
        thick=2;
      }
      else if (mouseY<110 && mouseY>90) {
        penColor = buttonfive;
        thick=20;
      }
       else if (mouseY<130 && mouseY>110) {
        penColor = buttonsix;
        thick=2;
      }
       else if (mouseY<150 && mouseY>130) {
        penColor = buttonseven;
        thick=3;
      }
       else if (mouseY<170 && mouseY>150) {
        penColor = buttoneight;
        thick=3;
      }
    }
    stroke (penColor);
    strokeWeight (thick);
    line (oldX, oldY, mouseX, mouseY);
  }
  if(mousePressed && mouseButton == RIGHT) {
   background(255); 
  }
  oldX = mouseX;
  oldY = mouseY;
}

