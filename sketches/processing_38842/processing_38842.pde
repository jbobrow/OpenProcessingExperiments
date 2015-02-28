
/*
Daniela Gill
Asignment 2
Library: Moving Letters


*/

//audio
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioPlayer mysound;
AudioMetaData meta;

int endY;  // y value of last of a series of lines
int bx;    // x value of moving dot

import de.ilu.movingletters.*;
MovingLetters letters;

color[] colors;

void setup() {
size(840, 660);
stroke(100, 2, 100);
//smooth();

//audio , creating the Minim object
 minim = new Minim(this);                        
// loading the MP3 // setting a buffersize
mysound = minim.loadFile("traffic.mp3", 512);        
meta = mysound.getMetaData();
mysound.loop();            


//letters
letters = new MovingLetters(this, 30);
colors = new color[]{
    color(100, 100, 240), // 0
    color(40, 20, 220), // 1
    color(60, 20, 200), // 2
    color(80, 20, 180), // 3
    color(100, 20, 160), // 4
    color(120, 20, 140), // 5
    color(140, 20, 120), // 6
    color(160, 20, 100), // 7
    color(180, 20, 80), // 8
    color(200, 20, 60), // 9
    color(220, 20, 40), // 10
    color(240, 20, 20), // 11
  };
  
  //lines
   frameRate(30);
   
  // Start endY with a negative value to delay appearance
  // of lines
  endY = -100;
  bx = 0;
}

void draw() {
  background(#FF9100);
  int yPos = 100;

 //lines
  
  for (int y = 0; y <= endY; y += 5) {
    stroke(#FFF700);
    line(0, y, width, y);
  }
 
   
  // draw the dot
 smooth();
 noStroke();
 fill(#FF00EF);
 //ellipse(bx, 620, 10, 10);
  //rect(bx, 620, 10, 10);

  
  
  // Increase the y value of the last line, which increases
  // the number of lines.
  if (endY < height) {
    endY += 5;
  }
  bx += 2;
  
  //backgrounds for texts
  fill(#FF9100);
  rect(170,90, 562, 400);
  
  fill(255);
  rect(320, 560, 280, 50);
  
  //letters
  
  stroke(#6D00FF);
  letters.text("Existen derrotas, pero", 180, yPos);
  yPos += 50;
   letters.text("nadie esta a salvo de", 180, yPos);
  yPos += 50;
  letters.text("ellas. Por eso es mejor ", 180, yPos);
  yPos += 50;

  letters.text("perder algunos combates", 180, yPos);
  yPos += 50;

  letters.text("en la lucha por nuestros", 180, yPos);
  yPos += 50;
  
  letters.text("suenos que ser derrotados", 180, yPos);
  yPos += 50;
  
  letters.text("sin siquiera saber por que ", 180, yPos);
  yPos += 50;
  
  letters.text("se esta luchando.", 180, yPos);
  yPos += 50;
  
   letters.text("",90, yPos);
  yPos += 50;
  
  yPos += 20;

  letters.text("#0;P#1;A#2;U#3;L#4;O #5;C#6;O#7;E#8;L#9;H#10;O#11;", 330, yPos, 1, 1, colors);
  yPos += 200;
   
  
}



