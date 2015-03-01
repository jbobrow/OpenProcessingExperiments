
int pink = color(246, 206, 227);
int trans = 255; // 255 = ondoorzichtig
int black = color(0);
int grey = color(200, trans);
int groen = color(150, 225, 170, trans);
int tuxblue = color(83, 178, 232, trans); // tuxedo sam blue
int white = color(255, trans);
int yellow = color(255, 230, 50, trans);
int red = color(255, 50, 0, trans);
int lekkerdik = 8; // strokeWeight

void setup()
{
  size(800, 800);
  smooth();
  strokeJoin(ROUND); // make rounded corners
  frameRate(20);
}

void draw()
{
  background(pink);
//  originalTS(); // originele tuxedo sam
  grid();
  footright();
  hat();
  bluebody();
  whitebody();
 if (mouseY < 375)
 {
   bowtie();
   eyesMove();
 }
 else
 {
   eyes();
   bowtieTurn();   
 }
  armleft();
  footleft();
  beak();
}

void beak()
{
  stroke(black);
  strokeWeight(lekkerdik);
  fill(yellow); 
  beginShape();
  vertex(340, 345);
  bezierVertex(395, 305, 395, 305, 445, 340);
  bezierVertex(395, 355, 395, 355, 340, 345);  
  endShape();
}

void eyes()
{
  noStroke();
  fill(black);
  ellipse(355, 300, 20, 30); // eye left 
  ellipse(430, 300, 20, 30); // eye right 
}

void eyesMove()
{
  float map1 = map(mouseX, 0, width, 225, 600);
  float map2 = map(mouseX, 0, width, 400, 500);
  noStroke();
  fill(black);
  ellipse(map1, 300, 20, 30); // eye left 355
  ellipse(map2, 300, 20, 30); // eye right 450
}

void footleft()
{
  stroke(black);
  strokeWeight(lekkerdik);
  fill(yellow);
  beginShape();
  vertex(195, 465); // punt tussen twee linkertenen 
  bezierVertex(190, 425, 210, 425, 230, 445); // punt tussen twee rechtertenen
  bezierVertex(230, 390, 290, 420, 295, 515);
  bezierVertex(290, 565, 240, 585, 200, 550);
  bezierVertex(130, 475, 165, 425, 195, 465);
  endShape();
// helpdots to see raaklijnen 
//  noStroke();
//  fill(255, 0, 0);
//  ellipse(140, 475, 5, 5); // red
//  fill(0, 255, 0);
//  ellipse(230, 390, 5, 5); // green
//  fill(0, 0, 255);
//  ellipse(290, 420, 5, 5); // blue
//  fill(255, 255, 0);
//  ellipse(170, 420, 5, 5); // yellow
}

void armleft()
{
  stroke(black);
  strokeWeight(lekkerdik);
  fill(tuxblue);
  beginShape();
  vertex(265, 430);
  bezierVertex(400, 525, 450, 425, 325, 355);
  endShape();
}

void bowtie()
{
  stroke(black);
  strokeWeight(lekkerdik);
  fill(red);
  beginShape();
  vertex(350, 390);
  bezierVertex(360, 390, 390, 410, 400, 425); // linksboven
  bezierVertex(410, 410, 440, 390, 450, 390); // rechtsboven
  bezierVertex(460, 400, 460, 440, 450, 450); // verticaal rechts
  bezierVertex(435, 450, 410, 435, 400, 425); // rechtsonder
  bezierVertex(390, 435, 360, 450, 350, 450); // linksonder    
  bezierVertex(340, 440, 340, 400, 350, 390); // verticaal links
  endShape();
}

