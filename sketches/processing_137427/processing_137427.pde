
PFont Caracura;
PImage haunter;
float timer = 0;
float x = 0;
float x2 = 0;
float x3 = 0;

void setup()
{
  size(960, 600);
  Caracura = createFont("Caracura", 32);
  haunter = loadImage("haunterbackground.jpg");
}

void draw()
{
  background(255);
   x= x + 1;
  timer = timer + (1.0/30);
  
  image(haunter, 0, 0, width, height);
  textFont(Caracura);
  textAlign(CENTER, TOP);
  textSize(20);
  fill(0,255,0);
  text("BOO", 700, 350);
  
  pushMatrix();
  textSize(60);
  fill(#62048B);
  text("Haunting....", (-200 + x), 20);
  popMatrix();
  
  pushMatrix();
  rotate(PI/4.0);
  textSize(30);
  fill(0,255,0);
  text("Ghost", 400, 20);
  popMatrix();
  
  pushMatrix();
  textSize(20);
  fill(0,255,0);
  text("Phantom", 100, 200);
  popMatrix();
  
  if (timer > 35)
  {
    x2 = x2 + 1;
  }
  
  pushMatrix();
  textSize(60);
  fill(#62048B);
  text("Nightmare...", (-200 + x2), 500);
  popMatrix();
  
  pushMatrix();
  textSize(20);
  fill(0,255,0);
  text("Laughter", 800, 200);
  popMatrix();
  
  pushMatrix();
  textSize(15);
  fill(255, 0, 0);
  text("loving", 500, 300);
  popMatrix();
  
  pushMatrix();
  textSize(15);
  fill(255, 0, 0);
  text("caring", 600, 200);
  popMatrix();
  
  pushMatrix();
  textSize(15);
  fill(255, 0, 0);
  text("happy", 650, 315);
  popMatrix();
  
  if (timer > 20)
  {
    x3 = x3 + 3;
  }
  
  pushMatrix();
  textSize(30);
  fill(#62048B);
  text("Darkness...", (1100 - x3), 300);
  popMatrix();
}


