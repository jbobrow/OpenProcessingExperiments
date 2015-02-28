
//Directions: Click mouse when all the elements
//    (rectangles, ellipse) are within framelines.
//    Win when your tally reaches 12. Lose if time runs out.



//TIME
float time;
//Tally
int pointup;
//gravity
float  vx = 2;
float  vy = 0;
float  X = 1;
float  Y = 1;
float  frictionx = 1;
float  frictiony = -1;
float gravity = .05;

//objects
int a,b,c,x,y,z;
float xpos,ypos,xspeed,yspeed;
float xxpos,yypos,yyypos, xxspeed,yyspeed;
float xxxpos,xxxspeed;

int xdir, ydir = 1;
int xxdir, yydir = 1;
int xxxdir = 1;

void setup(){
  size(999,666);
  noCursor();
  
  time = 0;
  
  xspeed = 1;
  xdir = 1;
  
  
  xxspeed = 2; 
  xxdir = 1;
  
  xxxspeed = 1.2;
  xxxdir = 1;
  
  ypos = 400;
  yypos = 675;
  yyypos = 475;
  
  pointup = 0;
  
  time = 0;
  
  
  
 
  
}

void draw(){
  background(0);
  
  
  //timer
  text(time, 900, 40);
  time = 120 - millis()/1000;
  if(time <= 0){
    background(100,0,0);
    text("YOU LOSE", 444,333);
  }
    //physics math
  vy += gravity;
  vx *= frictionx;
  X += vx;
  Y += vy;
  if(Y > 500){
    Y = 500;
    vy *= frictiony;
  }
  fill(100,0,0);
  noStroke();
  ellipse(X,Y, 40,40);
  if(X >= width){
    X += -1;
    vx *= -frictionx;
  }
 if(X <= 0){
vx *= -1;
  }
  
   
  //Horizon line
  stroke(111,229,226); 
  line(0,444, width, 444); //Horizon
  
  //Abstract place holder for images
  fill(125);
  rect(xpos, ypos, 45, 200);
  xpos = xpos + ( xspeed * xdir );
  if (xpos >  width + 20 || xpos <  - 65 ) {
    //N.B. add image/object flip as well
   xdir *= -1;
   
  }
  
  rect(xxxpos, yyypos, 85, 140);
   xxxpos = xxxpos + (xxxspeed * xxxdir ); 
   if( xxxpos < 0 || xxxpos > width + 88) {
   xxxdir *= -1;
  }
   rect(xxpos, yypos, 100, 300);
   xxpos = xxpos + ( xxspeed * xxdir );
   if (xxpos < 0 || xxpos > width ){
   xxdir *= -1;
  }
   
     //"framelines"
  noFill();
  stroke(111,222,333);
  rectMode(CENTER);
  rect(mouseX, mouseY, 360, 240);
  
  if(pointup >= 12){
    background(100, 50, 60);
    text("YOU WIN", 444, 333);
  }
  

 text(pointup, 40, 40);
 

  }
  
  void mouseClicked(){
   
   if((dist(mouseX, mouseY, xpos, ypos) <= 300) && (dist(mouseX, mouseY, xxpos, yypos) <= 300) && (dist(mouseX, mouseY, xxxpos, yyypos) <= 300) && (dist(mouseX, mouseY, X, Y) <= 300) ) {
   background(100);
   pointup += 1;
  } 
  
  
 }

