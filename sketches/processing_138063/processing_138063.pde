
//Texas Hold'em Royal Flush.
//Press "q" key to see the flop (first 3 cards).
//Press "p" key to see the turn (4th card).
//And finally press "m" key to see the river (5th card).
// See who has Royal Flush by pressing "w" key.
// And to celebrate the winner of the Royal Flush press mouse.

PImage jackofspades;
PImage aceofspades;
PImage queenofspades;
PImage kingofspades;
PImage tenofspades;
PImage jackofdiamonds;
PImage nineofdiamonds;
PImage royalflush;
color[] palette = {#321F62, #106F4B, #0C0D0D, #E84528, #235190, #A70A95};
float i;

void setup() {
  size(800,600);
  background(palette[int(random(6))]);
  fill(palette[int(random(4, 6))]);
  ellipse(400, 370, 800, 400);
  fill(0, 0, 0);
  ellipse(400, 370, 770, 370);
  jackofspades = loadImage("jackofspades.jpg");
  aceofspades = loadImage("aceofspades.jpg");
  jackofdiamonds = loadImage("jackofdiamonds.jpg");
  nineofdiamonds = loadImage("nineofdiamonds.jpg");
  queenofspades = loadImage("queenofspades.jpg");
  kingofspades = loadImage("kingofspades.jpg");
  tenofspades = loadImage("tenofspades.png");
  royalflush = loadImage("royalflush.jpg");
  
  fill(250, 230, 0);
  rect(200, 440, 50, 70);
  rect(190, 450, 50, 70);
  
  rect(40, 330, 50, 70);
  rect(30, 340, 50, 70);
  
  rect(200, 220, 50, 70);
  rect(190, 230, 50, 70);
  
  rect(720, 330, 50, 70);
  rect(710, 340, 50, 70);
  
  rect(540, 220, 50, 70);
  rect(530, 230, 50, 70);
  
  rect(540, 440, 50, 70);
  rect(530, 450, 50, 70);
  
}

void draw() {
  
  fill(#2CD87D);
  textSize(40);
  textAlign(CENTER);
  text("PokerStars", width/2, height/6);  
  
 if (key=='q' || key=='Q') {
  image(jackofdiamonds, 250, 320, 70, 100);
  image(jackofspades, 322, 320, 70, 100);
  image(queenofspades, 394, 320, 70, 100);
  
 }
 
 if(key=='p'||key=='P'){
   image(nineofdiamonds, 466, 320, 70, 100);
 }
 if(key=='m' || key=='M') {
 image(tenofspades, 538, 320, 70, 100);
 }
 
 if(key=='w'|| key=='W'){
 image(aceofspades, 182, 440, 70, 100);
 image(kingofspades, 255, 440, 70, 100);
 textAlign(CENTER);
 textSize(50);
 text("Royal Flush!!!", width/2, height/4);
 }
 
 if (mousePressed==true) {
 image(royalflush, i++, i++, 350, 200);
 }
}

