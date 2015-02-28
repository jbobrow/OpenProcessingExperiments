
PFont font1;
PImage bg;
PImage cal;


void setup() {
  size(600, 450);

  smooth();
  font1 = loadFont("MicrosoftNewTaiLue-48.vlw");
  textFont(font1);
}


void draw() {
    bg= loadImage("BG.jpg");
    image(bg,0,0,600,450);
    fill(255,50);
    rect(0,0,600,450);
    cal=loadImage("calendar.PNG");
    image(cal,5,5);

  textSize(20);
  fill(#106293);
  text("NOVEMBER 2011", 210, 25);

  fill(255);
  textSize(13);    
 text("MO                TU                WE                TH                FR                SA               SU", 45, 50);

  fill(255);
  stroke(150);
  if (mousePressed) {
    rect(mouseX, mouseY, 125, 150);
    textSize(11);
    fill(100);
    text("The average speed=20  The highest speed=30  Calories burned=800  Heart rate=100  Calories eaten=1200", mouseX, mouseY, 120, 150);
  }

}


