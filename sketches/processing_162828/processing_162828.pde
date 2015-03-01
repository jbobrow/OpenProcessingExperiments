
/* @pjs preload="Me.jpg"; */
PImage Me;

void setup()
{
  size(500,700);
   Me = loadImage("Me.jpg");
}

void draw()
{
  Me.resize(500,700);
  image (Me, 0, 0, 500, 700);
  filter(INVERT);
  for(int i=0;i<=700;i+=100)
  {
    line(i,100,100,i);
    line(100,i,i,100);
    line(i,i,i,i);
    ellipse(10,i,10,i);
    ellipse(i,10,i,10);
    rect(i,i,50,50);
    line(100,i,10,700);
    line(i,100,10,700);
    line(50,0,450,400);
    line(0,50,400,450);
    noFill();
    arc(250,200,300,250,radians(180),radians(270));
    arc(250,200,350,250,radians(90),radians(360));


}
}

