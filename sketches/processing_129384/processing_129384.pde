
float x, y, wd, ht;
float xDist, yDist;
float easingCoef;


//for (int i = 0; i < 100; i++) {
//float r= random(50);
// }
  

void setup ( )
{
    fill (0,10);
    size (400,400);
    //noCursor ( )
    easingCoef = .4;
    x= x + xDist*.5;
    y= y + yDist*.5;
    background (255);
    
}
    
void draw ( )
{   
    fill (300,0,0);
    ellipse (mouseX,mouseY, .8*wd, .8*ht);
    wd= random(60);
    ht= random(60);
}
