
/*
As far as I can find, Anitya Bhavana translates into something
like "a meditation on impermanence".

The text was given to me by my friend and yoga instructor, Elizabeth.  

The Purisa font comes from the Thai Linux Working Group:
http://www.wazu.jp/gallery/Fonts_Thai.html

Anitya Bhavana (The Transitory Nature of existence)
 
 What was in the morning is not at midday.
 What was at midday is not in the afternoon.
 What was in the afternoon is not at night.
 What was at night is not at midnight.
 For all things are tranisitory.
 Our body, which is the cause of our human effort and suffering,
 is as transitory as the scattering clouds.
 All our objects of pleasure are changing.
 Wealth is as transitory as a wave.
 Youth like a cotton particle blown off in a whirlwind, 
 and opportunities like the fleeting dreams.
 So why should I be attached to anything,
 when nothing is permanent and everything is changeful?
 */

float x;
float xSpeed = 0.09;
int wordI;
String[] words;

float hueX = 130;
float hueXSpeed = 0.03;

void setup() {
  size(700, 350);
  background(255);  
  noStroke();
  fill(0);
  smooth();
  frameRate(30);
  colorMode(HSB);

  x = -1;
  wordI = 0;
  words = loadStrings("anitya-bhavana.txt");

  textFont(loadFont("Purisa-Bold-35.vlw"));
  textAlign(CENTER, CENTER);
}

void draw() {
  background(hueX, 100, 255);
  hueX = (hueX + hueXSpeed) % 255;

  float wordX = map(pow(x, 5), -1, 1, width, 0);
  float wordY = height * 0.5; //map(pow(x, 2), 0, 1, 0, height);
  float wordAlpha = map(pow(x, 2), 0, 1, 255, 0); 

  fill(0, wordAlpha);
  text(words[wordI], wordX, wordY);

  x += xSpeed;

  if (x > 1) {
    x = -1;
    wordI = (wordI + 1) % words.length;
  }
}

