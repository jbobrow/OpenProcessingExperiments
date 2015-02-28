
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/79891*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
PImage b;
PImage b1;
PImage b2;
PImage[] monkey = new PImage[8];
PImage coconut;
PImage banana;
int f=0; //monkey frame
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
Banana[] bananas = new Banana[3];
Coconut[] coconuts = new Coconut[5];

void setup() {
   size(1280,720);
   smooth();
   noStroke();
   background(50);
   frameRate(15);
   //frameRate(60);
   b = loadImage("jungle.jpg");
   b1 = loadImage("jungleb.jpg");
   b2 = loadImage("junglec.jpg");
   monkey[0] = loadImage("monkey01.gif");
   monkey[1] = loadImage("monkey02.gif");
   monkey[2] = loadImage("monkey03.gif");
   monkey[3] = loadImage("monkey04.gif");
   monkey[4] = loadImage("monkey05.gif");
   monkey[5] = loadImage("monkey06.gif");
   monkey[6] = loadImage("monkey07.gif");
   monkey[7] = loadImage("monkey08.gif");
   banana = loadImage("banana.gif");
   coconut = loadImage("coconut.gif");
   randomNum(1);
   bananas[0] = new Banana(bXpos,bYpos,speed);
   randomNum(1);
   bananas[1] = new Banana(bXpos,bYpos,speed);
   randomNum(1);
   bananas[2] = new Banana(bXpos,bYpos,speed);
   
   randomNum(2);
   coconuts[0] = new Coconut(cXpos,bYpos,speed);
   randomNum(2);
   coconuts[1] = new Coconut(cXpos,bYpos,speed);
   randomNum(2);
   coconuts[2] = new Coconut(cXpos,bYpos,speed);
   randomNum(2);
   coconuts[3] = new Coconut(cXpos,bYpos,speed);
   randomNum(2);
   coconuts[4] = new Coconut(cXpos,bYpos,speed);
 }

void mouseClicked() {
  s = 85;
  image(monkey[f], mXpos-monkey[f].width/2, mYpos-monkey[f].height/2);
  
  
}

void draw() {
  if (life<=0) {
     image(b2,0,0);
  }
    else if (score>=10) {
      image(b1,0,0);
    }
      else {
        image(b,0,0);
        image(monkey[f],mXpos-monkey[f].width/2,mYpos-monkey[f].height/2);
        
      
        for (int i = 0; i < bananas.length; i++) {
         bananas[i].update();
        }
        for (int i = 0; i < coconuts.length; i++) {
         coconuts[i].update();
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
  
  

class Banana {
  int bYpos, bXpos, speed;
  Banana (int x, int y, int sp) {
    bYpos = y;
    bXpos = x;
    speed = sp;
  }
  
  void update () {
    image(banana, bXpos, bYpos);
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

class Coconut {
  int cYpos, cXpos, speed;
  Coconut (int x, int y, int sp) {
    cYpos = y;
    cXpos = x;
    speed = sp;
  }
  
  void update () {
    image(coconut, cXpos, cYpos);
    cYpos+=speed;
    
    if (dist(cXpos+50, cYpos+50, mXpos, mYpos)<100){
       cXpos = round(random(140,1100));
        cYpos = round(random(-200,-70));
        speed = round(random(10,25));
        fill(255,0,0);
        rect(0,0,width,height);
        life--;
    }
    
    
    
      if (cYpos >= 800){
        cXpos = round(random(140,1100));
        cYpos = round(random(-200,-70));
        speed = round(random(10,25));
        //Banana b = new Banana(400,100,10);
        //bananas = (Banana[]) append(bananas,b);
      //append(bananas, new Banana(300,50,2));
      //numOfBananas++;
      }
  }
}






