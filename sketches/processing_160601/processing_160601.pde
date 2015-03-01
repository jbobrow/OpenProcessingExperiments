
PImage yyy;
float speed = 2.0;
float move;
void setup() {  //setup function called initially, only once
  size(800, 530);
  yyy=loadImage("http://www.blackaby.net/wp-content/uploads/2014/03/candle_in_the_dark.jpg"); 
     
}
 
void draw() {  //draw function loops
  move=move+speed;
   
  image(yyy,move,move);
  if (move>500){
  move=0
  }
 
  }
