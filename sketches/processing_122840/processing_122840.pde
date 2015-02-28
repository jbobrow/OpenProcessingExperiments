
PImage bseal;
PImage brseal;
PImage wave;
PImage obutton;
PImage bbutton;
PImage whirl;
PImage fin;
PImage fish;
Fish bait;
Shark shark;
Whirl pool;
int state;

Wave[] waves = new Wave[25];
Wave[] wavesb = new Wave[25];
Button[] buttons = new Button[3];
String[] words = new String[3];
Seal[] seals = new Seal[5];
Seal seal1;
Seal seal2;

void setup()
{
  background(255);
  size(800,800);
  state = 0;
  words[0] = "Feed!";
words[1] = "Flee!";
words[2] = "...?";

// loads images
  wave = loadImage("wave.png");
  bbutton = loadImage("orangebutton.png");
  obutton = loadImage("bluebutton.png");
  bseal = loadImage("blueseal.png");
  brseal = loadImage("brownseal.png");
  whirl = loadImage("whirl.png");
  fin = loadImage("fin.png");
  fish = loadImage("fish.png");

//initalize arrays  
  for(int i=0;i<waves.length;i++){    waves[i] = new Wave (random(width),random(8*height/10));    }
  for(int i=0;i<wavesb.length;i++){    wavesb[i] = new Wave (random(width),random(8*height/10));    }
  for(int i=0;i<buttons.length;i++)    {    buttons[i] = new Button ((i+1)*width/(buttons.length+1), 9*height/10);    }
  for(int i=0;i<seals.length;i++)   {   seals[i] = new Seal(bseal,random(width),random(8*height/10),random(1),random(-.5,.5));
    }
  
  bait = new Fish(random(width),random(7*height/10));
  shark = new Shark(random(width),random(7*height/10));
  pool = new Whirl(width/2,height/2);
 // seal1 = new Seal(bseal,width/3,height/3);
 // seal2 = new Seal(brseal,width/2,height/2);

}

void draw(){
// seal1.display();
// seal2.display();
background(44,174,167);
println(state);
 for(int i=0;i<wavesb.length;i++)
  {
    wavesb[i].display();
    wavesb[i].move();
  }
 if (bait.alive == true){bait.display();}
 if (shark.alive == true){shark.display();}
 if (pool.alive == true){pool.display();}
 for(int i=0;i<seals.length;i++)
  {
    seals[i].display();
    if (state == 0)
    {
      seals[i].move();
    }
    else if (state == 1)
    {
      seals[i].hunt(bait);
      if (bait.alive==false){state=0;}
    }
    else if (state == 2)
    {
    seals[i].flee(shark);
    }
    else if (state==3)
    {
      seals[i].chaos(pool);
    }
    
   // buttons[i].rollOver();
  }
for(int i=0;i<waves.length;i++)
  {
    waves[i].display();
    waves[i].move();
  }
for(int i=0;i<buttons.length;i++)
  {
    buttons[i].display();
    buttons[i].rollOver();
    textSize(32);
    text(words[i],buttons[i].xpos-32, buttons[i].ypos+10);
  }

}

void mousePressed()
{
//state machine for mouse pressed. for some reason, for loop won't work for it.
  
if (mouseX>buttons[0].xpos-75 && mouseX<buttons[0].xpos+75)
  {
    if (mouseY>buttons[0].ypos-50 && mouseY<buttons[0].ypos+50)
    {
    state=1;
    shark.alive=false;
    pool.alive=false;
    bait.xpos=random(width);
    bait.ypos=random(7*height/10);
    bait.alive=true;
    }
  }
if (mouseX>buttons[1].xpos-75 && mouseX<buttons[1].xpos+75)
  {
    if (mouseY>buttons[1].ypos-50 && mouseY<buttons[1].ypos+50)
    {
    state=2;
    bait.alive=false;
    pool.alive=false;
    shark.xpos=random(width);
    shark.ypos=random(7*height/10);
    shark.alive=true;
    }
  }

if (mouseX>buttons[2].xpos-75 && mouseX<buttons[2].xpos+75)
  {
    if (mouseY>buttons[2].ypos-50 && mouseY<buttons[2].ypos+50)
    {
    state=3;
    bait.alive=false;
    shark.alive=false;
    pool.alive=true;
    }
  }

}
class Button{
  
