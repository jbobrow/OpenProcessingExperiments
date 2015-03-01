
int i = 0;
void setup()
{
  size(600,600);      //Canvas Size 600x600 pixels
  background(random(128),random(255),255);      //Max red possible is 128, last value is 255 to favor a blue background.
  smooth();        // for smooth arc edges
}

void draw()
{
  if(i<5000)
  {
    float randomArcAngle = PI*random(0,2.0);       //generates random angle value between 0 and 2PI. Example 1.23PI
    stroke(0,0,0,0);   //to make strokes invisible.
    fill(255,random(255),128,random(255));   //Favored red with blue value at 128 generates random values of pink and orange
    /* This generates random sized ellipses at random 
    locations on the canvas. The max value of height 
    or width of an ellipse is 50 so that the ellipses 
    are small enough to show some contrasting background.
    */
    arc(random(600),random(600),random(50),random(50),0,randomArcAngle);     
    i++;
  }
}


