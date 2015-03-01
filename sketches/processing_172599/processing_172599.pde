
boolean hit; //is the rect being hit
boolean speedhit;
int x; //pos of the rect
int y;//pos of rect
int h;// height of rect
int w; // width of rect
int time; //duh
int speed;
boolean hangtime;//time in air
PImage bg;
PImage flame;
PImage flameup;
PImage lose;

float bx, by; //bad x/y
float sx, sy; //speed boast

int bgx;

int flamex;
int flamey;

int touchx;
int touchy;
int touchw;
int touchh;

boolean gameon;
int score;
int speedtime;
void setup() {
  //size(500,500);
  //cursor(CROSS);

  arial=createFont("Arial,24");
  textFont(arial);

  hit=false;
  hangtime = false;
  speedhit= false;
  gameon = false;
  speedtime= false;
  
  touchx=x;
  touchy=350;
  touchw=50;
  touchh=50;

  x=225;
  y=350;
  h=50;
  w=50;
  size(1000, 500);

  timer=0;  
  speed=5;
  bgx=0;
  bg=loadImage("bg.jpg");
  bgx2=1000;
  bg2=loadImage("bg.jpg");

  flame=loadImage("flame.png");
  flameup=loadImage("flameup.png");

//flamex=x-35;
//flamey=y+50;

bx=900;
by=random(0,375);

sx=random(900,999);
sy=random(0,375);

}


void draw() {
background(0);
 
  //image(lose,0,0);
 textSize(25);
 text("This is your final score:",250,250);
 textSize(200);
  text(score,430,460);
  score=score;
 if(!gameon){
  
  score++;
//println(speedtime);
textSize(50);
text("Score Go Here", 100,450);
//println(timer);


image(bg,bgx,0);
// filter(INVERT);
bgx=bgx-speed;
image(bg2,bgx2,0);
bgx2=bgx2-speed;
 //filter(INVERT);
 bx=bx-speed;
 by=by-(random(50)-25);
 sx=sx-speed;
 sy=sy-(random(20)-10);
  fill(#1F51FF);
  rect(x, y, h, w);


//timer++;


  fill(127);
  rect(0, 400, 1000, 100);
   fill(255,0,0);
rect(bx,by,25,25);
fill(0,255,0);
rect(sx,sy,25,25);

fill(255,0,0);
rect(700,420, 25,25);
fill(0,255,0);
rect(700,462, 25,25);

fill(255);
textSize(20);
text("-Don't touch this one", 725, 439); 

fill(255);
textSize(20);
text("-Touch this one,", 727, 470);
fill(255);
textSize(20);
text("-It will make you fast", 727, 490);

  fill(random(255),random(255),random(255));
  textSize(50);
 

text(score, 430,460);
//textSize(random(5,50));
//fill(random(255),random(255),random(255));
text("This is your score:",0,460);
 }
else{

}

if(bx<=0){
bx=random(900,999);
by=random(0,375);
}

if(sy<=0){
sy=1;
}
if(sx<=0){
sx=random(900,999);
sy=random(0,375);

}
if(sy>=375){
sy=375;
}
if(by<=0){
by=1;
}
if(by<=0){
by=1;
}
if(by>=375){
by=375;
}
if(bgx2<=0){
bgx=0;
bgx2=1000;
}
if(keyPressed){
  /* if (key == 'k' && y<=350 && w<=100 /*&& x<=150*///){
      //y+=random(0,25);
     // touchw-=5;
     /* w+=5;//random(25,100);
    }  if (key == 'i' && w>=0 /*&& w<=-150*///) {
     // y-=random(0,25);
     //touchw+=5;
      /*w-=5;//random(25,100);
    }  if (key == 'j') {
      x-=random(0,25);
       h=random(25,100);
    }  if (key == 'l') {
      x+=random(0,25);
     h=random(25,100);  
  }*/
    
     /*if (key == 's' && y<=350){
      y+=2;
    }*/
    
    if ( key == 'w' && y>=0/*&& hangtime=false*/) {
      y-=20;
     // scale(0.5);
      image(flameup,x-35,y+50);
      //image(flameup,x,y+50);
      //scale(0.5);
      image(flameup,x+15,y+50);
     // scale(0.5);  
   // gameon=true;
  }
    if (key == 'a' && x>=0 && timer>=300) {
      x-=10;
    }
    //move left
    if(key=='a' && x>=0 && timer<=300){
    x-=5;
    }
    if(key=='a' && x>=0 && timer>=300 && timer<=600){
    x-=15;
    }
    if(key=='a' && x>=0 && timer>=600 && timer<=900){
    x-=25;
    }
    if(key=='a' && x>=0 && timer>=900 && timer<=1200){
    x-=35;
    }
    //end move left
    //move right    
    if (key == 'd' && x<=900 && timer<300) {
      x+=8;
    }
    if(key=='d' && x<=900 && timer>=300 && timer<=600){
    x+=6;
    }
    if(key=='d' && x<=900 && timer>=600 && timer<=900){
    x+=4;
    }
    if(key=='d' && x<=900 && timer>=900 && timer<=1200){
    x+=2;
    }
    /*if(key =='n'){
      speed++;
    }*/
}//last for key press  

//start timer test
if(timer>=300 && !gameon){
touchw=40;
touchh=60;
//touchy=400;
speed=15;
w=40;
h=60;
score+=2;
fill(random(255),random(255),random(255));
text("MULTPLIER!!!", 450, 50); 
//image(flame,x-70,y-10);
}
if(timer>=600 && !gameon){
touchw=30;
touchh=70;
  w=30;
h=70;
speed=25;
image(flame,x-70,y-15);
score+=3;
fill(random(255),random(255),random(255));
text("MORE!!!", 450, 100); 
}

if(timer>=900 && !gameon){
touchw=20;
touchh=80;
  w=20;
h=80;
speed=35;
image(flame,x-70,y-30);
score+=4;

fill(random(255),random(255),random(255));
text("MORE!!!", 450, 150); 
}

if(timer >= 1200 && !gameon){
touchw=50;
touchh=50;
//touchy=350;
  w=50;
h=50;
touchy=350;
timer=0;
speed=5;
score++;
textSize(20);
fill(random(255),random(255),random(255));
text("too greedy", 450, 150); 
}//*/
//end timer test

if (timer<=300 && y>350){
touchy=350;
}
if(timer>=300 && timer<=600 && y>=350){
touchy=360;
}
if(timer>=600 && timer<=900 && y>=360){
touchy=370;
}
if(timer>=900 && timer<=1200 && y>=370){
touchy=380;
}
if (y<touchy){
hangtime=true;
y=y+10;
}//*/
if (y==touchy){
h=touchh;
w=touchw;
//idk what this stuff does

if(y<=-1){
y=0;
}
if(w>150){
w=150;
}
}
if((bx+35)>=x && (bx-35)<=x && (by+35)>=y && (by-35)<=y) {
   gameon = true;
   
  }
if((sx+35)>=x && (sx-35)<=x && (sy+35)>=y && (sy-35)<=y && !speedhit) {
   timer =timer+301;
   speedhit=true;
  // println(timer);
   sx= random(900,999);
  }
  else{
    speedhit=false;
}/*
else (speedhit = true){
  speedtime++;
}
if(speedtime >= 60){
speedhit = false;
*/
}//last one



