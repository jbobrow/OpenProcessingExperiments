
int x = 0;
int y = 0;

void setup(){
  size(600,400);
  frameRate(10);
   background(250,71,137);
}

void draw(){
//this is my character 
 fill(255,100);
 rect(x,y,100,100,5);
 rect(x+10,y + 105,80,150,5);
 fill(0,255,0,100);
 ellipse(x+20,y +40,20,20);
 ellipse(x+80,y+40,20,20);
 fill(0,100);
 ellipse(x+25,y+40,5,5);
 ellipse(x+85,y +40,5,5);
 fill(255,255,0,100);
 rect(x + 45,y +60,10,10);
 fill(255,30,30,100);
 rect(x+20,y+80,60,10);
 x  = x + 1;
 y = y +1;
 
}
