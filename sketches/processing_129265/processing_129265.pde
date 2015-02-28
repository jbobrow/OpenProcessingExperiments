
/* @pjs preload="Got Taco.jpg; */

PImage myimage;

void setup()
{
  size(500,500);
  myimage = loadImage("Got Taco.jpg");
}

void draw()
{
  if (myimage.width > 0)
  {
    image(myimage, 0, 0, width, height);
  }
  filter(POSTERIZE, 5);
    
   stroke(255);
   strokeWeight(10);
   line(50,50,50,150);
   line(50,50,100,50);
   line(50,150,125,150);
   line(125,150,125,100);
   line(125,100,100,100);
   
   fill(#149013);
   ellipse(200,100,100,100);
   
   fill(#FA0824);
   ellipse(200,100,50,50);
   
   line(265,50,350,50);
   line(305,50,305,150);
   line(130,350,220,350);
   line(175,350,175,450);
   line(215,450,260,350);
   line(305,450,260,350);
   line(240,400,278,400);
   line(320,350,360,350);
   line(320,350,320,450);
   line(320,450,360,450);
   
   fill(#F5FA08);
   ellipse(420,400,100,100);
   
   fill(#FA1008);
   ellipse(420,400,50,50);
   
}


