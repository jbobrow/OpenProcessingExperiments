
import ddf.minim.*;

public player p = new player();
public int time = 7200;
public npc man = new npc(0,0);
public npc woman = new npc(100, 400);
public npc child = new npc(300, 500);
public boolean fade1 = false;
public boolean fade2 = false;
public boolean fade3 = false;
public float fadeValue = 100;

public object obj1 = new object(170, 50); // flower pot
public object obj2 = new object(140, 130); // wedding photo
public object obj3 = new object(140, 330); //watch
public object obj4 = new object(130, 530); // mirror
public object obj5 = new object(380, 520); // bathroom mirror
public object obj6 = new object(580, 420); // teddy bear
public object obj7 = new object(480, 230); // gun
public object obj8 = new object(680, 130); //beer
public object obj9 = new object(860, 210); //belt
public object obj10 = new object(980, 290); //clock
public object obj11 = new object(980, 550); //family photo

public float tempx = 980;
public float tempy = 550;

public int display = -1;
public PImage pic;
public PImage bg;
public PImage mSprite;
public PImage wSprite;
public PImage cSprite;
public PImage pSprite;

public int interact = -1;
public float life = 300;
public final int START = 0;
public final int PLAY = 1;
public int statement = START;
public int w = 1024;
public int h = 680;
public AudioPlayer player;
public AudioSample sound;
public Minim minim;

public int objNum;


void setup() {               // executed once at the begining 
  size(1024, 680, P3D);
  //pic = loadImage("bg.jpg");
  bg = loadImage("InPeaceBack.jpg");
  mSprite= loadImage("man.jpg");
  wSprite= loadImage("woman.jpg");
  cSprite= loadImage("child.jpg");
  pSprite= loadImage("player.jpg");
  minim = new Minim(this);
  player = minim.loadFile("ghost music.mp3");
  sound = minim.loadSample("scream.wav", 2048);
  frameRate(30);
}

void keyPressed()
{
  if (key == CODED){
  if(keyCode == RIGHT)
 {
   p.moveHor(2);
 } 
 if(keyCode == LEFT)
 {
   p.moveHor(-2);
 } 
 
 if(keyCode == DOWN)
 {
   p.moveVert(2);
 } 
 if(keyCode == UP)
 {
   p.moveVert(-2);
 } 

  }
}

 void keyReleased()
 {
   if(statement == START)
   {
   if(key == ENTER)
 {
   statement = PLAY;
 }
   }
   
   if(key == 'e')
 {
   if(distance(p.x,p.y, obj1.x,obj1.y) <= 25 || distance(p.x,p.y, obj2.x,obj2.y) <= 25 || distance(p.x,p.y, obj3.x,obj3.y) <= 25 || distance(p.x,p.y, obj4.x,obj4.y) <= 25 || 
distance(p.x,p.y, obj5.x,obj5.y) <= 25 || distance(p.x,p.y, obj6.x,obj6.y) <= 25 || distance(p.x,p.y, obj7.x,obj7.y) <= 25 || distance(p.x,p.y, obj8.x,obj8.y) <= 25 || 
distance(p.x,p.y, obj9.x,obj9.y) <= 25 || distance(p.x,p.y, obj10.x,obj10.y) <= 25 || distance(p.x,p.y, obj11.x,obj11.y) <= 25 )
{
     display = - display;     
 }
 else{
  display = -1; 
 }

}

 }

