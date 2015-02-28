
 //I HATE LOOPS.  THEY CONFUSE ME AND MAKE ME SAD.  SO DO CONDITONALS.
int x = -300;
int y = 0;
int z = -150;
float diam = 0;
float sqsize = 50;
float yspeed = 2;
int red = 255;
int green = 255;
int blue = 255;
float state = 0;
int bgred = 0;
int bgblue = 0;
int bggreen = 0;

void setup(){
  size(600,600);
  background(0);
  rectMode(CENTER);
  frameRate(100);
}

void draw(){
  //Stops the trailing circles
  background(bgred, bgblue, bggreen);
  int xpos = x;
  int sqpos = z;
  //Creates the 5 ellipses
 for(int i = 0; i < 3; i = i + 1){
  xpos = xpos + 300;
  fill(red,green,blue);
  ellipse(xpos,y,diam,diam);
 }
 for(int i = 0; i < 2; i = i + 1){
   sqpos = sqpos + 300;
   fill(red,green,blue);
   rect(sqpos,y,sqsize,sqsize);
 }
  //moves them down
  y+=yspeed; 
  //if they hit the bottom, go up
  if(y > height){
    yspeed = -yspeed*2;
}
//if they hit the top, go down
if(y<0){
  y = 0;
  yspeed = -yspeed*2;
}
//inccreases the size of the circles over time, then resets their size
  diam = diam + .75;
  if(diam > 50){
    diam = 0;
 }
 sqsize = sqsize - .75;
 if(sqsize < 0){
   sqsize = 50;
 }
 if(yspeed > 31){
   yspeed = 2;
   green = 0;
   blue = 0;
   state = state + 1;
 }
   if(state > 1){
     red = 0;
     green = 255;
     blue = 0;
   }
   if(state > 2){
     red = 0;
     green = 0;
     blue = 255;
   }
   if(state > 3){
     bgred = 255;
 }
 if(state > 4){
   bgred = 0;
   bgblue = 255;
   red = 0;
   blue = 0;
   green = 255;
 }
  if(state > 5){
   bgblue = 0;
   bggreen = 255;
   red = 255;
   blue = 0;
   green = 0;
 }
 if(state > 6){
   red = 255;
   green = 255;
   blue = 255;
   bgred = 0;
   bggreen = 0;
   bgblue = 0;
   state = 0;
   state = state + 1;
 }
}


