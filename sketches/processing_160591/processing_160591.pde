

PImage yyy;
float speed = 4.0;
float move;
void setup() {  //setup function called initially, only once
  size(641, 474);
  yyy=loadImage("http://otteronarock.com/wp-content/uploads/2011/03/Picture-11.png");  
    
}

void draw() {  //draw function loops 
  move=move+speed;
  
  image(yyy,10,move);
  if (move>4){
  move=0
  }

  }

