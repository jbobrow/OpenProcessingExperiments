
void setup()
{
  size(500, 500);
  background(#FFCBF1);
  noStroke();
  smooth();
 
}

void draw()

{      

  fill(#366BBF,120);     
      ellipse(width/2, height/2, 100, 100);
      rect(width/2+40, height/2-20,40,40);
      fill(#E30B0B);
      ellipse(width/2,height/2,8,8);
      noFill();
      fill(#366BBF,120);     

  noLoop();
}