void draw() { 
  
  
  switch(statement)
  {
    case 1:
    player.play();
    
     //time intervals for moving characters
 
 if(time == 7200) //start
 {
   man.x = 260;
   man.y = 100;
   man.goX = 260;
   man.goY = 600;
 }
 
 if(time == 7200) //start
 {
   woman.x = 850;
   woman.y = 300;
   woman.goX = 850;
   woman.goY = 300;
 }
 
 if(time == 7200) //start
 {
   child.x = 660;
   child.y = 100;
   child.goX = 660;
   child.goY = 600;
 }
 
 //at 1 minute
 
 if(time == 5400) 
 {
   man.x = 360;
   man.y = 500;
   man.isScared = false;
   man.goX = 360;
   man.goY = 650;
 }
 
 if(time == 5400) 
 {
   woman.x = 850;
   woman.y = 300;
   woman.isScared = false;
   woman.goX = 850;
   woman.goY = 300;
 }
 
 if(time == 5400) 
 {
   child.x = 740;
   child.y = 640;
   child.isScared = false;
   child.goX = 300;
   child.goY = 640;
 }
 
 //after 2 minutes
 if(time == 3600) 
 {
   man.x = 560;
   man.y = 220;
   man.isScared = false;
   man.goX = 560;
   man.goY = 40;
 }
 
 if(time == 3600) 
 {
   woman.x = 850;
   woman.y = 300;
   woman.isScared = false;
   woman.goX = 850;
   woman.goY = 300;
 }
 
 if(time == 3600) 
 {
   child.x = 520;
   child.y = 420;
   child.isScared = false;
   child.goX = 520;
   child.goY = 420;
 }
 
 //after 3 minutes
 if(time == 1800) 
 {
   man.x = 110;
   man.y = 200;
   man.isScared = false;
   man.goX = 110;
   man.goY = 200;
 }
 
 if(time == 1800) 
 {
   woman.x = 400;
   woman.y = 220;
   woman.isScared = false;
   woman.goX = 400;
   woman.goY = 220;
 }
 
 if(time == 1800) 
 {
   child.x = 520;
   child.y = 420;
   child.isScared = false;
   child.goX = 520;
   child.goY = 420;
 }
 
 //after 4 minutes
 if(time <= 0)
 {
   fade1 = true;
   life -= .001;
 }
 
 
  time--;
  //println(time);
 background(255); // draw background here lol
 image(bg, 0, 0);
 image(pSprite, p.x, p.y);
 //fill(100);
 //ellipse(p.x,p.y,15,15);
 image(mSprite, man.x, man.y);
 //fill(20,50,100);
 //ellipse(man.x, man.y, 15, 15);
 image(wSprite, woman.x, woman.y);
 //fill(20,0,18);
 //ellipse(woman.x, woman.y, 15, 15);
 image(cSprite, child.x, child.y);
 //fill(0,50,10);
 //ellipse(child.x, child.y, 15, 15);
 
 //fill(100,0,0);
 //ellipse(tempx, tempy, 30, 30);
 
 if(keyPressed) 
 {
   
   if(key == 'd')
 {
   p.moveHor(2);
 } 
 if(key == 'a')
 {
   p.moveHor(-2);
 } 
 
 if(key == 's')
 {
   p.moveVert(2);
 } 
 if(key == 'w')
 {
   p.moveVert(-2);
 }
   
   if( key == ENTER)
   {
     life  -= 30;
   fadeValue += 35;
   //println (life);
   sound.trigger();
   }
   if(key == ENTER && distance(p.x, p.y, man.x, man.y) <= 100) // scaring folks
 {
   //if (man in thisroom) etc
     man.isScared = true;//setGo(500, man.y);
  } 
  
  if(key == ENTER && distance(p.x, p.y, woman.x, woman.y) <= 100) // scaring folks
 {
   woman.isScared = true;//setGo(500, woman.y);
   
 }
 
 if(key == ENTER && distance(p.x, p.y, child.x, child.y) <= 100) // scaring folks
 {
   child.isScared = true;//setGo(child.x, 100);
;
 }
 
  /*if(key == 'e')
 {
   if(distance(p.x,p.y, obj1.x,obj1.y) <= 25 || distance(p.x,p.y, obj2.x,obj2.y) <= 25 || distance(p.x,p.y, obj3.x,obj3.y) <= 25 || distance(p.x,p.y, obj4.x,obj4.y) <= 25 || 
distance(p.x,p.y, obj5.x,obj5.y) <= 25 || distance(p.x,p.y, obj6.x,obj6.y) <= 25 || distance(p.x,p.y, obj7.x,obj7.y) <= 25 || distance(p.x,p.y, obj8.x,obj8.y) <= 25 || 
distance(p.x,p.y, obj9.x,obj9.y) <= 25 || distance(p.x,p.y, obj10.x,obj10.y) <= 25 || distance(p.x,p.y, obj11.x,obj11.y) <= 25 )
{
     display = - display;     
 }
 else{
  display = -1; 
 }

 }*/
 }
 

 

 
 
 //fading/////////////////////////
 if(time > 0)
 {
 if(distance(p.x, p.y, man.x, man.y) <= 100 || distance(p.x, p.y, woman.x, woman.y) <= 100 || distance(p.x, p.y, child.x, child.y ) <= 100)
 {
   fade1 = true;
   
 }
 else
 {
   fade1 = false;
 }
 }
 
 if(fade1 == false)
 {
   if (fadeValue >= 10) // fading
   {
     fadeValue -= 1;
     
   }
   if( fadeValue < 10)
   {
     fadeValue = 10; 
   }
   
   if(life <= 300) // regen health
   {
     life++;
   }
   
   if(life > 300)
   {
      life = 300; 
   }
 }
 if (fade1 == true)
 {
   if(fadeValue <= 255)
  {
     fadeValue += 1;
  } 
  if(fadeValue > 255)
  {
     fadeValue = 255; 
  }
  
  life--;
 }
 
 if(life <= 0)
 {
   statement = START;
 }
/*

object obj1 = new object(170, 50); // flower pot
object obj2 = new object(140, 130); // wedding photo
object obj3 = new object(140, 330); //watch
object obj4 = new object(130, 530); // mirror
object obj5 = new object(380, 520); // bathroom mirror
object obj6 = new object(580, 420); // teddy bear
object obj7 = new object(480, 230); // gun
object obj8 = new object(680, 130); //beer
object obj9 = new object(860, 210); //belt
object obj10 = new object(980, 290); //clock
object obj11 = new object(980, 550); //family photo
*/
// if by an object

if(distance(p.x,p.y, obj1.x,obj1.y) <= 25)
{
  if(objNum != 1){
  pic = loadImage("Flashback4.jpg");
  }
  objNum = 1;
}

if(distance(p.x,p.y, obj2.x,obj2.y) <= 25)
{
  if(objNum != 2){
  pic = loadImage("Flashback10.jpg");
  }
  objNum = 2;
}

if(distance(p.x,p.y, obj3.x,obj3.y) <= 25)
{if(objNum != 3){
  pic = loadImage("Flashback3.jpg");
}
objNum = 3;
}

if(distance(p.x,p.y, obj4.x,obj4.y) <= 25)
{
  if(objNum != 4){
  pic = loadImage("Flashback1.jpg");
  }
  objNum = 4;
}

if(distance(p.x,p.y, obj5.x,obj5.y) <= 25)
{
  if(objNum != 5){
  pic = loadImage("Flashback2.jpg");
  }
  objNum = 5;
}

if(distance(p.x,p.y, obj6.x,obj6.y) <= 25)
{
  if(objNum != 6){
  pic = loadImage("FLashback6.jpg");
  }
  objNum = 6;
}

if(distance(p.x,p.y, obj7.x,obj7.y) <= 25)
{
  if(objNum != 7){
  pic = loadImage("Flashback5.jpg");
  }
  objNum = 7;
}

if(distance(p.x,p.y, obj8.x,obj8.y) <= 25)
{
  if(objNum != 8){
  pic = loadImage("Flashback9.jpg");
  }
  objNum = 8;
}

if(distance(p.x,p.y, obj9.x,obj9.y) <= 25)
{
  if(objNum != 9){
  pic = loadImage("Flashback8.jpg");
  }
  objNum = 9;
}

if(distance(p.x,p.y, obj10.x,obj10.y) <= 25)
{
  if(objNum != 10){
  pic = loadImage("Flashback11.jpg");
  }
  objNum = 10;
}

if(distance(p.x,p.y, obj11.x,obj11.y) <= 25)
{if(objNum != 11){
  pic = loadImage("Flashback7.jpg");
}
objNum = 11;
}

if(distance(p.x,p.y, obj1.x,obj1.y) <= 25 || distance(p.x,p.y, obj2.x,obj2.y) <= 25 || distance(p.x,p.y, obj3.x,obj3.y) <= 25 || distance(p.x,p.y, obj4.x,obj4.y) <= 25 || 
distance(p.x,p.y, obj5.x,obj5.y) <= 25 || distance(p.x,p.y, obj6.x,obj6.y) <= 25 || distance(p.x,p.y, obj7.x,obj7.y) <= 25 || distance(p.x,p.y, obj8.x,obj8.y) <= 25 || 
distance(p.x,p.y, obj9.x,obj9.y) <= 25 || distance(p.x,p.y, obj10.x,obj10.y) <= 25 || distance(p.x,p.y, obj11.x,obj11.y) <= 25 )
{
  interact = 1; 
}
else
{
  interact = -1;
}

 
 color c1 = color(0, fadeValue);
 fill(c1);
 noStroke();
 rect(0, 0, w, h);
 
 if(interact == 1)
 {
   textMode(SCREEN);
   fill(255);
  text(" Press E to interact", 500, 650);
  //println(interact);
 }
 //if NPCs arrive at safe zone, they are not scared any more/////
 if(man.goX == man.x && man.goY == man.y)
 {
   man.isScared = false;
 }
 if(woman.goX == woman.x && woman.goY == woman.y)
 {
   woman.isScared = false;
 }
 if(child.goX == child.x && child.goY == child.y)
 {
   child.isScared = false;
 }
 
 //if NPCs are scared, move them
 if(man.isScared == true)
 {
  go(man);
 }
 if(woman.isScared == true)
 {
  go(woman);
 }
 if(child.isScared == true)
 {
  go(child);
 }
  //image(pic, 600, 405); 
  if(display == 1)
  {
     image(pic, 0, 0); 
  }
  
  break; /////////////////////////////////////////////////////////////////////////////////////////////////////
  
  case 0:
  //reset EVERYTHING
 // player.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();
  time = 7200;
  life = 300;
  fade1 = false;
  p.x = 50; p.y = 620;
  fadeValue = 255;
  pic = loadImage("Title.jpg");
  image(pic, 0, 0);
  /*if(keyPressed) 
 {
   if(key == ENTER)
 {
   statement = PLAY;
 }
 }*/
  break;
  }
 }
 
 float distance(float x1, float y1, float x2, float y2)
 {
   return sqrt((x1-x2)*(x1-x2) + (y1-y2)*(y1-y2));
 }
 
  void go(npc a)
  {
    if(a.x <= a.goX)
    {
      a.x += 3;
    }
    
    if(a.x >= a.goX)
    {
      a.x -=3;
    }
    
    if(a.y <= a.goY)
    {
      a.y += 3;
    }
    
    if(a.y >= a.goY)
    {
      a.y -=3;
    }
  }
  
  void stop()
{
  // the AudioPlayer you got from Minim.loadFile()
  player.close();
  sound.close();
  // the AudioInput you got from Minim.getLineIn()
  minim.stop();
 
  // this calls the stop method that 
  // you are overriding by defining your own
  // it must be called so that your application 
  // can do all the cleanup it would normally do
  super.stop();
}

