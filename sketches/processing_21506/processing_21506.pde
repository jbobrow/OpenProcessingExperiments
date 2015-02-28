
PFont Mont;
int clickCount = 0;


int[] clicksX = new int[1000];
int[] clicksY = new int[1000];

color c1 = color(198,183,42, 50);
color c2 = color(71,118,126, 50);
color c3 = color(124,96,74, 50);
color c4 = color(227,158,219, 50);
color c5 = color(160,140,157, 50);
color c6 = color(229,122,60, 50);
color c7 = color(212, 214, 110, 50);



void setup() {
  size (500, 500);
  background(255);
  smooth();
  Mont = loadFont("Mont.vlw");

}


void mousePressed() {

  clicksX[clickCount] = mouseX;
  clicksY[clickCount] = mouseY;
  clickCount++;

  for (int i=0; i<clickCount; i++) {
    color colorPick [] = { c1, c2, c3, c4, c5, c6, c7 };
    color colorPick1 = colorPick[int(random(0,6))];
    stroke(colorPick1);
    line(clicksX[i], clicksY[i], mouseX, mouseY);

  }
}

void draw() {

  if(mousePressed) {
    noStroke();
    color colorPick [] = { c1, c2, c3, c4, c5, c6, c7 };
    color colorPick1 = colorPick[int(random(0,6))];
    fill(colorPick1);
    ellipse(mouseX, mouseY, 50, 50);

    fill (255);
    textFont(Mont);
    String GMA [] = {"A", "G", "M"}; // spells GMA
    String GMA1 = GMA[clickCount % 3];
    text(GMA1, mouseX-3.5, mouseY+12);

  }

}




