
/*This program creates two objects (ellipse and rectangule).
The user can choose them by pressing 1 or two on the keyboard.
If mouse is dragged, the  picture will be repainted in different
positions.
When Enter is pressed, screen will be saved and the canvas will be
cleared.


*/
//stores witch object will be created 
int object;
color strokeColor=color(0,10);

void setup()
{
  size(800,800);
  colorMode(HSB,360,100,100,100);
  noFill();
  background(360);
}

void draw()
{

  if(mousePressed)
  {
    pushMatrix();
    translate(width/2,height/2);
    int circleResolution=(int)map(mouseY+100,0,height,2,10); //?
    int radius=mouseX-width/2;
    float angle=TWO_PI/circleResolution;
    strokeWeight(2);
    stroke(strokeColor);
    float x=0 + cos(angle)*radius;
    float y=0+sin(angle)*radius;
    switch(object)
    {
      case 1:
       
       ellipse(x,y,100,100);
       break; 
       
       case 2:
       
       rect(x,y,100,100);
       break; 
    }
    
    popMatrix();
  }
}

void keyReleased()
{
  if(key == ENTER)
 { 
    background(360);
    saveFrame("screen.png");
 }
  
  switch(key)
  {
    case '1':
      object=1;
      break;
    
    case '2':
      object=2;
      break;
      
         
  }
}

