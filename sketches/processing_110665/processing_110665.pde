
// centre of each shape
float posX;  
float posY;

// hue of the brush
float brushHue;  


void setup()
{
  // screen size
  size(800,800);  
  colorMode(HSB,100,100,100);
  
  // background colour
  background(30);  
}

void draw()
{
  // this will keep the sketch looping
}

void mousePressed()
{
  // store coordinates of the mouse upon click
  posX = mouseX;  
  posY = mouseY;
  
  // set random hue
  brushHue = random(100);  
}

void mouseDragged()
{
  // make steps of PI/4 around the circle
  for(float ang=0; ang<TWO_PI; ang+=PI/4)  
  {
    pushMatrix();
    
    // translate to the centre of the shape
    translate(posX,posY);
    
    // rotate a multiple of PI/4
    rotate(ang);  
    
    // set stroke to hue, and scale opacity depending on how far cursor is from the centre of the shape
    stroke(brushHue,75,75,255-map(dist(mouseX,mouseY,posX,posY),0,width/2,0,150));  
    
    // scale brush trickness depending on how far the cursor is from the centre of the shape
    strokeWeight(map(dist(mouseX,mouseY,posX,posY),0,width/2,1,10));
    
    // draw a line between current and previous mouse positions
    line(pmouseX-posX,pmouseY-posY,mouseX-posX,mouseY-posY);  
    popMatrix();
  }
}

// keyboard input
void keyPressed()  
{
  // if s is pressed
  if(key == 's')  
  {
    // saving a screenshot
    saveFrame("MyMasterpiece-######.png");  
  }
  
  // if c is pressed
  if(key == 'c')  
  {
    // clearing screen
    background(30);  
  }
}
