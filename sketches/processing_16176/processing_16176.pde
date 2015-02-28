
// Final Project: Menorah
// Jonathan Scheiber
// 107103145
  
import ddf.minim.*;

PFont titleFont = createFont("SansSerif", 40, true);
PFont blessingFont = createFont("SansSerif", 16, true);
PFont headerFont = createFont("SansSerif", 20, true);
PFont bodyFont = createFont("SansSerif", 12, true);

PImage bg;

Minim m;
AudioSnippet song;

class Candle
{
  int x;
  
  Candle (int xInput)
  {
    x = xInput;
  }
  
  void draw()
  {
    stroke(0);
    strokeWeight(5);
    rect(50+x, 150, 15, 50);
  }
}

Candle [] candles;

void setup()
{
  size(400, 400);
  textAlign(CENTER);
  smooth();
  
  //Load background image
  bg = loadImage("bg.jpeg");
  image(bg, 0, 0);
  
  // Load, play, and loop background music 
  m = new Minim(this);
  song = m.loadSnippet("MaozTsur.mp3");
  song.play();
  song.loop();
  
  greeting();
  blessing();
  renderCandles();
  renderMenorah();
  instructions();
}

void draw()
{
}

void renderMenorah()
{
  stroke(0);
  strokeWeight(5);
  fill(random(100, 200));
  rect(50, 200, 300, 50);
  rect(185, 250, 30, 50);
  rect(150, 300, 100, 20);
  // Shamash holder
  rect(185, 185, 30, 15);
  
  // Magen David
  noFill();
  stroke(0, 0, 255);
  strokeWeight(3);
  triangle(200, 205, 220, 235, 180, 235);
  triangle(200, 245, 220, 215, 180, 215);
}

void renderCandles()
{
  int s = 35;
  int b = 145;
  
  candles = new Candle[8];
  
  candles[0] = new Candle(0);
  candles[1] = new Candle(s);
  candles[2] = new Candle(s*2);
  candles[3] = new Candle(s*3);
  candles[4] = new Candle(s+b);
  candles[5] = new Candle(s*2+b);
  candles[6] = new Candle(s*3+b);
  candles[7] = new Candle(s*4+b);
  
  for (int i = 0; i < candles.length; i++)
  {
    fill(random(127, 255), random(127, 255), random(127, 255));
    candles[i].draw();
  }
  
  rect(192.5, 135, 15, 50); // Shamash
}

void greeting()
{
  String greeting = "Happy Chanukkah!";
  
  fill(255);
  textFont(titleFont);
  text(greeting, width/2, 40);
}

void blessing()
{
  String bless1 = "Barukh atah Adonai, Eloheinu, melekh ha'olam";
  String bless2 = "asher kidishanu b'mitz'votav v'tzivanu";
  String bless3 = "l'had'lik neir shel Chanukah. (Amen)";
  
  fill(255);
  textFont(blessingFont);
  text(bless1, width/2, 70);
  text(bless2, width/2, 90);
  text(bless3, width/2, 110);

}

void instructions()
{
  String header = "Welcome to Jon's Virtual Menorah!";
  String body1 = "Type the \"s\" key to light the shamash (helper candle).";
  String body2 = "Type the \"1\" through \"8\" keys to light each candle from right to left.";
  String body3 = "Click anywhere to blow all of the candles out.";
  
  fill(255);
  
  textFont(headerFont);
  text(header, width/2, 350);

  textFont(bodyFont);
  text(body1, width/2, 365);
  text(body2, width/2, 380);
  text(body3, width/2, 395);
}

void keyPressed()
{
  float x = 342.5;
  int y = 140;
  strokeWeight(3);
  stroke(0);
  fill(255, 160, 15);

  // Light Shamash
  if (key == 's')
  {
    ellipse(200, 125, 15, 20);
  }

  // Light First Candle  
  if (key == '1')
  {
    ellipse(x, y, 15, 20);
  }

  // Light Second Candle  
  if (key == '2')
  {
    ellipse(x-35, y, 15, 20);
  }

  // Light Third Candle
  if (key == '3')
  {
    ellipse(x-70, y, 15, 20);
  }
  
  // Light Forth Candle
  if (key == '4')
  {
    ellipse(x-105, y, 15, 20);
  }
  
  // Light Fifth Candle
  if (key == '5')
  {
    ellipse(x-180, y, 15, 20);
  }
  
  // Light Sixth Candle
  if (key == '6')
  {
    ellipse(x-215, y, 15, 20);
  }

  // Light Seventh Candle
  if (key == '7')
  {
    ellipse(x-250, y, 15, 20);
  }
  
  // Light Eigth Candle
  if (key == '8')
  {
    ellipse(x-285, y, 15, 20);
  }
  
  // Hidden Credits Screen
  if (key == 'c')
  {
    strokeWeight(3);
    fill(0, 155, 255);
    rect(25, 335, 350, 60);
    
    fill(255);
    textFont(bodyFont);

    String credits1 = "Created by Jon Scheiber for";
    String credits2 = "ISE 108, Fall 2010, Prof. Tashbook";
    String credits3 = "Intellectual property of Jon Scheiber for 1,000 years.";

    text(credits1, width/2, 355);
    text(credits2, width/2, 370);
    text(credits3, width/2, 385);
  }
}

void mouseClicked()
{
  image(bg, 0, 0);
  greeting();
  blessing();
  renderCandles();
  renderMenorah();
  instructions();
}

void stop ()
{
  song.close();
  m.stop(); // Shut down the Minim sound engine
  super.stop(); // Calls the built-in version from Processing
}

