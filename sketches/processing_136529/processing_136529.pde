
int x = 50;
int y = 0;
int ms = 0;
int mc = 0;
PImage Bat ;
PImage BaJo ;
PImage IR ;
PImage Bub ;
PImage JC ;
PImage Bs ;
PImage Card ;
PImage Cry ;
PFont Words ;

void setup() {
  size(500,500) ;
  Bat = loadImage("BMS.png") ;
  BaJo = loadImage("BatJ.png") ;
  IR = loadImage("Room.png");
  Bub = loadImage("bubL.png");
  JC = loadImage("JoClo.jpg");
  Bs = loadImage("batsad.png");
  Card = loadImage("JCard.png");
  Cry = loadImage("Bat cry.png");
  Words = createFont("CharlemagneStd-Bold-48.vlw",200);
}

void draw() {
  background(255) ;
  switch(ms) {
    case 0 :
    //text("in 0",10,20,0);
    imageMode(CENTER);
    image(Bat,height/2,width/2,x,y);
    x = x + 6 ;
    y = y + 6 ;
    break;
     case 1 :
   // text("in 1",10,20);
    image(IR,height/2,width/2,500,500) ;
    image(Bub,80,80,300,200);
    fill(0);
textFont(Words,30);
text("I have you", 20,30);
text("now Joker", 20,70);
   fill(#5F3910);
    rect(0,480,500,60);
    image(BaJo,height/2,width/2,369,500);
    break; 
    case 2 :
       //text("in 2",10,20);
       image(JC,height/2,width/2,700,500);
          image(Bub,80,80,300,200);
          fill(0);
          textFont(Words,30);
       text("What's that", 20,30);
       text("behind you!?", 20,70);
    break;
    case 3 :
       //text("in 3",10,20);
        image(IR,height/2,width/2,500,500) ;
    break;
    case 4 :
       //text("in 4",10,20);
       image(Bs,height/2,width/2,1000,539);
    break;
    case 5 :
      // text("in 5",10,20);
      fill(#5F3910);
      rect(0,0,500,500);
       image(Card,height/2,width/2,351,514);
      fill(0); 
       textFont(Words,30);
             text("Maybe next time!",117,414);
    break;
    case 6 :
      // text("in 6",10,20);
       image(Cry,height/2,width/2,1105,500);
    break;
  }
  mc = mc + 1 ;
   if(mc > 2.5*60) {
     ms = ms +1;
     mc = 0;
     x = 50;
     y = 0 ;
     if(ms > 6) {
       ms = 0;
     }
   }
    println(mouseX + "," + mouseY) ; 
}
  




