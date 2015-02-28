
PImage lupin;
String message = "tickle";
 
 
float x, y;
float hr, vr; 
 
 
float xpos;
float ypos;
float drag = 30;
  
void setup() {
  size(400, 400);
  lupin = loadImage("lupin.gif");
 
  xpos = width/2;
  ypos = height/2;
   
  //hr = textWidth(message) / 2;
  //vr = (textAscent() + textDescent()) / 2;
  x = width / 2;
  y = height / 2;
   
   
}
  
void draw() {
  background(203,97,97);
    
  float difx = mouseX - xpos-lupin.width/2;
  if (abs(difx) > -1) {
    xpos = xpos + difx/drag;
    xpos = constrain(xpos, 0, width-lupin.width);
  }
    
  float dify = mouseY - ypos-lupin.height/2;
  if (abs(mouseX -x ) < hr &&
      abs(mouseY -y ) < vr)  {
    ypos = ypos + dify/drag;
    ypos = constrain(ypos, 5, height-lupin.height);
    }
    else
    {
    x += random(-5, 5);
    y += random(-5, 5);
  }
    
  //Display the sprite at the position xpos, ypos
  image(lupin, x, y);
}

