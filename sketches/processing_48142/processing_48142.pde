
import processing.video.*;
Movie myMovie;

int min_x = 0;
int min_y = 0;
int max_x = 600;
int max_y = 600;
int size = 50;
int score=0;
int state=0;
PFont myFont;
PVector vel;
boolean running;







int bxdirection = getRandomOne();  // Left or Right   bomb
int bydirection = getRandomOne();  // Top to Bottom



int axdirection = getRandomOne();  // Left or Right   angel
int aydirection = getRandomOne();  // Top to Bottom


int[] f2xdirection = new int[3];
int[] f2ydirection = new int[3];    //foe 2 directions

int[] fr2xdirection = new int[3];
int[] fr2ydirection = new int[3];   // friend 2 directions



int[] f1xdirection = new int[5];
int[] f1ydirection = new int[5];    //foe 1 directions

int[] fr1xdirection = new int[5];
int[] fr1ydirection = new int[5];   // friend 1 directions



float xspeed = 3.7;  // Speed of the shape
float yspeed = 3.0;  // Speed of the shape

float angelxspeed = 7.7;
float angelyspeed = 7.0;


PVector agent = getRandomLoc();
PVector bomb = getRandomLoc();   //game over
PVector angel = getRandomLoc();  // +250
PVector [] foe2 = new PVector[3];  //-$100
PVector [] friend2 = new PVector[3];  //+$100
PVector [] foe1 = new PVector[5];     //-$50
PVector [] friend1 = new PVector[5];     //-$50





void setup(){
 size(600, 600); 
 ellipseMode( CORNER);
 frameRate(30);
 smooth();
 running= false;
 myMovie = new Movie(this, "breaking_news.avi");
 myMovie.loop();
 vel= new PVector (7.7, 7, 0);
 
 for(int i=0; i<3; i++){
    foe2[i]= getRandomLoc();     //give random loc to friend and foe 2 ($100)
    friend2[i]= getRandomLoc();
  }
  
  for(int i=0; i<5; i++){
    foe1[i]= getRandomLoc();  //give random loc to friend and foe 1 ($50)
    friend1[i]= getRandomLoc();
  }
  
for ( int i=0; i<3;  i++){
  f2xdirection[i]= getRandomOne(); 
  f2ydirection[i]= getRandomOne(); 
  fr2xdirection[i]= getRandomOne(); 
  fr2ydirection[i]= getRandomOne(); 
}


for ( int i=0; i<5;  i++){
  f1xdirection[i]= getRandomOne(); 
  f1ydirection[i]= getRandomOne(); 
  fr1xdirection[i]= getRandomOne(); 
  fr1ydirection[i]= getRandomOne(); 
}


  
  

  
} // end of setup()

