
int mysize = 100;
float xpos = 350;
float ypos = 200;
float theta =100;
void setup ()
{
  size (700,400);
  background(255);
  
  
}

void draw()
{
  //background(255);

 // ellipse(xpos,ypos,mysize,100);
  stroke (0,20);
  strokeWeight(0);
  line(mouseX,mouseY, xpos,ypos);
  xpos= xpos + (mouseX - xpos)/25.0;
  ypos = ypos + (mouseY - ypos)/25.0;
  
  translate(xpos,ypos);
  rotate(theta);
  line(-50,0,50,0);
  
  theta=theta+dist(mouseX,mouseY,xpos,ypos)/1000+0.01;
}

void mousePressed()
{

  
 
 
}

void mouseMoved()
{

  
}

