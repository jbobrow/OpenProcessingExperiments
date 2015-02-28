
void setup()
{
size(600, 600);
background(#F5F7F5);
smooth();
for(float ypos = 0; ypos<1000;ypos =ypos + 100)
{
for(float xpos = 0; xpos <1000; xpos = xpos + 100)
{
noStroke();
fill(#3EC40A, 50);
tint(255,255);
ellipse(xpos,ypos,200,200);
}
} 
}
         

