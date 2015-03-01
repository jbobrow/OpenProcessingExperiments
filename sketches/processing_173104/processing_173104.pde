

PImage b;
PImage b1;
PImage b2;
PImage[] marsh = new PImage[8];
PImage fire;
PImage mallow;
int f=0; 
int mXpos=100;
int mYpos=550;
int countdown=0;
int count=0;
char lastKey;
int s = 0;
int bXpos = 0;
int bYpos = 0;
int cXpos = 0;
int cYpos = 0;
int speed = 0;
int numOfBananas = 2;
int score = 0;
int life = 3;
Mallow[] mallows = new Mallow[3];
Fire[] fires = new Fire[5];

void setup() {
   size(1280,720);
   smooth();
   noStroke();
   background(50); 
   frameRate(15);
   //frameRate(60);
   b = loadImage("b.jpg");
   b1 = loadImage("b1.png");
   b2 = loadImage("b2.png");
   marsh[0] = loadImage("player-1.png");
   marsh[1] = loadImage("player-2.png");
   marsh[2] = loadImage("player-3.png");
   marsh[3] = loadImage("player-4.png");
   marsh[4] = loadImage("player-5.png");
   marsh[5] = loadImage("player-6.png");
   marsh[6] = loadImage("player-7.png");
   marsh[7] = loadImage("player-8.png");
   mallow = loadImage("Marshmallow.png");
   fire = loadImage("fire.png");
   randomNum(1);
   mallows[0] = new Mallow(bXpos,bYpos,speed);
   randomNum(1);
   mallows[1] = new Mallow(bXpos,bYpos,speed);
   randomNum(1);
   mallows[2] = new Mallow(bXpos,bYpos,speed);
   
   randomNum(2);
   fires[0] = new Fire(cXpos,bYpos,speed);
   randomNum(2);
   fires[1] = new Fire(cXpos,bYpos,speed);
   randomNum(2);
   fires[2] = new Fire(cXpos,bYpos,speed);
   randomNum(2);
   fires[3] = new Fire(cXpos,bYpos,speed);
   randomNum(2);
   fires[4] = new Fire(cXpos,bYpos,speed);
 }

void draw() {
  if (life<=0) {
     //image(b2,0,0);
  }
    else if (score>=10) {
      image(b1,0,0);
    }
      else {
        image(b,0,0);
        image(marsh[f],mXpos-marsh[f].width/2,mYpos-marsh[f].height/2);
        
      
        for (int i = 0; i < mallows.length; i++) {
         mallows[i].update();
        }
        for (int i = 0; i < fires.length; i++) {
         fires[i].update();
        }
        
       
        if(f==7) {f=0;}
        
        if (countdown == 0) {count = 0;}
        if (count == 1) { countdown--; }
      
        if (keyPressed == true){
            f++;
            if (key == 'd' || key == 'D'){
              if (mXpos<1205)
                { mXpos=mXpos+15+s; } 
            }
          
            if (key == 'a' || key == 'A'){
              if (mXpos>80)
                { mXpos=mXpos-15-s; }
          }
        }
        if (s>0) { s=0;}
    }
}

void randomNum(int objType) {
  switch(objType) {
    case 1:
    //1 = banana
    bXpos = round(random(140,1100));
    bYpos = round(random(-200,-70));
    speed = round(random(10,15));
    break;
    
    case 2:
    cXpos = round(random(140,1100));
    cYpos = round(random(-200,-70));
    speed = round(random(10,13));
    break;
  }
}
  
  

class Mallow {
  int bYpos, bXpos, speed;
  Mallow (int x, int y, int sp) {
    bYpos = y;
    bXpos = x;
    speed = sp;
  }
  
  void update () {
    image(mallow, bXpos, bYpos);
    bYpos+=speed;
    
    if (dist(bXpos+60, bYpos+60, mXpos, mYpos)<100){
       bXpos = round(random(140,1100));
        bYpos = round(random(-300,-70));
        speed = round(random(15,20));
        fill(255,255,0);
        rect(0,0,width,height);
        score++;
    }
    
    
    
      if (bYpos >= 800){
        bXpos = round(random(140,1100));
        bYpos = round(random(-300,-70));
        speed = round(random(15,20));
        //Banana b = new Banana(400,100,10);
        //bananas = (Banana[]) append(bananas,b);
      //append(bananas, new Banana(300,50,2));
      //numOfBananas++;
      }
  }
}

class Fire {
  int cYpos, cXpos, speed;
  Fire (int x, int y, int sp) {
    cYpos = y;
    cXpos = x;
    speed = sp;
  }
  
  void update () {
    image(fire, cXpos, cYpos);
    cYpos+=speed;
    
    if (dist(cXpos+50, cYpos+50, mXpos, mYpos)<100){
       cXpos = round(random(140,1100));
        cYpos = round(random(-200,-70));
        speed = round(random(10,25));
        fill(255,0,0);
        rect(0,0,width,height);
        image(b2,0,0);
        life--;
    }
    
    
    
      if (cYpos >= 800){
        cXpos = round(random(140,1100));
        cYpos = round(random(-200,-70));
        speed = round(random(10,25));
        
      }
  }
}


