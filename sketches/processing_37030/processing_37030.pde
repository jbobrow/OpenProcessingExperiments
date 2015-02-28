

import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
float rot = 0;
void setup(){
PFont font;

 minim = new Minim(this);
 
  song = minim.loadFile("/data/roulette.wav");
  song.play();

size(600,600);
background(#0F6712);
noFill(); 
stroke(255);
strokeWeight(2);  
rect (50,50,500,500);  
rect (50,50,100,500);  
rect (50,50,200,500);  
rect (50,50,300,500);  
rect (50,50,300,500);  
rect (250,50,300,42);
rect (250,50,300,84);  
rect (250,50,300,126);  
rect (50,50,500,168);  
rect (250,50,300,210);  
rect (250,50,300,252);  
rect (250,50,300,294);  
rect (50,50,500,336);  
rect (250,50,300,378);  
rect (250,50,300,420);  
rect (250,50,300,460);  
rect (350,50,200,545);  
rect (450,50,100,545);
rect (250,50,100,545);
line(250,50,250,25);
line(250,25,325,10);
line(325,10,400,25);
line(400,50,400,25);
line(400,25,475,10);
line(475,10,550,25);
line(550,25,550,50);
line(50,470,150,470);
line(50,300,150,300);
line(50,135,150,135);
noStroke();
fill(237,7,11);
ellipse(300,70,90,30);
ellipse(500,70,90,30);
ellipse(300,155,90,30);
ellipse(500,155,90,30);
ellipse(300,280,90,30);
ellipse(500,280,90,30);
ellipse(500,197,90,30);
ellipse(400,112,90,30);
ellipse(400,238,90,30);
ellipse(300,322,90,30);
ellipse(500,322,90,30);
ellipse(400,365,90,30);
ellipse(300,407,90,30);
ellipse(500,448,90,30);
ellipse(500,407,90,30);
ellipse(400,490,90,30);
ellipse(300,529,90,30);
ellipse(500,529,90,30);
fill(0);
ellipse(400,70,90,30);
ellipse(400,155,90,30);
ellipse(300,112,90,30);
ellipse(500,112,90,30);
ellipse(300,197,90,30);
ellipse(400,197,90,30);
ellipse(300,238,90,30);
ellipse(500,238,90,30);
ellipse(400,280,90,30);
ellipse(400,322,90,30);
ellipse(300,365,90,30);
ellipse(500,365,90,30);
ellipse(400,407,90,30);
ellipse(300,448,90,30);
ellipse(400,448,90,30);
ellipse(300,490,90,30);
ellipse(500,490,90,30);
ellipse(400,529,90,30);
font=loadFont("SansSerif.bold-48.vlw");
textFont(font);
textSize(31);
fill(255);
text("0 ",318,43);
text("00 ",458,43);
text("    1         2         3 ",260,80);
text("    4         5         6 ",260,122);
text("    7         8         9 ",260,165);
text("   10       11       12 ",260,207);
text("   13       14       15 ",260,248);
text("   16       17       18 ",260,290);
text("   19       20       21 ",260,334);
text("   22       23       24 ",260,376);
text("   25       26       27 ",260,418);
text("   28       29       30 ",260,460);
text("   31       32       33 ",260,502);
text("   34       35       36 ",260,541);
textSize(22);
text("  2 to 1        2 to 1       2 to 1",260,582);

rotate(PI/2);
textSize(32);
fill(255);
textAlign(LEFT, CENTER);
text("1st 12        2nd 12       3rd 12", 90, -200);
textSize(20);
fill(255);
text("1 to 18    EVEN", 60, -105);

fill(#FF2D03);
text("RED", 240, -105);
fill(0);
text("BLACK", 308, -105);
fill(255);
text("ODD   19 to 36", 409, -105);


}
void draw()
{ 
colorMode(HSB);
 smooth();
 stroke(0);
strokeWeight(7);
  
  
  float x= random(255);
   if (mousePressed) {
   noLoop(); 
    } else {
  fill(x,255,255);
   delay(150); }
   

  
  
ellipse(mouseX, mouseY,100,100);  
ellipse(mouseX, mouseY,50,100);
ellipse(mouseX, mouseY,100,50 );
ellipse(mouseX, mouseY,75,75);






}


void stop()
{
  song.close();
  minim.stop();
 
  super.stop();
}


