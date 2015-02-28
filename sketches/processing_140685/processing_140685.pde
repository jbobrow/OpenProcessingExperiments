
float timer = 0;
float x = 0;
float y = 0;
float x2 = 0;
float y2 = 0;
PFont arial;
PFont chiller;
PFont times;
PFont castellar;
PFont forte;

PImage sister;

void setup()
{
  size(500,500);
  arial = createFont("Arial", 50);
  chiller = createFont("Chiller", 50);
  times = createFont("Times", 50);
  castellar = createFont("Castellar", 50);
  forte = createFont("Forte", 50);
  sister = requestImage("sister.jpg");
}

void draw()
{
  image(sister, 0, 0, width, height);
  
  frameRate = 1/30;
  timer = timer + frameRate;
  x = x + 1;
  y = y + 1;
  x2 = x2 + 2;
  y2 = y2 + 2;
  
  fill(#E80707);
  textFont(chiller);
  textAlign(CENTER);
  text("Shy", (680 - x), 50);
  text("Honest", (0 + x), 250);
  text("Reliable", (500 - y), 356);
  
  fill(#2E29E3);
  textFont(arial);
  text("Friendly", (750 - x2), 110);
  text("Hopeful", (-100 + x2), 400);
  text("Caring", (600 - y), 300);
  
  fill(#14DB1F);
  textFont(forte);
  text("Courageous", 350, (-200 + y2));
  text("Sweet", 100, (-300 + y));
  text("Trustworthy", 225, (700 - y2));
  
  fill(#E8D821);
  textFont(castellar);
  text("Loud", (-400 + x2), 400);
  text("Energetic", 350, (900 - y));
  text("Playful", (-300 + x), 250);
  
  fill(#D321E8);
  textFont(times);
  text("Loyal", (900 - x), 250);
  text("Random", (-500 + x2), 450);
  
  
  
  
}


