
int xPos = 28;
int yPos = 80;
int S = 40;
int W = 45;
int sw;
int r, g, b;
void setup() {
  size(800, 600);
  background(215, 215, 215);
 
  fill(255, 255, 255);
  noStroke();
  rect(100, 20, 680, 560, 7);
 
  fill(255,227,225);
  ellipse(xPos, yPos, S, S);
  fill(255,135,130);
  ellipse(xPos, yPos+W, S, S);
  fill(240,87,104);
  ellipse(xPos, yPos+W*2, S, S);
  fill(255, 86, 66);
  ellipse(xPos, yPos+W*3, S, S);
  fill(194,0,0);
  
  ellipse(xPos, yPos+W*4, S, S);
  fill(226, 164, 014);
  ellipse(xPos, yPos+W*5, S, S);
  fill(255, 174, 055);
  ellipse(xPos, yPos+W*6, S, S);
  fill(249, 208, 107);
  ellipse(xPos, yPos+W*7, S, S);
  fill(255, 243, 152);
  
  ellipse(xPos, yPos+W*8, S, S);
  fill(214,255,113);
  ellipse(xPos+S+5, yPos, S, S);
  fill(178, 242, 0);
  ellipse(xPos+S+5, yPos+W, S, S);
  fill(152,205,066);
  ellipse(xPos+S+5, yPos+W*2, S, S);
  fill(113,249,175);
  ellipse(xPos+S+5, yPos+W*3, S, S);
  fill(28, 190, 133);
  
  ellipse(xPos+S+5, yPos+W*4, S, S);
  fill(0, 178, 186);
  ellipse(xPos+S+5, yPos+W*5, S, S); 
  fill(0, 146, 224);
  ellipse(xPos+S+5, yPos+W*6, S, S);
  fill(4, 111, 156);
  ellipse(xPos+S+5, yPos+W*7, S, S);
  fill(74, 0, 174);
  ellipse(xPos+S+5, yPos+W*8, S, S);

   
}
 
void draw() {
 
 
 
  if (mousePressed) {

    if (mouseX>110 && mouseX<780 && mouseY>40 && mouseY<580) {
      line (pmouseX, pmouseY, mouseX, mouseY);
    }
  
 strokeWeight(5);
    if (mouseX>xPos-13 && mouseX<xPos+S && mouseY>yPos-5 && mouseY<yPos+S) {
      stroke(255,227,225);
    }
 
    if (mouseX>xPos-13 && mouseX<xPos+S && mouseY>yPos-10+W && mouseY<yPos+W*2) {
      stroke(255,135,130);
    }
 
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*2 && mouseY<yPos+W*3) {
      stroke(240,87,104);
    }
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*3 && mouseY<yPos+W*4) {
      stroke(255,86,66);
    }
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*4 && mouseY<yPos+W*5) {
      stroke(194,0,0);
    }
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*5 && mouseY<yPos+W*6) {
      stroke(226, 164, 014);
    }
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*6 && mouseY<yPos+W*7) {
      stroke(255,174,055);
    }
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*7 && mouseY<yPos+W*8) {
      stroke(249, 208, 107);
    }
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*8 && mouseY<yPos+W*9) {
      stroke(255, 243, 152);
    }
    if (mouseX>xPos-10 && mouseX<xPos+S && mouseY>yPos-10+W*9 && mouseY<yPos+W*10) {
      stroke(214,255,113);
    }   
    if (mouseX>xPos && mouseX<xPos+S+S && mouseY>yPos-10 && mouseY<yPos+S) {
      stroke(178, 242, 0);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S && mouseY<yPos+S+S) {
      stroke(155, 255, 0);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S+S && mouseY<yPos+S+S+S) {
      stroke(152,205,066);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S+S+S && mouseY<yPos+S+S+S+S) {
      stroke(113,249,175);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S && mouseY<yPos+S+S+S+S+S) {
      stroke(28, 190, 133);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S) {
      stroke(0, 178, 186);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S) {
      stroke(0, 146, 224);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S+S) {
      stroke(4, 111, 156);
    }
    if (mouseX>xPos+5 && mouseX<xPos+S+S && mouseY>yPos+S+S+S+S+S+S+S+S && mouseY<yPos+S+S+S+S+S+S+S+S+S) {
      stroke(74, 0, 174);
    }

  }

}
