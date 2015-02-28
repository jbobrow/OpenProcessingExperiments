
PFont font;
float x = 0.0;
//variables

void setup(){
  size(250,250);
  font = loadFont("Garamond-Bold-48.vlw");
  background(255);
  textFont(font);
  fill(0);
}

void draw(){
  background(0,12);
  //black background
  fill(random(0,70));
  //random fill
  textSize(random(1,7));
  //random text size
  for(x=0;x<300;x+=1.5){
text("M2H1J1",random(-10,260),x);}
//postal code moving along x axis and randomized along y axis
}


void mouseMoved(){
  fill(50,random(50,100),random(60,160));
  //fill colour randomizes when mouse moves
  textSize(random(0,25));
  //text size randomizes when mouse moves
  text("M2H1J1",random(0,250),mouseY);
  //text follows Y coordinate of mouse while X coordinate is random
}


