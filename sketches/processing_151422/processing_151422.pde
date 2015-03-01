

PImage b;
PImage b1;
PImage b2;
PImage[] penguin = new PImage[8];
PImage snowball;
PImage fish;
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
Fish[] fishes = new Fish[3];
Snowball[] snowballs = new Snowball[5];

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
   penguin[0] = loadImage("p1.png");
   penguin[1] = loadImage("p3.png");
   penguin[2] = loadImage("p4.png");
   penguin[3] = loadImage("p5.png");
   penguin[4] = loadImage("p6.png");
   penguin[5] = loadImage("p7.png");
   penguin[6] = loadImage("p8.png");
   penguin[7] = loadImage("p9.png");
   fish = loadImage("fish.png");
   snowball = loadImage("snowball.png");
   randomNum(1);
   fishes[0] = new Fish(bXpos,bYpos,speed);
   randomNum(1);
   fishes[1] = new Fish(bXpos,bYpos,speed);
   randomNum(1);
   fishes[2] = new Fish(bXpos,bYpos,speed);
   
   randomNum(2);
   snowballs[0] = new Snowball(cXpos,bYpos,speed);
   randomNum(2);
   snowballs[1] = new Snowball(cXpos,bYpos,speed);
   randomNum(2);
   snowballs[2] = new Snowball(cXpos,bYpos,speed);
   randomNum(2);
   snowballs[3] = new Snowball(cXpos,bYpos,speed);
   randomNum(2);
   snowballs[4] = new Snowball(cXpos,bYpos,speed);
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
        image(penguin[f],mXpos-penguin[f].width/2,mYpos-penguin[f].height/2);
        
      
        for (int i = 0; i < fishes.length; i++) {
         fishes[i].update();
        }
        for (int i = 0; i < snowballs.length; i++) {
         snowballs[i].update();
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
  
  

class Fish {
  int bYpos, bXpos, speed;
  Fish (int x, int y, int sp) {
    bYpos = y;
    bXpos = x;
    speed = sp;
  }
  
  void update () {
    image(fish, bXpos, bYpos);
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

class Snowball {
  int cYpos, cXpos, speed;
  Snowball (int x, int y, int sp) {
    cYpos = y;
    cXpos = x;
    speed = sp;
  }
  
  void update () {
    image(snowball, cXpos, cYpos);
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







