
float timer = 0;

void setup()
{
  size(500,500, P3D);
}

void draw()
{
  background(0);
  timer = timer + 1.0 / 30.0;
  if (timer < 8)
  {
    textSize(32);
    textAlign(CENTER);
    fill(0, 160, 155, 155);
    text("I didn't want to wake up...", 10, 10, width, height);
    text("I didn't want to wake up...", 13, 13, width, height);
  }
  if (timer > 8 && timer < 17)
  {
    String s = "I was having a much better time sleeping.";
    textSize(32);
    fill(0, 160, 155, 155);
    text(s, 10, 10, 450, 500);
    text(s, 12, 12, 450, 500);
    text(s, 13, 13, 450, 500);
  }
  if (timer > 17 && timer < 19)
  {
    textSize(32);
    textAlign(CENTER);
    text("and", width / 2, height / 2);
  }
  if (timer > 19 && timer < 21)
  {
    textSize(42);
    textAlign(CENTER);
    text("that's", width / 2, height / 2);
  }
  if (timer > 21 && timer < 23)
  {
    textSize(72);
    textAlign(CENTER);
    text("just", width / 2, height / 2);
  }
  if (timer > 23 && timer < 28)
  {
    textSize(100);
    textAlign(CENTER);
    fill(255);
    text("sad.", width / 2, height / 2);
  }
  if (timer > 28 && timer < 34)
  {
    String n = "It was like a reverse nightmare,";
    textSize(32);
    fill(255);
    text(n, 10, 10, 450, 450);
  }
  if (timer > 34 && timer < 39)
  {
    String l = "like when you wake up from a nightmare";
    textSize(32);
    fill(255);
    text(l, 10, 10, 450, 450);
  }
  if (timer > 39 && timer < 40)
  {    
    textSize(32);
    textAlign(CENTER);
    fill(255);
    text("you're", width / 2, height / 2);
  }
  if (timer > 40 && timer < 42)
  {
    textSize(42);
    textAlign(CENTER);
    text("so", width / 2, height / 2);
  }
  if (timer > 42 && timer < 46)
  {
    textSize(100);
    textAlign(CENTER);
    text("relieved.", width / 2, height / 2);
  }
  if (timer > 46 && timer < 50)
  {
    String i = "I woke up into a nightmare.";
    textSize(32);
    fill(255);
    text(i, 10, 10, 450, 450);
  }
  if (timer > 50)
  {
    timer = 0;
  }   
}


