
void setup(){
  size(450,450);
  smooth();
  PFont font;
  font = loadFont("HelveticaWorld-Regular-48.vlw");
  textAlign(RIGHT);
  textFont(font,12);
}


void draw(){
  cursorpos();
} 

void cursorpos(){
   background(175);
   String cursorPos ="x:"+floor(mouseX)+" y:"+floor(mouseY);
   fill(0,0,0,175);
   text(cursorPos,width-10,height-10);
}

