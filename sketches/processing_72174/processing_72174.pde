
int x = 0;
void setup()


{

  size(300,300);

}

void draw()

{

  stroke(0);

  fill(0,0,0,10);

  rect(0,0,300,300);

}

void mouseDragged()

{

  stroke(255);

  line(mouseX,mouseY,pmouseX,pmouseY);
  if(x>100)
  {
    x=x-100;
  }

 
  {
    ellipse (random(300),random(300), x, x);
    x=x+1;
  }
  
  

}



