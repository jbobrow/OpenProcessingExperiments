
int xpos1, ypos1, xpos2, ypos2, xpos3, ypos3;
float colorR, colorG, colorB;
float colorR1, colorG1, colorB1;
PFont font, font1;

import ddf.minim.*;  // Import Audio Source by Minim

Minim minim;
AudioPlayer bgmusic;

void setup() {
  size(400,400);
  smooth();
  
  // Setting of Audio
  // Quote from György Ligeti's Lux Aeterna performed by 
  // A Cappella Amsterdam, Daniel Reuss & Susanne Van Els
  minim = new Minim(this);             
  bgmusic = minim.loadFile("György Ligeti- Lux Aeterna_Quote.wav"); 
  bgmusic.loop();
}

void draw() {
  frameRate(1);
  background(colorR, colorG, colorB);
  print("<",colorR,"-", colorG,"-", colorB, ">");
  colorR = random(255);
  colorG = random(255);
  colorB = random(255);
  
  // Short story 
  fill(255);
  font1 = loadFont("Onyx-48.vlw");
  textFont(font1,30);
  text("I can’t  go out,", 50, 50);
  text("trap in this crowded and nasty place.", 120, 80);
  text("It is so muggy,", 20, 110);
  text("some viscous liquids stick on my feet, ", 80, 140);
  text("it is too dark to recognize what is it,", 120, 170);
  text("I don’t know where am I. ", 160, 200);
  text("I try to straighten my hand but I can’t, ", 50, 230);
  text("there is a obstacle placed in front of me, ", 20, 260);
  text("I turn over and keep searching way to out, ", 50, 290);
  text("but there are something block my way, ", 80, 320);
  text("I feel like inside a kind of container, ", 65, 350);
  text("which make me hard to breath.", 80, 380);
  
  // 3 Questions with random colors
  fill(colorR1, colorG1, colorB1);
  colorR1 = random(50,200);
  colorG1 = random(50,200);
  colorB1 = random(50,200);
  font = loadFont("MarkerFelt-Wide-48.vlw");
  textFont(font,32);
  xpos1 = floor(random(0, 140));
  ypos1 = floor(random(height));
  xpos2 = floor(random(0, 160));
  ypos2 = floor(random(height));
  xpos3 = floor(random(0, 200));
  ypos3 = floor(random(height));
  text("ANYONE HEAR ME?",xpos1,ypos1);
  text("ANYONE HERE?",xpos2,ypos2);
  text("HELP!",xpos3,ypos3);
  
  
  
  
}
  
  


