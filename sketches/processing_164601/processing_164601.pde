
int x = 0;

void setup() {
  size(500, 600);
  smooth();
  noStroke();
}

void draw() {

  fill(255, 196, 195);
  rect(0, 0, 1500, 25);
  fill(255, 196, 200);
  rect(0, 25, 1500, 25);
  fill(255, 196, 205);
  rect(0, 50, 1500, 25);
  fill(255, 196, 210);
  rect(0, 75, 1500, 25);
  fill(255, 196, 215);
  rect(0, 100, 1500, 25);
  fill(255, 196, 220);
  rect(0, 125, 1500, 25);
 fill(255, 196, 225);
  rect(0, 150, 1500, 25);
  fill(255, 196, 230);
  rect(0, 175, 1500, 25);
  fill(255, 196, 235);
  rect(0, 200, 1500, 25);
  fill(255, 196, 240);
  rect(0, 225, 1500, 25);
  fill(255, 196, 245);
  rect(0, 250, 1500, 25);
 fill(255, 196, 250);
  rect(0, 275, 1500, 25);
  fill(255, 196, 255);
  rect(0, 300, 1500, 25);
  fill(255, 196, 260);
  rect(0, 325, 1400, 25);
 fill(255, 196, 265);
  rect(0, 350, 1400, 25);
 fill(255, 196, 270);
  rect(0, 375, 1400, 25);
  fill(255, 196, 275);
  rect(0, 400, 1500, 25);

//cloud and seconds
  float s = map(second(), 0, 60, 50, 450);

  fill(255, 255, 255);
  ellipse(s, 50, 200, 50);
  ellipse(s+40, 30, 90, 40);
  ellipse(s-15, 35, 80, 30);

PFont font;
fill(0);
font = loadFont("Avenir-HeavyOblique-10.vlw");
textFont(font, 32);
text(" " + second(), s-20, 57);


//sun and minutes
float m = map(minute(), 0, 60, 130, 400);

  fill(235,255,167);
  ellipse(250, m, 100, 100);
   fill(235,245,167);
  ellipse(250, m, 70, 70);
   fill(235,235,167);
  ellipse(250, m, 40, 40);

PFont sunfont;
fill(0);
sunfont = loadFont("Avenir-HeavyOblique-10.vlw");
textFont(sunfont, 32);
text(" " + minute(), 220,m+10);

//ocean and hours
float h = map(hour(), -50, 60, 0, 450);

  fill(150, 155, 255);
  rect(h-300, 420, 600, 10);
  fill(155, 155, 255);
  rect(h-300, 430, 600, 10);
  fill(160, 155, 255);
  rect(h-300, 440, 600, 10);
  fill(165, 155, 255);
  rect(h-300, 450, 600, 10);
  fill(170, 155, 255);
  rect(h-300, 460, 600, 10);
  fill(175, 155, 255);
  rect(h-300, 470, 600, 10);
  fill(180, 155, 255);
  rect(h-300, 480, 600, 10);
  fill(185, 155, 255);
  rect(h-300, 490, 600, 10);
   fill(190, 155, 255);
  rect(h-300, 500, 600, 10);
   fill(195, 155, 255);
  rect(h-300, 510, 600, 10);
   fill(200, 155, 255);
  rect(h-300, 520, 600, 10);
   fill(205, 155, 255);
  rect(h-300, 530, 600,10);
   fill(210, 155, 255);
  rect(h-300, 540, 600, 10);
   fill(215, 155, 255);
  rect(h-300, 550, 600, 10);
   fill(220, 155, 255);
  rect(h-300, 560, 600, 10);
   fill(225, 155, 255);
  rect(h-300, 570, 600, 10);
   fill(230, 155, 255);
  rect(h-300, 580, 600, 10);
   fill(235, 155, 255);
  rect(h-300, 590, 600, 10);
   fill(240, 155, 255);
 rect(h-300, 600, 600, 10);
   fill(245, 155, 255);
   
PFont oceanfont;
fill(0);
oceanfont = loadFont("Avenir-HeavyOblique-10.vlw");
textFont(oceanfont, 32);
text(" " + hour(), h, 500);
}


