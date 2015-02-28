
/*
Chad Cruz
P.2
Creating a YouTube logo
*/
PFont font;
void setup(){
  size(400,400);
  font=loadFont("Impact-50.vlw"); //Font
  textFont(font);
  background(255);
}
void draw(){
  textSize(50);
  fill(0);
  text("You",100,200); //You
  
  noStroke();
  fill(250,10,10);
  rect(175,155,125,50); //Red background
  
  textSize(50);
  fill(255);
  text("Tube",186,200); //Tube
}
