
void setup()
{
    //canvas size
    size(800,400);
}

void draw()
{
int myWeight = 100;
int weightChange = -8;

while(myWeight > 0)
{
    strokeWeight(myWeight);
    stroke(random(0,255), random (0,50), random (50,150));
    point(mouseX, mouseY);
    myWeight += weightChange;
}//end of loop

}//end of draw

