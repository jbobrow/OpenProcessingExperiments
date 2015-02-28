
int mysize = 100;
float xpos = 350;
float ypos = 200;

void setup()
{
  size(700,400);
  background(255);
smooth();
  fill(0,80);
  
}

void draw()
{
  background(255);
    ellipse(xpos, ypos, mysize, mysize);
   

   
    xpos = xpos + (mouseX - xpos)/15.0;
    ypos = ypos + (mouseY - ypos)/15.0;
}

void mousePressed(){
  
}

void mouseMoved(){

//  if(mouseX < width/2) {
 //   mysize = mysize + 5; }
}