  float xpos;
  float ypos;
    
  Button(float a, float b)
  {
    xpos = a;
    ypos = b;
  }
  
  void display()
  {
    imageMode(CENTER);
    image(bbutton,xpos,ypos);
  }
  
  void rollOver()
  {
  if (mouseX>xpos-75 && mouseX<xpos+75)
  {
    if (mouseY>ypos-50 && mouseY<ypos+50)
    {
    imageMode(CENTER);
    image(obutton,xpos,ypos);
    }
  }
  } 
}
class Fish{
  
  float xpos;
  float ypos;
  boolean alive;
  
  Fish(float a, float b)
  {
    xpos = a;
    ypos = b;
  }
  
  void display()
  {
    imageMode(CENTER);
    image(fish,xpos, ypos);
  }
  
}
class Seal{
  
  float xpos;
  float ypos;
  PImage img;
  float xspeed;
  float yspeed;
  
  Seal(PImage pic, float a, float b, float c, float d)
  {
    xpos = a;
    ypos = b;
    xspeed = c;
    yspeed = d;
    img = pic;
  }
  
  void display()
  {
    imageMode(CENTER);
    image(img,xpos, ypos);
  }
  
  void move()
  {
    checkPos();
    xpos=xpos+xspeed;
    ypos=ypos+yspeed;
  }
  
  void hunt(Fish p)
  {
    checkPos();
    xpos=xpos+5*xspeed;
    if (p.ypos > ypos){ypos=ypos+1;}
    if (p.ypos < ypos){ypos=ypos-1;}
    if (p.xpos == xpos && p.ypos == ypos){p.alive = false;}
    float distance = dist(xpos,ypos,p.xpos,p.ypos);
      if (distance < 20)
      {
        p.alive = false;
      } 
  }
  
  void flee(Shark p)
  {
    checkPos();
    if (p.ypos > ypos){ypos=ypos-1;}
    if (p.ypos < ypos){ypos=ypos+1;}
    if (p.xpos > xpos){xpos=xpos-1;}
    if (p.xpos < xpos){xpos=xpos+1;}
  }
  
  void chaos(Whirl p)
  {
    checkPos();
        if (p.ypos > ypos){ypos=ypos+random(5);}
    if (p.ypos < ypos){ypos=ypos-random(5);}
    if (p.xpos > xpos){xpos=xpos+random(5);}
    if (p.xpos < xpos){xpos=xpos-random(5);}
  }
  
  void checkPos()
  {
    if (xpos > width) {xpos = 0;}
    if (ypos > 8*height/10) {ypos = 0;}
    if (ypos < 0){xpos=0;ypos=8*height/10;}
  }
}
class Shark{
  
  float xpos;
  float ypos;
  boolean alive;
  
  Shark(float a, float b)
  {
    xpos = a;
    ypos = b;
  }
  
  void display()
  {
    imageMode(CENTER);
    image(fin,xpos, ypos);
  }
  
}
class Wave{
  
  float xpos;
  float ypos;
  float speed = .5;
  
  Wave(float a, float b)
  {
    xpos = a;
    ypos = b;
  }
  
  void display()
  {
    imageMode(CENTER);
    image(wave,xpos, ypos);
  }
  
  void move()
  {
    if (xpos < 0){xpos = width;}
    xpos = xpos-speed;
    ypos = ypos+(random(-speed,speed));
  }
}
class Whirl{
  
  float xpos;
  float ypos;
  boolean alive;
  
  Whirl(float a, float b)
  {
    xpos = a;
    ypos = b;
  }
  
  void display()
  {
    imageMode(CENTER);
    image(whirl,xpos, ypos);
  }
  
}


