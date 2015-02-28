
PFont font;
float y = 0.0;
float x = 0.0;
float a = 5.0;
//variables
 
void setup(){
 size(250,250);
 smooth();
 font = loadFont("Zapfino-30.vlw");
 textFont(font);
 fill(0);
}
 
void draw(){
  fill(0,12);
  rect(-5,-5,width+15,height+15);
  //black background
  fill(y,y,y);
  textSize(a);
  //postal code follows the mouse
 text("L4N OL3",mouseX+25,mouseY);
}
 

 
void mouseDragged(){
  //fill of the text turns whiter when dragged
  y+=50;
  //text size enlarges to 20 point
  a=20;
}

