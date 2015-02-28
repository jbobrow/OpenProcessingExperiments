
PImage yesyesboard;
PImage yesyesboard_small;
float xpos;  // index into current source image
float xmag;
float ypos;
float ymag;
PFont font;
String s = "";

int r=100; //the radius of the circle



void setup()
{
  size(480,320, P2D);
  
  background(255);
  
  yesyesboard = loadImage ("yesyesboard.jpg");
  yesyesboard_small = loadImage ("yesyesboard_small.jpg");
  font = loadFont ("Courier-12.vlw");
  textFont(font);
  stroke(255,0,0);
  fill(0);
  
  frameRate (60);

}

void draw()

{ float nx = noise(millis()/1000.0 ) * 1000.0*(noise(.1,1)) ;
  float ny = noise(millis()/1000.0 ) * 1000.0*(noise(.1,1));
 constrain(0,0,2880);
  
  xmag = (mouseX-width/2)*0.030;
  xpos = (xpos+xmag);
  ymag = (mouseY-height/2)*0.030;
  ypos = (ypos+ymag);
  
//  copy(yesyesboard, (int)xpos,0,width,yesyesboard.height,0,0,width,height);
image(yesyesboard,xpos+nx,ypos-ny);

float cursorPos = textWidth(s);
//  line(cursorPos,0, cursorPos, height);
 fill(200,200);
  noStroke();
rect(5,270,470,50);
fill(0);
  text(s,10,290);
 

if (mousePressed)
{
  showboard();
}
}

void showboard ()
{
 

  image(yesyesboard_small,0,0);
  
 
}


 




  void keyPressed()
{
  if (key == BACKSPACE)
  {
    if(s.length() > 0)
    {
      s = s.substring(0,s.length ()-1);
    }
  }
  else if(textWidth(s + key) < width)
  {
    s = s + key;
  }
}

