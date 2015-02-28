
void setup()
{
 size(400,400);
 smooth();
}

void draw()
{ 
 
background(255);
if (keyPressed == true)
{
  drawThis(); 
}else 
{
  drawThis2();
}

}



//void drawThis()
//{
// int x = 0;
// int y = 0;
// while(x<width)
//{
// line(0, x, width-x,mouseY);
// x = x+10;
// stroke(random(250), random(250), random(250));
//} 
//}

//void drawThis()
//{
// int x = 0;
// int y = 0;
// while(x<width)
//{
// ellipse(width/2, height/2, width,height-x);
// x = x+10;
// stroke(random(250), random(250), random(250));
//} 
//}

void drawThis2()
{
 
 for(int x = 0;x<width;x = x+10)
{
 ellipse(width/2, height/2, width,height-x);
 ellipse(width/2, height/2, width-x,height);
 //line(width,height-x,0, x);
 
 stroke(random(250), random(250), random(250));
} 
}

void drawThis()
{
 int x = 0;
 int y = 0;
 while(x<width)
{
//line(0, x, random(width),random(height));
 //line(width, x, random(width),random(height));
  line(width/2, height/2, random(width),random(height));
 pushStyle();
 stroke(255);
 line(0, height, random(width),random(height));
 line(width, height, random(width),random(height));

 popStyle();
 x = x+3;
 stroke(random(250), random(250), random(250));
} 
}




