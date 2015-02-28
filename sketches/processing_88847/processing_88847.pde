
PImage dom;
PImage hat;
PImage eri;
float score;
int chop;
int a;
float b;
int x;

void setup()
{
size(800,600);
a = 0;
b = 0;
x = 0;
chop = 0;
score = 0;
dom = loadImage("Dominick Still.png");
hat = loadImage("hatchet.png");
eri = loadImage("Erick Still.png");
}

void draw()
{
  
  background(255);
  if(score == 0)
  {
    text("USE A and D to move. Space bar to CHOP CHOP",10,200);
  }
  if(keyPressed && key =='a')
  {
    x = x - 8;
  }
  if(keyPressed && key =='d')
  {
    if(x < 440 || score > 790)
    {
    x = x + 8;
    }
  }
  
  if(score < 800){
  image(dom, 600, 300);
  }
  
  image(eri, 0+x, 300);
    if(keyPressed && key ==' ')
  {
    b = 10;
    a = 10;
    textSize(32);
    fill(0, 102, 153);
text("CHOP",20+x,300); 
  }
else
{
    b = 0;
    a = 0;
    chop = 0;
}

fill(225);
rect(0,0,800-score,100);
image(hat, 110+a+x, 380+b);
textSize(32);
    fill(0, 102, 153);
     if(score < 800){
text("DOMINICK HEALTH",300,50);
     }
     else{text("You killed your bro.",200,50);
   }
}

void keyReleased()
{
 if(key == ' ' && x > 400)
 {
   score = score + 10;
 }
}


