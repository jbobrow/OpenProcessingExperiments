
float timer = 0;
float angle = 0;
float x = -600;
float x2 = -100;
float x3 = -620;
float c = 580;
float d = -100;
float e = 650;
float f = 1100;
float g = -500;
float speed = 2;
float speed2 = 1.7;
float speed3 = 1.5;
float speed4 = 3;
float a = 1;
float b = 0.05;

PFont times;
PFont comic;
PImage happy;
PImage suffering;
PImage truth;

void setup()
{
  size(600,600);
  times = createFont("Times New Roman",30);
  comic = createFont("Comic Sans MS",50);
  happy = requestImage("happy.png");
  suffering = requestImage("mami.png");
  truth = requestImage("sayaka3.png");
}

void draw()
{
  timer = timer + 0.0167;
  x += speed;
  angle += 0.1;
  
  if(timer > 0 && timer <= 3)
  {
    pushMatrix();
    fill(0);
    textFont(comic);
    textSize(50);
    text("Puella Magi",170,270);
    text("Madoka Magica",120,350);
    popMatrix();
  }
  if(timer > 3 && timer <= 12)
  {
    if(happy.width > 0)
    {
      image(happy,0,0,width,height);
    }
    d += speed3;
    
    pushMatrix();
    //translate(x,520);
    fill(0);
    textFont(comic);
    textSize(30);
    //text("Cute Magical Girl anime",0,0,width,100); <--Note to Self: original line
    text("Cute Magical Girl anime", x,550);
    //textAlign(RIGHT);
    popMatrix();
    
    pushMatrix();
    fill(0);
    textFont(comic);
    textSize(30);
    text("No one truly gets hurt!", 150, d);
    popMatrix();
    
    pushMatrix();
    translate(x,250);
    scale(x/50);
    fill(0);
    textFont(comic);
    textSize(30);
    text("HAPPY",0,0,width,200);
    popMatrix();
    
    a += b;
    if(a > 2)
    {
      b = -.05;
    }
    if(a < 0.1)
    {
      b = 0.05;
    }
    pushMatrix();
    translate(350,240);
    scale(a);
    fill(0);
    textFont(comic);
    textSize(30);
    text("Friendship",0,0,width,200);
    popMatrix();
    
    pushMatrix();
    translate(220,400); //originally 100,480 and alternate is 200,480
    rotate(angle);
    fill(0);
    textFont(comic);
    textSize(30);
    text("HAPPY ENDING!",0,0,width,200);
    popMatrix();
  }
  if(timer > 12 && timer <= 24)
  {
    if(truth.width > 0)
    {
      image(truth,0,0,width,height);
    }
    
    x2 += speed2;
    c -= speed2;
    e -= speed2;
    x3 += speed2;
    f -= speed2;
    
    if(timer > 14 && timer <= 24)
    {
      pushMatrix();
      fill(0);
      textFont(times);
      textSize(30);
      //text("I'm such a fool...",20,480,width,200);
      text("Either you die a Magical Girl...", 20,20,width,200);
      popMatrix();
    }
    
    if(timer > 15 && timer <= 24)
    {
      pushMatrix();
      fill(0);
      textFont(times);
      textSize(25);
      text("...or you live long enough to see yourself become a Witch.",10,565,width,200);
      //text("DESPAIR", 440,60,width,200);
      popMatrix();
    }
    
    pushMatrix();
    fill(0);
    textFont(times);
    textSize(30);
    text("I'm such a fool...", x2, 480);
    popMatrix();
    
    pushMatrix();
    fill(0);
    textFont(times);
    textSize(30);
    text("I'm such a fool...", c, 150);
    popMatrix();
    
    pushMatrix();
    fill(0);
    textFont(times);
    textSize(30);
    text("Our own worst enemies...", 150, e);
    popMatrix();
    
    if(timer > 17 && timer <= 24)
    {
      for(int d = 120; d < 510; d = d + 45)
      {
        fill(255,0,0);
        textFont(times);
        textSize(25);
        text("THE TRUTH", 40,d);
      }
      for(int d = 120; d < 510; d = d + 45)
      {
        fill(255,0,0);
        textFont(times);
        textSize(25);
        text("THE TRUTH", 450,d); //originally x position was 480
      }

    }
    
    if(timer > 16 && timer <= 24)
    {
    a += b;
    if(a > 2)
    {
      b = -.05;
    }
    if(a < 1)
    {
      b = 0.05;
    }
    pushMatrix();
    translate(380,95); //originally 400,70
    //translate(400,60); <-- Note to Self: original translate
    scale(a);
    fill(0);
    textFont(times);
    textSize(25);
    text("DESPAIR",0,0);
    //text("DESPAIR",0,0,width,200); <-- Note to Self: original text
    popMatrix();
    
    pushMatrix();
    translate(10,540);
    scale(a);
    fill(0);
    textFont(times);
    textSize(25);
    text("SUFFERING",0,0);
    popMatrix();
    }
    
    if(timer > 18 && timer < 24)
    {
      pushMatrix();
      fill(0);
      textFont(times);
      textSize(30);
      text("I'm such a fool...", x3, 500);
      popMatrix();
      
      pushMatrix();
      fill(0);
      textFont(times);
      textSize(30);
      text("I'm such a fool...", f, 140);
      popMatrix();
    }
  }
  if(timer > 24)
  {
    if(suffering.width > 0)
    {
      image(suffering,0,0,width,height);
    }
    g += speed2;
    
    if(timer > 25)
    {
      pushMatrix();
      fill(0);
      textFont(times);
      textSize(50);
      text("NO HAPPY ENDING", 20,580);
      popMatrix();
    }
    textSize(50);
    text("Character", 400,30,width,200);
    text("Death", 440,70,width,200);
    
    pushMatrix();
    fill(0);
    textFont(times);
    textSize(50);
    text("It was all for nothing!", g, 350);
    popMatrix();
  }
  if(timer > 35)
  {
    background(0);
  }
}


