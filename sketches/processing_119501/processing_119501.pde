
PFont times;
PFont comic;
PFont newFont;
float angle = 0;
float x = 0;
float speed = 1;
float timer = 0;
float s = 0;
float e = 0.3;
PImage gamer;
PImage hate;

void setup()
{
  size(700,700);
  times = createFont("Times New Roman", 40);
  comic = createFont("Comic Sans MS", 64);
  newFont = createFont("FeliX", 40);
  gamer = requestImage("happygamer.jpg");
  hate = requestImage("hatred.jpg");
}

void draw()
{
  timer += 0.0167;
  
  if (gamer.width > 0)
  {
   image(gamer, 0, 0, width, height);
  }
  
  angle += 0.1;
  x += speed;
  fill(#037DFC);
  textSize(50);
  textFont(times);
  
  if(timer > 0 && timer < 5)
  {
    //text("Gamer", 200, 50);
    text("Is all that you see.", 150, 90);
    text("It keeps all the", 140, 130);
    text("hate", 380, 130);
    text("inside of me. When my", 140, 170);
    text("anger tries to get out of its", 140, 210);
    text("cage, games help me to", 140, 250);
    text("release", 190, 290);
    text("all my", 160, 330);
    text("rage.", 170, 370);
    
    pushMatrix();
    translate(200, 50);
    rotate(angle);
    fill(136, 99, 99);
    textFont(newFont);
    text("Gamer", 0, 0);
    popMatrix();
  }
  
  if (timer > 5)
  {
    {
      image(hate, 0, 0, width, height);
    }
    
    text("Gamer", 200, 50);
    text("Is all that you see.", 150, 90);
    text("It keeps all the", 140, 130);
    //text("hate", 380, 130);
    text("inside of me. When my", 140, 170);
    text("anger tries to get out of its", 140, 210);
    text("cage, games help me to", 140, 250);
    text("release", 170, 290);
    text("all my", 160, 330);
    text("rage.", 170, 370);
    
    pushMatrix();
    translate(380, 90);
    scale(s,s);
    textFont(comic);
    //textAlign(CENTER);
    fill(255, 0, 0);
    text("HATE", 0, 0, width, 200);
    //textAlign(LEFT);
    popMatrix();
     s += e;
       if (s > 2)
       {
        e = - 0.3;
       }
       if (s < 0.5)
       {
         e = 0.3;
       }
  }
}


