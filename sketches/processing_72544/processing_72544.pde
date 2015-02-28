
//Wayland L, Ticklish Penguin, CP1 mods 16-17
void setup()
{ 
size(650,650);
strokeWeight(7);
frameRate(5);
}
void draw()

{
   int x = mouseX-int(random(25));
   int y = mouseY-int(random(25));
   int x2 = int(random(50,600));
   int y2 = int(random(50,600));
   fill(0,0,0,250);
 rect(0,0,width,height);
 stroke(0);
fill(0,255,5);
 ellipse(x2,y2,100,100);
 fill(255);
 ellipse(x2,y2,50,50);
  stroke(255,5,5);
  line(x,y,325,650);
  fill(0,255,5);
  ellipse(x,y,5,5);
if( x == x2 && y == y2)
{
  background(255);
  fill(0);
  text("YOU WIN",325,325);
}

 
}
