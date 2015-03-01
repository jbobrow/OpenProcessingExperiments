
PImage yyy;
float speed = 2.0;
float move;
void setup() {  //setup function called initially, only once
  size(640, 436);
  yyy=loadImage("http://samanthamosher.com/wp-content/uploads/2014/08/candle.jpg");
      
}
  
void draw() {  //draw function loops
  move=move+speed;
    
  image(yyy,move,move);
  if (move>500){
  move=0
  }
  
  }