void bowtieTurn()
{
  int xb = 400;
  int yb = 425;
  float map3 = map(mouseY, 375, height, 0, 2*PI);
  stroke(black);
  strokeWeight(lekkerdik);
  fill(red);
  pushMatrix();
  translate(xb, yb);
  rotate(map3);
  beginShape();
  vertex(350-xb, 390-yb);
  bezierVertex(360-xb, 390-yb, 390-xb, 410-yb, 400-xb, 425-yb); // linksboven
  bezierVertex(410-xb, 410-yb, 440-xb, 390-yb, 450-xb, 390-yb); // rechtsboven
  bezierVertex(460-xb, 400-yb, 460-xb, 440-yb, 450-xb, 450-yb); // verticaal rechts
  bezierVertex(435-xb, 450-yb, 410-xb, 435-yb, 400-xb, 425-yb); // rechtsonder
  bezierVertex(390-xb, 435-yb, 360-xb, 450-yb, 350-xb, 450-yb); // linksonder    
  bezierVertex(340-xb, 440-yb, 340-xb, 400-yb, 350-xb, 390-yb); // verticaal links
  endShape();
  popMatrix();
}

void whitebody()
{
  stroke(black);
  strokeWeight(lekkerdik);
  fill(white);
  beginShape();
  vertex(250, 575); // linksonder eerste punt
  bezierVertex(250, 300, 550, 300, 548, 550); // big white
  bezierVertex(510, 640, 450, 575, 400, 575); // bottom right
  bezierVertex(350, 575, 300, 625, 250, 575); // bottom left  
  endShape();
}

void bluebody()
{
  stroke(black);
  strokeWeight(lekkerdik);
  fill(tuxblue);
  beginShape();
  vertex(250, 575); // linksonder eerste punt
  bezierVertex(0, 100, 550, 0, 575, 325); // big blue
  bezierVertex(650, 275, 725, 375, 570, 450); // arm right
  bezierVertex(550, 675, 450, 575, 400, 575); // bottom right
  bezierVertex(350, 575, 300, 625, 250, 575); // bottom left
// old: without arm right:
//  bezierVertex(-50, -25, 800, -25, 525, 575); // big blue
//  bezierVertex(500, 625, 450, 575, 400, 575); // bottom right
//  bezierVertex(350, 575, 300, 625, 250, 575); // bottom left
  endShape();
}

void hat()
{
  stroke(black);
  strokeWeight(lekkerdik);
  beginShape(); // LINTJE
  fill(groen);
  vertex(195, 185); // start rechtsonder
  bezierVertex(180, 180, 165, 185, 150, 200);
  vertex(155, 170);
  vertex(135, 165);
  bezierVertex(150, 155, 180, 150, 200, 155);
  endShape();
  beginShape(); // BOL TOPJE
  fill(grey);
  vertex(195, 180); // start links
  bezierVertex(195, 110, 250, 90, 295, 110);
  endShape();
  beginShape(); // GROENE BAND
  fill(groen);
  vertex(200, 215); // start linksonder
  vertex(185, 200);
  bezierVertex(215, 145, 270, 110, 315, 100);
  vertex(325, 120);
  endShape();
  beginShape(); // ONDERSTE RAND
  fill(grey);
  vertex(220, 230); // start linksonder
  vertex(200, 215);
  bezierVertex(220, 170, 275, 130, 325, 120);
  vertex(330, 150); 
  endShape();
}

void footright()
{
  pushMatrix();
  translate(500, 1125);
  rotate(radians(200));
  footleft();
  popMatrix();
}

void grid()
{
  stroke(200);
  strokeWeight(1);
  for (int x = 0; x < width; x = x + 50) 
  {
    line(x, 0, x, height);
  }
  for (int y = 0; y < height; y = y + 50)
  {
    line(0, y, width, y);
  }
  legenda();
}

void legenda() 
{
  fill(255);
  for (int t = 0; t < width; t = t + 50)
  {
  text(t, t+2, 12);
  text(t, 2, t+12);
  text(t, t+2, 762);
  text(t, 752, t+12);
  }
}

void originalTS()
{
  PImage img; 
  img = loadImage("TuxedoSam.jpg");
  pushMatrix();
  rotate(radians(19));
  translate(180, -50);
  image(img, 0, 0);
  popMatrix();
}



