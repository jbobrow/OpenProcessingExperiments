
void setup(){
  size(400,400);
  smooth();
  background (255,255,255);
  xpos=200;
  xvelocity=5;
  ypos=200;
  yvelocity=2;
}
int xpos;
int xvelocity;
int ypos;
int yvelocity;

void draw(){
  //to keep background white and prevent streaking of ball add the line
  //" background(255,255,255);" HERE
  
  xpos=xpos+xvelocity;
  ypos=ypos+yvelocity;

  fill(random(255),random(255),random(255));
  ellipse(xpos,ypos,40,40);
  
  if(xpos<20==true||xpos>380==true) {
    xvelocity=xvelocity*(-1); 
  }
  if (ypos<20==true||ypos>380==true) {
    yvelocity=yvelocity*(-1); 
  }
  //changing the background when it reaches X border
if (xpos<20==true||xpos>380==true){
background (random(255));}}

