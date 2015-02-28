
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
size(500,387);
a = 0;
b = 0;
x = 0;
chop = 0;
score = 0;
dom = loadImage("http://25.media.tumblr.com/cb2d76e0d5497892cc8d31199456742c/tumblr_mc2q4bM47n1qhfoc0o2_r1_250.png");
hat = loadImage("http://24.media.tumblr.com/1ed500041c7629b828e415b4e6b97e38/tumblr_mc2q4bM47n1qhfoc0o4_r1_250.png");
eri = loadImage("http://24.media.tumblr.com/13f387d72a6003ad9f67304af356c8d4/tumblr_mc2q4bM47n1qhfoc0o3_r1_250.png");
}

void draw()
{
  
  background(255);
  if(score == 0)
  {
    text("USE A and D to move. Space bar to CHOP CHOP",10,150);
  }
  if(keyPressed && key =='a')
  {
    x = x - 8;
  }
  if(keyPressed && key =='d')
  {
    if(x < 140 || score > 490)
    {
    x = x + 8;
    }
  }
  
  if(score < 500)
  {
  image(dom, 300, 150);
  }
  
  image(eri, 0+x, 150);
    if(keyPressed && key ==' ')
  {
    b = 10;
    a = 10;
    fill(0, 102, 153);
text("CHOP",20+x,130); 
  }
else
{
    b = 0;
    a = 0;
    chop = 0;
}

fill(225);
rect(0,0,500-score,100);
image(hat, 110+a+x, 230+b);
    fill(0, 102, 153);
     if(score < 500){
text("DOMINICK HEALTH",100,50);
     }
     else{text("You killed your bro.",100,50);
   }
}

void keyReleased()
{
 if(key == ' ' && x > 100)
 {
   score = score + 10;
 }
}