void draw(){
/* *************************state0-title******************************** */
  if(state==0){

  
  PImage title;
  title = loadImage("newTitle.jpg");
  image(title, 0, 0);
  //rect(35, 535, 148, 55);
 
  
  
  PImage myMovie= get();
  image(myMovie,600,600);
  
  if (state==0 && mousePressed && mouseX>35 && mouseX<183 && mouseY>535 && mouseY<590)
    state=1;
    
  
  }
  
/* *************************state1-story******************************** */
  if(state==1){

  
  PImage story;
  story = loadImage("story1.jpg");
  image(story, 0, 0);
 
  //rect(234, 535, 148, 55);
  
  
  
  
  if (state==1 && mousePressed && mouseX>234 && mouseX<382 && mouseY>535 && mouseY<590)
    state=2;
    
  
  }
/* ************************state2-directions****************************** */
  if(state==2){
   background(#050404);  
   text("Directions", 240, 30);
   

 
  
  PImage directions;
  directions = loadImage("directions1.jpg");
  image(directions, 0, 0);
  //rect(420, 525,148 ,55);
 
  
  if (state==2 && mousePressed && mouseX>420 && mouseX<568 && mouseY>525 && mouseY<580)
    state=3;
  
  }
  
/* ************************state3-scoring****************************** */
  if(state==3){
   background(#050404);  
   text("Scoring", 240, 30);
   
   
  PImage scoring;
  scoring = loadImage("scoring.jpg");
  image(scoring, 0, 0);
  
  
  
  if (state==3 && mousePressed && mouseX>249 && mouseX<374 && mouseY>527 && mouseY<580){
    state=4;
    running=true;
  }
  }
/* ******************************state4-game****************************** */
 if(state==4 && running==true){
 //background(#3D9DFA);
 
 
 
 int sec= second();
 int b= int(random( -100, 10));
 //println(sec);
 
 
 if((sec<15) || (sec>20 && sec<35) || (sec>40 && sec<55))
   background( #3D9DFA);
 else
   background( #000000);
   
   
   
   

    
 bomb.x= bomb.x + (xspeed * bxdirection);
 bomb.y= bomb.y + (yspeed * bydirection);
 stroke(#000000);
 fill(#000000);
 ellipse(bomb.x, bomb.y, size, size);   //bomb
 if (bomb.x > max_x-size || bomb.x < 0) {
    bxdirection *= -1;
  }
  if (bomb.y > max_y-size || bomb.y < 0) {
    bydirection *= -1;
  }
  

       
     
  
 agent.x = mouseX;
 agent.y = mouseY; 
 noCursor();
 stroke(#FA9005);
 fill(#FA9005); 
 for(int i=0; i<3; i++){
    ellipse(agent.x, agent.y, size, size);  //agent
   }
   
  
  
 angel.x += vel.x; //angel.x + (angelxspeed * axdirection);
 angel.y += vel.y; //angel.y + (angelyspeed * aydirection);
 stroke(#FFFFFF);
 fill(#FFFFFF);
 ellipse(angel.x, angel.y, size, size);   //angel
 if (angel.x > max_x-size || angel.x < 0) {
    vel.x = - vel.x;
  }
  if (angel.y > max_y-size || angel.y < 0) {
    vel.y = - vel.y;
  }
  
  
 

 /**
 if absolute values of difference btwn agent.x and angel.x and the y's is less than a
 certain distance, then you evade.
 fix evade function.
 */
 if((abs(angel.x-agent.x) <= 20) || (abs(angel.y-agent.y)<=20)){
   evade(angel, agent, vel);
 }
  

 
 
 
 
 stroke(#0BE3A0);
 fill(#0BE3A0);
 for(int i=0; i<5; i++){
   
    foe1[i].x= foe1[i].x + (xspeed * f1xdirection[i]);
    foe1[i].y= foe1[i].y + (yspeed * f1ydirection[i]);
    
    ellipse(foe1[i].x, foe1[i].y, size, size);     //foe1 -50
    if (foe1[i].x > max_x-size || foe1[i].x < 0) {
      f1xdirection[i] *= -1;
      }
    if (foe1[i].y > max_y-size || foe1[i].y < 0) {
      f1ydirection[i] *= -1;
        }
        
   }
   



 
 stroke(#F787F2);
 fill(#F787F2); 
 for(int i=0; i<5; i++){
   
    friend1[i].x= friend1[i].x + (xspeed * fr1xdirection[i]);
    friend1[i].y= friend1[i].y + (yspeed * fr1ydirection[i]);
    ellipse(friend1[i].x, friend1[i].y, size, size);  //friend1 +50
    
    if (friend1[i].x > max_x-size || friend1[i].x < 0) {
      fr1xdirection[i] *= -1;
      }
    if (friend1[i].y > max_y-size || friend1[i].y < 0) {
      fr1ydirection[i] *= -1;
        }
   }
   
   
   
   
 stroke(#FA0515);
 fill(#FA0515);
 for(int i=0; i<3; i++){
    foe2[i].x= foe2[i].x + (xspeed * f2xdirection[i]);
    foe2[i].y= foe2[i].y + (yspeed * f2ydirection[i]);
    ellipse(foe2[i].x, foe2[i].y, size, size); //foe1 -100
    
    if (foe2[i].x > max_x-size || foe2[i].x < 0) {
      f2xdirection[i] *= -1;
      }
    if (foe2[i].y > max_y-size || foe2[i].y < 0) {
      f2ydirection[i] *= -1;
        }
    
   }
 
 
 
 
 
 stroke(#FAEE05);
 fill(#FAEE05); 
 for(int i=0; i<3; i++){
   
    friend2[i].x= friend2[i].x + (xspeed * fr2xdirection[i]);
    friend2[i].y= friend2[i].y + (yspeed * fr2ydirection[i]);
    ellipse(friend2[i].x, friend2[i].y, size, size);  //friend1 +100
    
    if (friend2[i].x > max_x-size || friend2[i].x < 0) {
      fr2xdirection[i] *= -1;
      }
    if (friend2[i].y > max_y-size || friend2[i].y < 0) {
      fr2ydirection[i] *= -1;
        }
   }
   

   
   
   
getScore();
text( "Score: $" + str( score ), 10, 20 );

if(score>= 5000)
  state=6;
 }  
 
 
 
/* ********************************state5-gameover****************************  */
if(state==5){
  //running=false;
  score=0;
  PImage loser;
  loser = loadImage("loser.jpg");
  image(loser, 0, 0);
  fill(#ffffff);           
  //rect(52,525, 148, 55); // play again?
  //rect( 232, 525,148 , 55); // directions
  //rect(405, 525, 148, 55);  //credits
  cursor();
  
  if (state==5 && mousePressed && mouseX>52 && mouseX<200 && mouseY>525 && mouseY<580){
     makeLoc(); 
    state=4;
  }
  
  
  
  if (state==5 && mousePressed && mouseX>232 && mouseX<380 && mouseY>525 && mouseY<580)
    state=2;
  
  
  
  if (state==5 && mousePressed && mouseX>405 && mouseX<553 && mouseY>525 && mouseY<580)
    state=7;
  
  
  
  
}
/* ********************************state6-winner*****************************  */
if(state==6){
  score=0;
  //running=false;
  
  PImage winning;
  winning = loadImage("winning.jpg");
  image(winning, 0, 0);  
  //rect(52,525, 148, 55); // play again?
  //rect( 232, 525,148 , 55); // directions
  //rect(405, 525, 148, 55);  //credits
  cursor();
  
  if (state==6 && mousePressed && mouseX>52 && mouseX<200 && mouseY>525 && mouseY<580){
     makeLoc();  
    state=4;
  
  }
  
  
  
  if (state==6 && mousePressed && mouseX>232 && mouseX<380 && mouseY>525 && mouseY<580)
    state=2;
  
  
  
  if (state==6 && mousePressed && mouseX>405 && mouseX<553 && mouseY>525 && mouseY<580)
    state=7;
}

/* ********************************state7-credits*****************************  */
if(state==7){
 // running=false;
  //background(#000000);
  
  PImage credits;
  credits = loadImage("credits.jpg");
  image(credits, 0, 0);  
  //rect( 115, 525, 148, 55);
  //rect( 325, 525, 148, 55);

  if (state==7 && mousePressed && mouseX>115 && mouseX<263 && mouseY>525 && mouseY<580){
     makeLoc(); 
    state=4;
    
  }
  
  
  
  if (state==7 && mousePressed && mouseX>325 && mouseX<473 && mouseY>525 && mouseY<580)
    state=2;  
  
  
  
}
 
}//end if draw

/* *********************************functions********************************** */
int getRandomOne(){
  int n = int(random(0,2));
  if( n == 1)
    return 1;
  else
    return -1;
}


PVector getRandomLoc() {
  PVector v =
    new PVector( ((int)random(min_x,max_x-size)),
  ((int)random(min_y,max_y-size)));
  return( v );
}

  
     
       
void evade ( PVector angel, PVector agent, PVector vel){
 if((agent.x > angel.x) && (vel.x>0))
   vel.x= -vel.x;
 else if ((agent.x < angel.x) && (vel.x<0))
   vel.x= -vel.x;
 if((agent.y > angel.y) && (vel.y>0))
   vel.y= -vel.y;
 else if ((agent.y < angel.y) && (vel.y<0))
   vel.y= -vel.y;
    

}


void getScore(){
 if(isCollision(bomb, agent))
   state=5;
   
 if ((isCollision(angel, agent)) && mousePressed)   //angel
  score+=250; 
  
 for(int i=0; i<5; i++){   
   if(isCollision(foe1[i], agent))
       score-=10;
   if((isCollision(friend1[i], agent)) && mousePressed)
       score+=50;
    }  
 
 for(int i=0; i<3; i++){   
   if(isCollision(foe2[i], agent))
       score-=30;
   if((isCollision(friend2[i], agent)) && mousePressed)
       score+=100;
    } 
 
  
}

void makeLoc(){
  
  agent=getRandomLoc();
  angel=getRandomLoc();
  bomb=getRandomLoc();
  
  for(int i=0; i<3; i++){
    foe2[i]= getRandomLoc();     //give random loc to friend and foe 2 ($100)
    friend2[i]= getRandomLoc();
  }
  
  for(int i=0; i<5; i++){
    foe1[i]= getRandomLoc();  //give random loc to friend and foe 1 ($50)
    friend1[i]= getRandomLoc();
  }
  

  
  
}
  
  

boolean isCollision(PVector p2, PVector p1 ) {
  if ((( p2.x <= p1.x + size ) && ( p1.x + size <= p2.x + size ) && ( p2.y <= p1.y + size ) && ( p1.y + size <= p2.y + size )) || // is lower right corner of p1 inside p2 (same as upper left corner of p2 inside p1)?
  (( p2.x <= p1.x ) && ( p1.x <= p2.x + size ) && ( p2.y <= p1.y + size ) && ( p1.y + size <= p2.y + size )) || // is lower left corner of p1 inside p2 (same as upper right corner of p2 inside p1)?
  (( p2.x <= p1.x + size ) && ( p1.x + size <= p2.x + size ) && ( p2.y <= p1.y ) && ( p1.y <= p2.y + size )) || // is upper right corner of p1 inside p2 (same as lower left corner of p2 inside p1)?
  (( p2.x <= p1.x ) && ( p1.x <= p2.x + size ) && ( p2.y <= p1.y ) && ( p1.y <= p2.y + size ))) { // is upper left corner of p1 inside p2 (same as lower right corner of p2 inside p1)?
    return( true );
  }
  else {
    return( false );
  }
} // end of isCollision()

void movieEvent(Movie m) {
  m.read();
}

