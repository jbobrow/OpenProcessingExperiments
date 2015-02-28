
void setup() {
  size(600, 600);
  background(0, 0, 0); //Sets the background to black.
}

void draw()
{
  smooth();
  stroke(255, 255, 0); //makes yellow stroke
  fill(255, 255, 0); //makes first rectangle yellow
  rect(10, 250, 225, 120);
  fill(0, 0, 0); //Makes the text black
  textSize(100);
  text("I AM ", 15, 348); 
  fill(255, 255, 0); //makes second rectangle yellow
  rect(235, 250, 355, 120);
  fill(0, 0, 0); //makes third rectangle black
  rect(240, 255, 345, 110);
  fill(255, 255, 255); //Makes the text white
  textSize(100);
  text("NIKON", 255, 348);

  int x1=23;  //x1,y1, x2,y2 for ellipse coordinates
  int y1=510;
  int x2=573;
  int y2=90; 
  int r=0; //red
  int g=255; //green
  int b=0;  //blue

  ellipseMode(CENTER);  //draw ellipses from center

  for (int x=0; x<26; x++) //loop to draw 26 circles
  {
    r=r+5; //mix reds
    g=g-7; //mix greens
    b=b+11; //mix blues
    stroke(b, g, r); 
    fill(r, g, b);
    ellipse(x1, y1, 20, 20);
    x1=x1+22; //change x coord for circles on the bottom
    stroke(b, g, r); 
    fill(r, g, b);
    ellipse(x2, y2, 20, 20);
    x2=x2-22; //change x coord for circles to look mirrored
  }
}

