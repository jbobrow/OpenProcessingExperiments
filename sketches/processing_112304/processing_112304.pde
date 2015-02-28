
//fun pong parrody called pang. made by ya homeskillet Eric B. please b nice :)
PFont font;
int x = 0;
int y = 0;
int xdir = 1;
int ydir = 1;
int paddley = 450;
int paddlec = 450;
int scorep1 = 0;
int scorep2 = 0;
void setup(){
  size(1440,900);
  font=loadFont("Aharoni-Bold-48.vlw");
}
void draw(){
  background(255);
  fill(255,0,0);
  textSize(48);
  textFont(font);
  text("Computer's Score: " +scorep1,100,100);
  text(" Your Score: " +scorep2,950,100);
   if( x >= 1480){
   x = 720;
   xdir = 1;
   ydir = 1;
   scorep1 = scorep1 + 1;
}
 if( x <= -40){
  xdir = 1;
  ydir = 1;
  x = 720;
  scorep2 = scorep2 + 1;   
}
 if( y >= height-40){
   ydir = -1;     
}
if( y <= 40){
  ydir = 1;
} 
if(scorep1 >= 10){
  text("Dude...you just lost to a computer",width/2 - 300,height/2 - 48);
  text("u r bad at pong lol",width/2 - 300,height/2);
}
if(scorep2 >= 10){
  text("You lost! jk the comptr totally lost the game,",width/2 - 300,height/2 - 48);
text("nice job... but youre still bad",width/2 - 300,height/2);
}
if(y >= paddley && y <= paddley + 100 && x >= 1300){
  xdir = -1;
  ydir = -1;
}
if(y >= paddley + 100 && y <= paddley + 200 && x >= 1300){
  xdir = -1;       
}
if(y >= paddley + 200 && y <= paddley + 300 && x >= 1300){
  xdir = -1;
  ydir = 1;
}
if(y >= paddlec && y <= paddlec + 100 && x <= 165){
  xdir = 1;
  ydir = -1;    
}
if(y >= paddlec + 100 && y <= paddlec + 200 && x <= 165){
  xdir = 1;    
}
if(y >= paddlec + 200 && y <= paddlec + 300 && x <= 165){
  xdir = 1;
  ydir = 1;
}
if(xdir == -1 && y > paddlec){
paddlec = paddlec + 5;
}
if(xdir == -1 && y < paddlec){
paddlec = paddlec - 5;
}
x = x + 10 * xdir;
y = y + 10 * ydir;
rect(100,paddlec,25,300);
rect(1340,paddley,25,300);
ellipse(x,y,80,80);
}
void keyPressed(){
if(keyCode==DOWN){
  paddley = paddley + 100;
}
if(keyCode==UP){
  paddley = paddley - 100;
}
}
