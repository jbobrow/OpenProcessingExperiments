
float temp;//get me coffiee
int col;
int row;
boolean needNew = true;
boolean lost = false;
PImage picture;
int score;

void setup()
{
 size(640,600);
 /* if(lost == true)
  {
   picture=loadImage("picture.png");
  }*/
}

void draw()
{
 fill(255,255,255);
 rect(0,0,80,80);
 rect(80,0,80,80);
 rect(160,0,80,80);
 rect(240,0,80,80);
 rect(320,0,80,80);
 rect(400,0,80,80);
 rect(480,0,80,80);
 rect(560,0,80,80);
      rect(0,80,80,80);
 rect(80,80,80,80);
 rect(160,80,80,80);
 rect(240,80,80,80);
 rect(320,80,80,80);
 rect(400,80,80,80);
 rect(480,80,80,80);
 rect(560,80,80,80);
       rect(0,160,80,80);
 rect(80,160,80,80);
 rect(160,160,80,80);
 rect(240,160,80,80);
 rect(320,160,80,80);
 rect(400,160,80,80);
 rect(480,160,80,80);
 rect(560,160,80,80);
       rect(0,240,80,80);
 rect(80,240,80,80);
 rect(160,240,80,80);
 rect(240,240,80,80);
 rect(320,240,80,80);
 rect(400,240,80,80);
 rect(480,240,80,80);
 rect(560,240,80,80);
       rect(0,320,80,80);
 rect(80,320,80,80);
 rect(160,320,80,80);
 rect(240,320,80,80);
 rect(320,320,80,80);
 rect(400,320,80,80);
 rect(480,320,80,80);
 rect(560,320,80,80);
       rect(0,400,80,80);
 rect(80,400,80,80);
 rect(160,400,80,80);
 rect(240,400,80,80);
 rect(320,400,80,80);
 rect(400,400,80,80);
 rect(480,400,80,80);
 rect(560,400,80,80);
        rect(0,480,80,80);
 rect(80,480,80,80);
 rect(160,480,80,80);
 rect(240,480,80,80);
 rect(320,480,80,80);
 rect(400,480,80,80);
 rect(480,480,80,80);
 rect(560,480,80,80);
 
if (needNew == true)
  {
    temp = random(0,7);
    row = int(temp);
    temp = random(0,8);
    col = int(temp);
    needNew = false;
  }
  fill(240,0,0);
  rect(col*80,row*80,80,80);
   /* if(lost == true)
  {
   image(picture,0,0);
  }*/
 
  
}

void mouseReleased()
{
  if((mouseY >= row*80 && mouseY <= row*80+80)&&(mouseX >= col*80 && mouseX <= col*80+80))
  {
    needNew = true;//gaterade
  }
/* else
  {
    lost = true;
  }*/
}


