
PImage yyy;
float speed = 1.0;
float move;
void setup() {  //setup function called initially, only once
  size(960, 637);
  yyy=loadImage("http://tn.clashot.com/thumbs/2856757/47963519/thumb_w800.jpg");
        
}
    
void draw() {  //draw function loops
  move=move+speed;
      
  image(yyy,move,move);
  if (move>10){
  move=0
  }
    
  }

