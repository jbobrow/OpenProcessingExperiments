
void downButton(int x, int y, int w, int h, int r, int g, int b)
{
  if((mouseX>x) && (mouseX< x+w) && (mouseY >y) && (mouseY< y+h) && (mousePressed== true))
  {
    Oy+=7;  //object Y gets larger
  }
  
  //rectMode(CENTER);  //center the rect on x,y 
  fill(r,g,b);  //fill the rect with given rgb
  rect(x,y,w,h);  //draw the rect of the button
  textAlign(CENTER);  //align to center
  fill(0);
text("DOWN",(x+(.5*w)),(y+(.5*h))); //button text
}

