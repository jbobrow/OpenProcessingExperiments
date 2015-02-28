
ArrayList locations;

void setup()
{
    size(800,600);
    background (255);
    locations = new ArrayList();
    
}


//---------------------------------------------------------------------------------------
void draw()
{
int myWeight = 200;
int weightChange = -5;

while(myWeight > 0)
{
    strokeWeight(myWeight);
    stroke(random(0,150), random (0,255), random (0,50));
    drawAllPoints();
    myWeight += weightChange;
}//end of loop

noLoop();

}//end of draw


//---------------------------------------------------------------------------------------
void drawAllPoints()  
{
    int counter = 0;

while(counter < locations.size() )
{
    //get the location from the list
    PVector tVec = (PVector)locations.get(counter);
    
    //use that location to draw a point
    point (tVec.x, tVec.y);
    counter ++;
}//end of loop

}//end of drawAllPoints

//---------------------------------------------------------------------------------------

void mousePressed()
{
locations.add( new PVector (mouseX, mouseY) );
loop();
}//end of mousePressed

void mouseDragged()
{
locations.add( new PVector (mouseX, mouseY) );
loop();
}//end of mouseDragged
