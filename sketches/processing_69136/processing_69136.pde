
//Wayland Lee, Loops: Repeating Shapes, CP1 mods 16-17
//http://waayland.webs.com/Loop.html
size(500,500);
background(0);
strokeWeight(2);
int h = 10;
int bump = 0;
while(bump < 500)
{
  fill(h,255-bump,100,h);
  ellipse(250 - bump,250,100,255-h);
  ellipse(250 + bump,250,100,255-h);
  ellipse(250,250 - bump,100-h,255);
  ellipse(250,250 + bump,100-h,255);
  h = h + 5;
  bump = bump + 10;
}
