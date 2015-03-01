
/* @pjs preload="aerialPhoto.jpg, peanut_butter5.png" ; font = "ZigguratHTFBlackItalic.ttf, WisdomScript.ttf";  */

PImage Aerial;
PImage PBAlogo;
PFont Ziggurat;
PFont Wisdom;

size(960,600);

Aerial = loadImage("aerialPhoto.jpg");
image(Aerial,0,0);

Ziggurat = createFont("ZigguratHTFBlackItalic.ttf", 400);
textFont(Ziggurat, 110);

fill(#FFFFFF, 200);
text("PEANUT", 40, 150);
text("BUTTER", 40, 250);
text("AIR", 40, 350);

Wisdom = createFont("WisdomScript.ttf", 400);
textFont(Wisdom, 48);

fill(#FFFFFF);
textLeading(50);
text("The", 770, 360, 200, 300);
text("Chunky", 770, 410, 200, 300);
text("Way to", 770, 460, 200, 300);
text("Fly", 770, 510, 200, 300);

PBAlogo = loadImage("peanut_butter5.png");
image(PBAlogo,35,320);

fill(#FA3030, 100);
noStroke();
rect(320,280,290,10);

fill(#1B48E3, 100);
noStroke();
rect(320,300,270,10);

fill(#F0F0F0, 100);
noStroke();
rect(320,320,250,10);


