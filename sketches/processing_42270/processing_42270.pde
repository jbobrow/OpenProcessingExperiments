
PFont font;
int xspeed=0;
int y=200;
  
void setup (){
   
 size(600,200);
 background(200,230,100);
 smooth();
 noStroke();
 fill(49,106,10);
    
}
  
void draw(){
   
   background(200,230,100);
    font = loadFont("AngsanaNew-48.vlw");
    textFont(font);
 
     text ("to slither", xspeed, y);
     
     xspeed=xspeed+10;
  
}

