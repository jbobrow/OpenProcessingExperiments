
float timer = 0;
float angle = 0;
float x = -600;
float speed = 2;

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
  
  if(timer > 0 && timer <= 5)
  {
    pushMatrix();
    fill(0);
    textFont(comic);
    textSize(50);
    text("Puella Magi",170,270);
    text("Madoka Magica",120,350);
    popMatrix();
  }
  if(timer > 5 && timer <= 12)
  {
    if(happy.width > 0)
    {
      image(happy,0,0,width,height);
    }
    pushMatrix();
    translate(x,520);
    fill(0);
    textFont(comic);
    textSize(30);
    text("Cute Magical Girl anime",0,0,width,100);
    //textAlign(RIGHT);
    popMatrix();
    
    pushMatrix();
    translate(x,250);
    scale(x/50);
    fill(0);
    textFont(comic);
    textSize(30);
    text("HAPPY",0,0,width,200);
    popMatrix();
    
    pushMatrix();
    fill(0);
    textFont(comic);
    textSize(30);
    text("Friendship",400,240,width,200);
    popMatrix();
    
    pushMatrix();
    fill(0);
    textFont(comic);
    textSize(30);
    text("HAPPY ENDING",50,480,width,200);
    popMatrix();
  }
  if(timer > 12 && timer <= 20)
  {
    if(truth.width > 0)
    {
      image(truth,0,0,width,height);
    }
    pushMatrix();
    fill(0);
    textFont(times);
    textSize(30);
    text("I'm such a fool...",20,480,width,200);
    text("Either you die a Magical Girl...", 20,20,width,200);
    textSize(25);
    text("...or you live long enough to see yourself become a Witch.",20,550,width,200);
    text("DESPAIR", 440,60,width,200);
    popMatrix();
  }
  if(timer > 20)
  {
    if(suffering.width > 0)
    {
      image(suffering,0,0,width,height);
    }
    textSize(50);
    text("NO HAPPY ENDING", 20,550,width,200);
    text("Character", 400,50,width,200);
    text("Death", 400,100,width,200);
  }
}


