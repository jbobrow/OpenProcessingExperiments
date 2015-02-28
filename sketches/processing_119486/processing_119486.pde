
float timer = 0;
PImage dark;
PImage husky;
PFont ariel;
PFont times;
float angle = 0;
float angleneg = 0;
float x = 0;
float xneg = 0;
float speed = 1;

void setup()
{
  size (500,500);
  ariel = createFont("Ariel", 24);
  times = createFont("Blackoak Std", 32);
  dark = requestImage("Cloaked.jpg");
  husky = requestImage("Cute-Husky-Puppy-Pictures.jpg");
}

void draw()
{
  timer += 0.05;
  if (timer > 16)
  {
    timer = 0;
  }
  if (timer < 5)
  {
    if (dark.width > 0)
    {
      image(dark, 0 ,0, width, height);
      filter(BLUR, 3);
    }
    x += 2;
    if (timer > 2)
    {
    fill(255,255,255);
    textSize(10);
    text("Quiet", 265,95, width, 200);
    }
    
    if (timer > 4)
    {
    fill(0);
    textSize(20);
    text("Uninterested", 450,250, width, 200);
    }
    
    if (timer > 3)
    {
    fill(0);
    textFont(ariel);
    text("Dark", 250,350, width, 200);
    }
    
    fill(0);
    textSize(7);
    text("Distant", 25,25, width, 200); 
 
  pushMatrix();
  translate(x, 450);
  textFont(ariel);
  textAlign(CENTER);
  fill(0);
  text("Brooding", 0, 0, width, 0200);
  textAlign(LEFT);
  popMatrix();
  }
  if (timer > 7)
  {
    if (husky.width > 0)
    {
      image(husky, 0, 0, width, height);
    }
    xneg -= 2;
  angle += 0.1;
  angleneg -= 0.1;
  x += speed;
  fill(0,0,255);
  textSize(10);
  textFont(times);
  pushMatrix();
  translate(400, 400);
  rotate(angle);
  text("Playful", 0,0);
  popMatrix();
  
  fill(255,0,0);
  textSize(10);
  textFont(times);
  pushMatrix();
  translate(100, 100);
  rotate(angleneg);
  text("Cuddly", 0,0);
  popMatrix();
  
  if (timer > 10)
  {
  pushMatrix();
  translate(x, 200);
  scale(x / 300);
  textFont(times);
  textAlign(LEFT);
  fill(255, 255, 0);
  text("Nice", 0, 0, width, 200);
  textAlign(LEFT);
  popMatrix();
  }
   if (timer > 10)
  {
  pushMatrix();
  translate(-x, 200);
  scale(-x / 300);
  textFont(times);
  textAlign(RIGHT);
  fill(0, 255, 255);
  text("Adorable", 0, 0, width, 200);
  textAlign(RIGHT);
  popMatrix();
  }
  fill(255,0,0);
  text("Loveable",150,350,width,200);
  }
}


