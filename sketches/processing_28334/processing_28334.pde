
//The wizard is controlled with the    'w'
//                                 'a' 's' 'd'  keys

//His RainbowLazer is fired with thw    'k'  key
//Power-up gained when at 20 points
//Getting hit by a zombie will take a health point


Wolf wolf;
BM1 bm1, bm2, bm3, bm4;
PImage PU;
PImage ImageBM1;
PImage ImageBM1XP;
PImage ImageBM1D;
PImage beast;
PImage BG;
PFont CH;
boolean firing = false;
boolean pUp = false;
boolean pActivated = false;
float countdown = 0;
float Pcountdown = 45;
int score = 0;
int health = 5;
 
void setup(){
   
  CH = loadFont ("CorsivaHebrew-48.vlw");
  size(800,800);
  wolf= new Wolf(100,100);
  
  bm1= new BM1 (650,450);
  bm2= new BM1 (500,420);
  bm3= new BM1 (700,400);
  bm4= new BM1 (800,430);
 
  //}
  colorMode(HSB,360,100,100);
  beast = loadImage("WIZ.png");
  PU = loadImage("PU.png");
  ImageBM1= loadImage("ImageBM1.png");
  ImageBM1XP= loadImage("ImageBM1XP.png");
  ImageBM1D= loadImage("ImageBM1D.png");
  BG= loadImage("BG.png");
  frameRate(45);
 fill(225,100,100);
  
 
  
}
 
void draw(){

  background(50);
  image(BG,0,0,800,800);
  textFont(CH);
  fill(354,98,98);
  text("SCORE",500,45);
  text(score,680,45);
  
  for(int i=0; i<health;i++)
  {
    ellipse(50+i*30,50,20,20);
  }
  wolf.display();
  wolf.move();
  bm1.display();
  bm1.move();
    if (frameCount>=105){
    bm2.display();
    bm2.move();
   }
     if (frameCount>=160){
       bm3.display();
       bm3.move();
     }
   if (frameCount>=204){
       bm4.display();
       bm4.move();
   }
  
  if (score%20==0 && score!=0){
    pUp=true;
  }
  
  if (pUp==true)
  {
    wolf.power(); 
  }
   
   if(pActivated==true)
    {
      if (Pcountdown > 0){
          Pcountdown--;
          
      }
      else{
            Pcountdown=0;
            pActivated = false;
            frameRate(45);
      }
    }

  if (countdown > 0){
    countdown--;
  }
  else 
  {
     countdown=0;
     firing=false;
  }
   
  if(firing==true)
  {
     wolf.rainbow(bm1.getXpos(),bm1.getYPos(),bm2.getXpos(),bm2.getYPos(),bm3.getXpos(),bm3.getYPos(),bm4.getXpos(),bm4.getYPos());
     
  }

  if (wolf.x>600 && wolf.x<800 && wolf.y>150 && wolf.y<200){

    if(pUp==true)
    {
       pActivated = true;
       pUp = false;
       frameRate(5);
    }
 }
 
}


void keyPressed(){
  if (key=='w'){
    wolf.up();
  }
  if (key=='d'){
    wolf.right();
   }
   
  if (key=='a'){
     wolf.left();
   }
   if (key=='s'){
     wolf.down();
   }
   if (key=='k'){
     if (firing == false)
     firing = true;
     countdown = 7;
       
 }
}


 
class Wolf{
  float vy,vx,x,y,friction,frictionX,gravity;
 
  //constructor
  Wolf(float xpos, float ypos){
  x=xpos;
  y=ypos;
  vy=0;
  vx=2;
  friction = -.8;
  frictionX = .8;
  gravity = .03;
  }
 
