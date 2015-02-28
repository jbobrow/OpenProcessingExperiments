
int r;
int g;
int b;
void setup ()
{
//background(#AAA7A7);
size (700,500);
 smooth();
// Set "ink" color, font, and alignment for rendering text.
  fill(0);  // Black
  // set up the font (system default sans serif)
  textFont(createFont("SansSerif",20));
  textAlign(LEFT);
  //noLoop();  // draw() executes only once
}
void draw()
{
  
  if(key==CODED&&keyCode==LEFT)
{
fill (255,0,0);
 ellipse (360,55,80,90);
  ellipse (40,55,80,90);
  rect (40,10,320,90);
}
  background(#AAA7A7);
  text("Choose Cheese",width/2,height/3);
text("up=red", width/15,height/2);
text("down=green", width/15, height/1.5);
fill(255,255,255);

  noStroke();
 



if(key==CODED&&keyCode==UP)
{
  
  fill (255,0,0);
  triangle(40,100,200,400,360,100);
text("Click mouse to continue", width/2,height/1.2);
}

if(key==CODED&&keyCode==DOWN)
{
fill(0,255,0);
triangle(40,100,200,400,360,100);
text("Click mouse to continue", width/2,height/1.2);
}

if (mouseButton == LEFT)
{
 fill(#AAA7A7);
 text("Choose Cheese",width/2,height/3);
text("up=red", width/15,height/2);
text("down=green", width/15, height/1.5);
 fill(50,50,50);
 text("Choose crust",width/2,height/3);
text("left=red", width/15,height/2);
text("right=green", width/15, height/1.5);
//noLoop();

}

}
