
//homework 3
//copyright Jessica Schafer, Sept. 2011, pittsburgh, pa

float dx,dy;

void setup ()
{
  size (400,400);
  smooth();
  dx = 200;
  dy = 200;
  noCursor();
  noStroke();
  //saveFrame ("dot.jpg");

}


void draw ()
{
  background (201,93,147);
  fill (0);
  ellipse (dx,dy,50,50);
  fill (250,230,5);
  ellipse (mouseX, mouseY, 20,20);
}


void mousePressed()
{
  if (mouseX>=dx-35 && mouseX<dx && mouseY>=dy-35 && mouseY<dy){
    dx = dx+20;
    dy = dy+20;}
    
  if (mouseX<=dx+35 && mouseX>dx && mouseY>=dy-35 && mouseY<dy){
    dx = dx-20;
    dy = dy+20;}
       
  if (mouseX>=dx-35 && mouseX<dx && mouseY<=dy+35 && mouseY>dy){
    dx = dx+20;
    dy = dy-20;}
    
 if (mouseX<=dx+35 && mouseX>dx && mouseY<=dy+35 && mouseY>dy){
    dx = dx-20;
    dy = dy-20;}
    
if (mouseX==dx && mouseY<=dy+35 && mouseY>dy){
     dy = dy-20;}
  
}