 void display(){
   if(health>0)
   {
     image(beast,x,y,125,145);
   }
   else
   {
     textFont(CH);
     fill(354,98,98);
     textSize(65);
     text("GAME OVER!!!",160,height/2,250);
     noLoop();
   }
  }
  void move(){
    vy+=gravity;
    vx *= frictionX;
    x += vx;
    y += vy;
    height = 700;
    width=750;
 
    if(y>height){
       y=height;
       vy *= friction;
    }
 
    if(x> width){
       x=width;
       vx *=friction;
    }
    if(x>bm1.getXpos()-30 && x<bm1.getXpos()+30 && y>bm1.getYPos()-30 && y<bm1.getYPos()+30)
    {
      if(frameCount%10==0&&bm1.getZombie()==true)
      {
        health--;
      }
    } 
    
        if(x>bm2.getXpos()-30 && x<bm2.getXpos()+30 && y>bm2.getYPos()-30 && y<bm2.getYPos()+30)
    {
      if(frameCount%10==0&&bm2.getZombie()==true)
      {
        health--;
      }
    }
    
    if(x>bm3.getXpos()-30 && x<bm3.getXpos()+30 && y>bm3.getYPos()-30 && y<bm3.getYPos()+30)
    {
      if(frameCount%10==0&&bm3.getZombie()==true)
      {
        health--;
      }
    }
    
        if(x>bm4.getXpos()-30 && x<bm4.getXpos()+30 && y>bm4.getYPos()-30 && y<bm4.getYPos()+30)
    {
      if(frameCount%10==0&&bm4.getZombie()==true)
      {
        health--;
      }
    }
  }
  void up(){
     y=(y-20);
     //gravity=.01;
  }
  void right(){
    x=(x+20);
  }
  void down(){
    y=(y+20);
  }
  void left(){
    x=(x-20);
  }
  void rainbow(float xpos, float ypos, float xpos2, float ypos2, float xpos3, float ypos3, float xpos4, float ypos4){
  
    for (int i = 0; i < 150; i = i+8) {
      stroke(random(360),100,100);
      strokeWeight(2);
      line(x+110,y+53,x+350+i,y+500);
   
    }
    
    if(x+150 < xpos && x+300 > xpos)
    {
       if(y+25 < ypos && y+450 > ypos)
       {
         if(bm1.getZombie()==false)
         {
           score++;
           println(score);
           println("ZAP!!!");
         }
         //bm1.smoke(bm1.getXpos(),bm1.getYPos());
         bm1.explode(bm1.getXpos(),bm1.getYPos());
         bm1.setZombie();
   
       }
    }
    
        
    if(x+150 < xpos2 && x+300 > xpos2)
    {
       if(y+25 < ypos2 && y+450 > ypos2)
       {
         if(bm2.getZombie()==false)
         {
           score++;
           println(score);
           println("ZAP!!!");
         }
         //bm1.smoke(bm1.getXpos(),bm1.getYPos());
         bm2.explode(bm2.getXpos(),bm2.getYPos());
         bm2.setZombie();
   
       }
    }
    
        
    if(x+150 < xpos3 && x+300 > xpos3)
    {
       if(y+25 < ypos3 && y+450 > ypos3)
       {
         if(bm3.getZombie()==false)
         {
           score++;
           println(score);
           println("ZAP!!!");
         }
         //bm1.smoke(bm1.getXpos(),bm1.getYPos());
         bm3.explode(bm3.getXpos(),bm3.getYPos());
         bm3.setZombie();
   
       }
    }
    
   if(x+150 < xpos4 && x+300 > xpos4)
    {
       if(y+25 < ypos4 && y+450 > ypos4)
       {
         if(bm4.getZombie()==false)
         {
           score++;
           println(score);
           println("ZAP!!!");
         }
         //bm1.smoke(bm1.getXpos(),bm1.getYPos());
         bm4.explode(bm4.getXpos(),bm4.getYPos());
         bm4.setZombie();
   
       }
    }
    
  }
 void power(){
   image(PU,600,150,115,115);
  }
}

class BM1{
float vy,vx,x,y,friction,frictionX,gravity;
boolean zombie;
 
//constructor
BM1 (float xpos, float ypos){
  x=xpos;
  y=ypos;
  vy=0;
  vx=2;
  friction = -.8;
  frictionX = .8;
  gravity = .03;
}

float getXpos() {
  return this.x;
}
float getYPos() {
  return this.y;
}

boolean getZombie() {
  return this.zombie;
}

void setZombie() {
  this.zombie = true;
}
 
void display(){
  if(this.zombie==false)
  {
    image(ImageBM1,this.x,this.y,125,145);
  }
  else
  {
    image(ImageBM1D,this.x,this.y,125,145);
  }
}
void move(){
   vy+=gravity;
   vx *= frictionX;
   x += vx;
   y += vy;
   x=x-5;
   if(x<-50){
     x=750;
     y=400;
     zombie=false;
   }
 
  if(y>height){
    y=height;
    vy *= friction;
  }

  if(x> width){
    x=width;
    vx *=friction;
  }
}


void smoke(float xpos, float ypos){
          fill(255,25);
          noStroke(); 
          float a = 0.0;
          float inc = TWO_PI/25.0;
          for(int j=0; j<100; j=j+4) {
            ellipse(xpos+65+sin(a)*40.0, ypos+25+j,10,10);
            a = a + inc;
          }
}
            
void explode(float xpos, float ypos){
          image(ImageBM1XP,x,y,125,145);
          
}
}

