
void setup()    //happenes only once at start of function
{
  size (500,500);
  background(200,200,150);
  
}


void draw()     //60 times/second
{
  background(200,200,150);
  stroke(255,255,255);
  noFill();
  ellipse( mouseX,mouseY,mouseX,mouseY);
  line(250,250,mouseX,mouseY);
  //point(mouseX,mouseY);
  ellipse (mouseX,height-mouseY/2,50,50);
  ellipse (mouseX/5,height-mouseY/2,50,50);
  ellipse (mouseX/8,height-mouseY*5,50,50);
  ellipse (mouseX+5/2,height-mouseY,50,50);
  ellipse (mouseX*3,height-mouseY*2,50,50);
  ellipse (mouseX,height-mouseY/2,50,50);
  ellipse (mouseX/9,height-mouseY/2,50,50);
  ellipse (mouseX/9,height-mouseY*5,50,50);
  ellipse (mouseX+3/2,height-mouseY*2,50,50);
  ellipse (mouseX/6,height-mouseY*3,50,50);
  rectMode(CENTER);
  
  rect(250,250, mouseX/3,mouseY/3);
}


