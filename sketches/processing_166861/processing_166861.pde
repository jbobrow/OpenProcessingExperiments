
int xpos;
int ypos;
int xpos_bomb;
int ypos_bomb;
boolean xpos_able = true;
boolean xposm_able = true;
boolean ypos_able = true;
boolean yposm_able = true;
boolean linksschaun = false;
int highscore;
int score = 0;
int x =50,y = 50;

void setup() {  //setup function called initially, only once
 size(400,400);
  xpos = 200;
  ypos = 200;
  xpos_bomb = random(80,320);
  ypos_bomb = random(80,320);
 MarioImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/mario.png");
 PouncerImage = loadImage("http://minnameier.com/content/03-teaching/04-resources/pouncer.png");
 bg = loadImage("http://minnameier.com/content/03-teaching/04-resources/background1.jpg");
 bomb = loadImage("http://minnameier.com/content/03-teaching/04-resources/apple.png");
 
}
 
void draw() {  //draw function loops
background(bg);

textSize(32);
fill(50);
text(score, 50, 50, 200, 200);

textSize(32);
fill(50);
text("Highscore:"+ highscore, 170, 50, 200, 200);

// use this for constat velocity

float speed = -3;

xm= x;
ym = y;

float lenght = sqrt((xpos-xm)*(xpos-xm)+(ypos-ym)*(ypos-ym));
float xx= ((xpos-xm)/lenght);
float yy= ((ypos-ym)/lenght);

x = x + xx*(1.5 + (score * 0.1));
y = y + yy*(1.5 + (score * 0.1));

    //use this for speed reducing after enemy comes closer to the player
//x = x + (xpos-x)/100 ;
//y= y + (ypos-y)/100 ;

image(PouncerImage,x,y);

 if (keyPressed) {
 if(xpos_able){
    if (key == 'd' || key == 'D') {
    xpos += 3 + (score * 0.2);
    linksschaun = false;
     }
    }
  } 
   if (keyPressed) {
   if(xposm_able){
    if (key == 'a' || key == 'A') {
    xpos -= 3  + (score * 0.2);
     linksschaun = true;
    }
    }
  } 
   if (keyPressed) {
   if(ypos_able){
    if (key == 'w' || key == 'W') {
    ypos -= 3 + (score * 0.2);
    }
    }
  } 
   if (keyPressed) {
   if(yposm_able){
    if (key == 's' || key == 'S') {
    ypos += 3 + (score * 0.2);
    }
  } 
  }
 
 if(linksschaun)
 {
   pushMatrix();
  scale(-1,1);
   image(MarioImage,-xpos-30,ypos,32,32);
   popMatrix(); 
  }
  else
  {
  image(MarioImage,xpos,ypos,32,32);
  }
  
KeepPlayerInWindow() ;
  
  image(bomb,xpos_bomb,ypos_bomb,20,20);
  
  // collision
  boolean b;
  if((xpos-xpos_bomb)<10 && (xpos-xpos_bomb)>-10)
  {
  if((ypos-ypos_bomb)<20 && (ypos-ypos_bomb)>-20)
  {
  b = true;
   xpos_bomb = random(80,320);
  ypos_bomb = random(80,320);
  score++;
  }
  
   if((xpos-xpos_bomb)<10 && (xpos-xpos_bomb)>-10 && !b)
  {
  if((ypos-ypos_bomb)<20 && (ypos-ypos_bomb)>-20)
  {
 xpos_bomb = random(80,320);
  ypos_bomb = random(80,320);
  score++;
  }
}
}

  // collision
  boolean bb;
  if(((x-xpos)<16 && (x-xpos)>-20)&& ((y-ypos)<20 && (y-ypos)>-20))
  {
 
  if (score > highscore)
  {
  highscore = score;
  }
  score = 0;
  x = 0;
  y = 0;    
    }
}



void KeepPlayerInWindow() {

     if(xpos > 327){
  xpos_able = false;
  }
  else
  {
  xpos_able = true;
  }
    if(xpos < 28){
  xposm_able = false;
  }
  else
  {
  xposm_able = true;
  }
    if(ypos > 322){
  yposm_able = false;
  }
  else
  {
  yposm_able = true;
  }
     if(ypos < 28){
  ypos_able = false;
  }
  else
  {
  ypos_able = true;
  }
}
