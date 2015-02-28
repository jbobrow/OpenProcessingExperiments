
//void setup// only once
//void draw// happens while the program is ruuning//

//variables are created here so we can acesses them when ever we want//
int circlex = 0;
int circley = 100;
int rad = 50;
int velx = 10;
int vely = 10;

void setup(){
size(400,400);
background(255,20,20);

frameRate(20);
}

void draw(){
  background(255,20,20);
  fill(255);
  noStroke();
  ellipse(circlex, circley, rad, rad);
  
  circlex = circlex + velx;  //we are making a trail...duplicating it and if we redraw the background than it wil refresh and the ball wil move
  //the background is in the void setup happens once//
 if(circlex == width){
    velx = -velx; //we redefinded vel in void draw to be -10
    //circlex=circlex-5
  //when it reaches 400 it bounces back..to minus 10 velocity
 }else if(circlex==0){
   velx = -velx;
 }
 
 circley = circley + vely; 
 if(circley == height){
    vely = -vely; 
 }else if(circley==0){
   vely = -vely;
 }

 circley = circley + vely;  
 if(circley == height){
 vely = -vely; 
 }else if(circley==0){
 vely = -vely;
 }

 
} 










 
 
 

 
 
 
 
 
 
 
 
                                
