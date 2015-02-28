

float xops;
float ypos;

void setup ()
{
  size(600,600);
  smooth();
  background(255);
}

void draw ()
{
  strokeWeight(.5);
  if(((mouseX>=50) && (mouseX<=150)) && ((mouseY>=50)&&(mouseY<=150)))
 {fill(100,100,255);
 ellipse(100,100,100,100);
 }
 else
 {fill(255);
 ellipse(100,100,100,100);
 }


{
 if(((mouseX>=300) && (mouseX<=500)) && ((mouseY>=400)&&(mouseY<=450)))
 {fill(255,100,100);
 rect(300,400,200,50);
 }
 else
 {fill(255);
 rect(300,400,200,50);
 }
}
}

