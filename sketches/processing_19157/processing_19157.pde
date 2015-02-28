
PFont font;
float y = 0.0;
float x = 0.0;
float a = 5.0;
//variables

void setup(){
 size(250,250);
 smooth();
 font = loadFont("AcademyEngravedLetPlain-48.vlw");
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
 text("M2H1J1",mouseX+25,mouseY);
}

void mouseMoved(){
  x+=25;
  noStroke();
  //when mouse is moved, glowing circle lights surround the mouse
  fill(#3998A7, random(0,15));
  ellipse(mouseX,mouseY-15,x,x);
  //blue circle
  fill(#C6DB75, random(0,15));
  ellipse(mouseX+35,mouseY+40,x,x);
  //green circle
  fill(#FAF7AC, random(0,15));
  ellipse(mouseX+70,mouseY-15,x,x);
  //yellow circle
  if (x>150){
    x=0;}
    //allows circles to expand no further than 150, or else the circle returns to 0; causing the glowing effect
}

void mouseDragged(){
  //fill of the text turns whiter when dragged
  y+=50;
  //text size enlarges to 20 point
  a=20;
}

void mouseReleased(){
  //fill of the text goes back to black
  if (y>50){
    y=0;
    //text size returns to 5 point
    a=5;
}}

