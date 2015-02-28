

int ypos = 200;
int xpos = 200;
PFont myfont;

void setup()
{
  size(600, 600);
  background(0);
  myfont=loadFont("Bauhaus93-48.vlw");}
  
  void draw()
  {
  
  for(int ypos = 0; ypos < 600; ypos = ypos + 150){
    for(int xpos=0; xpos<600; xpos=xpos+200){
  

    fill(255,50,109);
    rect(xpos,ypos,40,100);
    fill (255,100,32);
    rect(xpos,ypos,7,200);
    fill (255,200,0);
    rect (xpos,ypos, 28, 120);
    fill(255, 0, 11);
    rect(xpos, ypos,120, 80);
    fill (255, 45,200);
    rect(xpos,ypos, 150, 20);
 
 textFont(myfont);
 textSize(48);
 fill(0,100,255);
 text("Repeat", xpos+40, ypos+130);
 
    
  
}}}


