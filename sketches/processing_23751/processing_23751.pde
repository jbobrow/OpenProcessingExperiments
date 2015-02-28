
float posY = 250;
float posX = 0;
import gifAnimation.*;

PImage bg;
Gif mickey, minnie, castle, current;

void setup(){
size(650,430);
mickey = new Gif(this,"mickey.gif");
minnie = new Gif(this,"minnie.gif");
current = mickey;
current.play();
noCursor();

bg = loadImage("castle.png");
  }
 
void draw(){
background(bg);
image(current, posX, posY);
  
if (posY < 200) {
    posY = 200;
  }
if (posX < 10) {
    posX = 10;
  }
if (posX > 430) {
    posX = 430;
  }
image(current,posX,posY);
  }


void keyPressed(){
if(key=='1'){
    current=mickey;
    current.play();
  }
if(key=='2'){
    current=minnie;
    current.play();
  }  
if(key=='a'){
    current.stop();
  } 
if(keyCode==UP){
    posY -= 10;
  }
if(keyCode==DOWN){
    posY += 10;
  }
if(keyCode==LEFT){
    posX -= 10;
  }
if(keyCode==RIGHT){
    posX += 10;
  }
  }





