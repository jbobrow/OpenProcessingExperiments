
void setup()
{
size(250, 250);
background(#F5F7F5);
smooth();
for(float ypos = 0; ypos<250;ypos =ypos + 27)
{
for(float xpos = 0; xpos <250; xpos = xpos + 27)
{
noStroke();
fill(#3EC40A, 50);
tint(255,255);
ellipse(xpos,ypos,50,50);
}
} 
}
         

