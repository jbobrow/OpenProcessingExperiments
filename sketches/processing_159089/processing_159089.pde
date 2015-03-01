
/**Brandon Brown*/
/* @pjs font="Veneer-Italic.otf, Akzidenz-Grotesk-Condensed-Medium.ttf"; preload="Potato_Chips.jpg, bolt.png, arrow.png" ; */

PImage Chips; //nickmname!!
PImage Bolt; //nickmname!!
PImage Arrow; //nickmname!!
PFont Veneer; //nickname!!
PFont AGC; //nickname!!

size(720, 960);

Chips = loadImage("Potato_Chips.jpg");
image(Chips,0,0);

fill(#C0C1BF, 200);
noStroke();
rect(0, 160, 720, 410);

Bolt = loadImage("bolt.png");
image(Bolt,210,40);

Arrow = loadImage("arrow.png");
image(Arrow,285,580);

Veneer = createFont("Veneer-Italic.otf", 400);
textFont(Veneer, 230);

fill(#66FF66);
text("ENERGY", 70, 350);
text("CHIPS", 130, 540);

AGC = createFont("Akzidenz-Grotesk-Condensed-Medium.ttf", 400);
textFont(AGC, 70);

fill(#FFFFFF);
text("10 MG", 290, 750);
text("OF CAFFEINE", 238, 815);
text("IN EVERY BITE!", 220, 880);

fill(#C0C1BF, 200);
noStroke();
rect(215, 890, 285, 10);



