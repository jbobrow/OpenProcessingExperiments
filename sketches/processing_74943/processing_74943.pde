
int x = 20;
int direction = 1;

PFont font;
String txt="I'm a running text,and I'm moving uniformly accross the workspace(window)";

void setup(){
  
  size(800, 400);
  font = loadFont("BrowalliaNew-25.vlw");
  textFont(font);
  
 
}

void draw(){
  background(0);
  textSize(25);

  
  textLeading(25);
  
  text(txt, x, 120, 280, 500);
 
  x=x+direction;
  if (x>540 || x<20){
    direction=-direction;
  }
   
   
}
 







