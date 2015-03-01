
PImage yyy;
float speed = 2.0;
float move;
void setup() {  //setup function called initially, only once
  size(465, 700);
  yyy=loadImage("http://www.robertbotts.com/Gallery/IOW/Images/sealion_700_02.jpg");
      
}
  
void draw() {  //draw function loops
  move=move+speed;
    
  image(yyy,10,move);
  if (move>500){
  move=0
  }
  
  }

