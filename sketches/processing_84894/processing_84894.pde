
PImage donkey;
PImage donkeyTail;
float donkeyX;
float donkeyY;
int score=0;


void setup()
{
  size(400, 600);
  background(255); 
  smooth();
  donkey = loadImage("Donkey.png");
  donkeyTail = loadImage("Donkey_tail.png");
  donkeyX = width/2 - 38;
  donkeyY = height/2 - 50;
  textSize(36);
}

void draw()
{
  background (255);
  image(donkey, donkeyX, donkeyY, 75, 100); 
  image(donkeyTail, mouseX, mouseY, 9, 39);

  fill(0);
  textAlign(CENTER);

  text(score, width/2, height - 20);


  //end
  if (frameCount >= 2000)
  {
    background (255);
    text("GAME OVER", width/2, height/2);
    textSize(20);
    text("FINAL SCORE:\n" + score, width/2, height/2 + 30);
    noLoop();
  }
}

void mousePressed()
{
  if (mouseX>donkeyX && mouseX<donkeyX+75 && mouseY>donkeyY && mouseY<donkeyY+100)
  {
    score++;
    donkeyX = random(width-75);
    donkeyY = random(height-200);
  }
}



