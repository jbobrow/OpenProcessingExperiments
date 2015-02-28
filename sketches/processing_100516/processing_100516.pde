
void setup()
{
size(1024, 640);//size of frame 
background(255);
stroke(0); //color
strokeWeight(5);//how intense 
}

void draw()
{
strokeWeight(random(1.3));
stroke( random(100), random(255), random(255));
fill( random(1000), random(255), random(255));
line(random(640),random(640),random(1024),random(1024));//random line x,x
}void keyPressed()  {setup();}



