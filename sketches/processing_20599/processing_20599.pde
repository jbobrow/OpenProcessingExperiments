
/*Sarah Scialli
Homework 3: "Clock"
*/

int hours;
int minutes;
int seconds;
PImage dogFoot;
PImage foot;
PImage sand;
PImage nightSand;

void setup(){
  size(640,480);
  smooth(); 
  sand = loadImage("sand.jpg");
  nightSand = loadImage("nightSand.jpg");
  image(sand,0,0);
}

void draw(){
  //draw the bright sand at AM
  if(hour() < 12){
    image(sand, 0,0);
  }
  //draw the dark sand at PM
  else{
    image(nightSand, 0,0);
  }
  hours(2,102);
  minutes(10,270);
  seconds(2,420);
  hours = hour()%12;
  if(hours == 0){
    hours = 12;  
  }
  minutes = minute();
  seconds = second();
 
}

//a quick class to return a tuple
public class IntPair{
  int x;
  int y;
  
  IntPair(int x, int y){
    this.x = x;  
    this.y = y;
  }
  
}

void hours(int x, int y){
 for(int i = 0; i<hours; i++){
   if(i%2 == 0){
     rightFootprint(x,y);
     x+=30;
     y-=50; 
   }
   else{
     leftFootprint(x,y);
     x+=65;
     y+=40;       
   }  
 }   
}

void minutes(int x, int y){
  int groups = minutes/10;
  int offset = minutes %10;
  //full groups
  for(int j = 0; j<groups; j++){
   for(int i = 0; i<10; i++){
     IntPair xAndy = dogGroup(x,y,i);
     x = xAndy.x;
     y = xAndy.y;
   }
  if((j%2) == 1){
     x-=20;
     y-=50;  
   }
   else{
    x-=130;
    y+=100; 
   }
  }
//final offset
 for(int o = 0; o<offset; o++){
     IntPair xAndy = dogGroup(x,y,o);
     x = xAndy.x;
     y = xAndy.y;
  }
  
}
//helper function to draw part of a dog print group
IntPair dogGroup(int x, int y, int o){
     dogFootprint(x,y);
     if((o %2) == 0){
       x+=20;
       y-=30;
     }
     else{
       x+=15;
       y+=22;
     }
     IntPair xAndy= new IntPair(x,y);
     return xAndy;
}

void seconds(int x, int y){
  int groups = seconds/10;
  int offset = seconds %10;
  //full groups
  for(int j = 0; j<groups; j++){
   for(int i = 0; i<10; i++){
     IntPair xAndy = birdGroup(x,y,i);
     x = xAndy.x;
     y = xAndy.y;
   }
   x-=60;
   if((j%2) == 1){
     y-=35;  
   }
   else{
    y+=45; 
   }
  }
//partial groups
 for(int o = 0; o<offset; o++){
     IntPair xAndy = birdGroup(x,y,o);
     x = xAndy.x;
     y = xAndy.y;
  }

}
//helper function to draw part of a bird track group
IntPair birdGroup(int x, int y, int o){
     birdTrack(x,y);
     if((o %2) == 1){
       x+=20;
       y-=15;
     }
     else{
       x+=10;
       y+=10;
     }
     IntPair xAndy= new IntPair(x,y);
     return xAndy;
}

//draws a dog print
void dogFootprint(int x, int y){
  dogFoot = loadImage("dogfoot.png");
  image(dogFoot, x,y); 
}

//draws a bird print
//x,y are lower left corner
void birdTrack(int x,int y){
  stroke(0);
  strokeWeight(2);
  line(x,y,x+19,y-5);
  line(x+10,y-2,x+18,y+1);
  line(x+10,y-2,x+15, y-9);
}
//draws footprint
void leftFootprint(int x, int y){
  footprint(x,y, "footprint.png");
}
void rightFootprint(int x, int y){
  footprint(x,y, "rightfoot.png");
}
void footprint(int x, int y, String i){
  foot = loadImage(i);
  image(foot, x,y);
}

