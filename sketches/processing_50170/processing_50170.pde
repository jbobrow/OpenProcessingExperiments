
void setup()
{
size (200,200);
}
void draw(){
  
background(255);

frameRate(10);
int xpos = width/2;
int ypos = height/2;
int lookingx = mouseX/25;
int lookingy = mouseY/25;
for (float x = -100; x < 150; x = x +40) {
for (float y = -100; y < 150; y = y +40) {
ellipse(xpos+x,ypos+y,50,50);
arc(xpos+x,ypos+y, 30,30, radians(25), radians(135));
fill(random(100,255));
ellipse(xpos-10+x+lookingx,ypos-10+y+lookingy,7,6);
ellipse(xpos+10+x+lookingx,ypos-10+y+lookingy,7,6);
strokeWeight(5);
}
}
}





