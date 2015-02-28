
//Final

float PlankCountM;
float Game;
float ReGame;
float lose;
float reset;
int mode;
float plankCount;
float mili, seconds, minutes;
float x,y;
int speed;
int sx, sy, ss; //directionx, directiony, direction speed
float c,d;
float speed2;
float timer;

int numFrames = 6;
int frame = 0;
PImage[] images = new PImage[numFrames];
 Thing[] thing;

void setup(){
  size (700,700);
    frameRate(15);
  images[0] = loadImage("sq1.gif");
  images[1] = loadImage("sq1.gif");
  images[2] = loadImage("sq2.gif");
  images[3] = loadImage("sq2.gif");
  images[4] = loadImage("sq3.gif");
  images[5] = loadImage("sq3.gif");
  
  plankCount = 30;
  //squid starting place
  sx = 0;
  sy = 0;
  ss = 2;
  smooth();
  //the "plankton array"
  thing = new Thing[30];
   for(int i = 0; i < thing.length; i++){
    thing[i] = new Thing(random(width),random(height),12,random(.03-.12));
   }
  
 background(4,11,31);
 mode = 0;
}

void draw(){
 mili = millis();
 seconds = mili/1000;
 minutes = mili/60000;
 background(4,11,31);

//First Page
switch (mode) {
 case 0:
  background(8,17,67,80);
  fill(40,300,19,150);
  textSize(50);
  text("SCARY SQUID",190,150);
  textSize(17);
   text("Use the Arrow Keyes to move the Scary Squid ",160,260);
     text("Get close enough to each of the planktons to scare them",130,300);
      text("They will turn white to show how terribily frightened they are ",50,340);
    // text("Move fast though, you have 1 minute",200,340);
       text("Click to Proceed. . .",260,380);
          seconds = 0;
       
  break;       
 
 //page Game 
 case 1: 
Game();
 ReGame();
  if(plankCount <= 0){
    mode = 2;
    reset();
  }

  break;
 
//page Win
  case 2:
  background(55,82,183);
 fill(250);
 textSize(20);
 text("Yay you have scared away all of the food in the ocean",140,200);
 text("Click to restart", 300,500);
 textSize(55);
  text("YOU WIN",250,340);
 //timer();
  //if (seconds>=7){
  // mode =1;
   //reset();
// }
  break;
  
//page Lose
case 3: 
background(31,121,52,200);
fill(255);
textSize(20);
text("You have run out of time", 240,200);
text("Will reset in seven seconds", 215,500);
textSize(50);
text("YOU LOSE", 240,340); 
timer ();
 if(seconds > 7){
   mode = 1;
   reset();
      }
   
break;
   }
}

void Game(){
  boolean Game = true;
    background(4,11,31);
    frame = (frame+1) % numFrames;
   image(images[frame], sx,sy);
   
     for(int i = 0; i <thing.length; i++){
   thing[i].display();
   thing[i].move();
   //println(mode);
 
     if(dist(sx,sy,thing[i].x,thing[i].y)<=10){
      thing[i].strokeColor = (255);
      //println(thing[i].display);
     }
     if(dist(sx,sy,thing[i].x,thing[i].y)<=10){
      plankCount--;
    println(plankCount);
 
     }
   }
 }


void timer(){
  seconds ++;
}

//reset game
void ReGame(){
  boolean ReGame = true;
  if(plankCount<=0){    
    background(4,11,31);
    frame = (frame+1) % numFrames;
   image(images[frame], sx,sy);
   
     for(int i = 0; i <thing.length; i++){
   thing[i].display();
   thing[i].move();
   //println(mode);
 
     if(dist(sx,sy,thing[i].x,thing[i].y)<=20){
        thing[i].strokeColor = (255);
     // println(thing[i].display);
     }
     if(dist(sx,sy,thing[i].x,thing[i].y)<=20){
      plankCount--;
     println(plankCount);
 
      }
    }
  }
}
    
// reset the plankCount
void reset(){
plankCount = 30;

     for(int i = 0; i <thing.length; i++){
   thing[i].display();
   thing[i].move();
      thing[i].strokeColor = (0);
     }
}

    //to switch pages
    //processing.org
  void mousePressed(){
  if (mode == 0){
    mode = 1;
   }else if(mode == 3) {
     mode = 0;
    reset();
   }else if(mode == 2) {
     mode = 0;
     reset();

  }
} 

//processing.org
 void keyPressed() {
     if (key == CODED) {
       
     if (keyCode == UP) {
      sy -= 10;
    } else if (keyCode == DOWN) {
      sy += 10;
    } else if(keyCode == LEFT){
      sx -= 10;
    }else if(keyCode ==RIGHT){
      sx += 10;
    } 
  }
}
 

// class 1
class Thing {
boolean display = true;
float strokeColor = (0);
float x,y;
float angle = 0; // Current angle
float speed = random(0); // Speed
float radius = 0; // Range of motion

int trailNum = 13; //keep track of last 20 spots
float prevx[] = new float[trailNum];
float prevy[] = new float[trailNum]; //declare arrays

//constructor
Thing (float _x, float _y, float _angle, float _speed){
x = _x;
y = _y;
angle = _angle;
speed = _speed;

}


//methods

void move(){
 x -= angle;
 y -= speed;

 if(x> width || x <0){
   angle = -angle;
 }

 if (y >height || y < 0){
   speed = -speed;
   }

   for(int j =1; j < trailNum; j++){ //push the numbers back loop
   prevx[j-1] = prevx[j];
   prevy[j-1] = prevy[j];
   stroke(strokeColor);
   fill(67,178,59,100);
  ellipse((prevx[j-1]),(prevy[j-1]),j,j);

 }
}

void display(){
  //p 291
  if ((x >10 && x<600) && (y>10 && y<600)){
angle += 1*speed; // Update the angle
float x2 = y;
float y2 = y;
float sinval = sin(angle);
float cosval = cos(angle);
float x =  x2+(cosval * 300);
float y =  y2+(sinval * 200);

prevx[trailNum -1] = x;
prevy[trailNum -1] = y;
for(float j= 0; j <trailNum; j++){  
     }
   }
  }
}


