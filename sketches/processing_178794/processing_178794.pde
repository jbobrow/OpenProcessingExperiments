

int border = 50;
int activeBorder = 15;
int frameSize = 33;
int mouseColor = 400;
int mouseBrightness = 400;
int mouseSaturation = 400;
int mouseOpacity = 400;
PImage figure;
int stepY = 5;
int stepX = 5;
int gridY = 0;
int gridX = 0;
int brushSize = 50;
int maxHue = 500;
int maxBrightness = 800;
int maxSaturation = 800;
int maxOpacity = 800;



void setup() 
{
  size(975,700);
  figure = loadImage("newbauble.png");
  background(#000000);
  maxHue = height - activeBorder;
  maxSaturation = width - activeBorder;
  maxBrightness = height - activeBorder;
  maxOpacity = width - activeBorder;


  colorMode(HSB, maxHue, maxSaturation, maxBrightness, maxOpacity);
  cursor(CROSS);
  
 
}

void draw()
{
  
// border around image  
  noStroke();
  fill(0, 0, 0);
  rect(0, 0, width, border);
  rect(0, 0, border, height);
  rect(0, (height-border), width, border);
  rect((width-border), 0, border, height);
  
  
// frame to show current colour
  noStroke();
  fill(mouseColor, mouseSaturation, mouseBrightness, maxOpacity);
  rect(activeBorder, activeBorder, (width-2*activeBorder), frameSize);
  rect(activeBorder, activeBorder, frameSize, (height-2*activeBorder));
  rect(activeBorder, (height-activeBorder-frameSize), width-2*activeBorder, frameSize);
  rect((width-activeBorder-frameSize), activeBorder, frameSize, height-2*activeBorder);
  
  
// draw image  
  image(figure, border, border, (width - (2*border)), (height - (2*border)));
  
// populate right hand side with hue values
  for (gridY = 0; gridY < (height-activeBorder); gridY += stepY)
  {
     noStroke();
     fill(gridY, maxSaturation, maxBrightness, maxOpacity); 
     rect((width-activeBorder), gridY, activeBorder, stepY);
     

  }

  // populate bottom row with saturation values
 
  for (gridX = 0; gridX < (width-activeBorder); gridX += stepX)
  {
     noStroke();
     fill(mouseColor, gridX, maxBrightness, maxOpacity); 
     rect((width - stepX - gridX), (height- activeBorder), stepX, activeBorder);


  }
 
  
  
  // populate left side with brightness values
  for (gridY = 0; gridY < (height - activeBorder); gridY += stepY)
  {
     noStroke();
     fill(mouseColor, maxSaturation, gridY, maxOpacity); 
     rect(0, (height - gridY - stepY), activeBorder, stepY);
     


  }
  
  // populate top side with opacity values

  for (gridX = 0; gridX < (width - activeBorder); gridX += stepX)
  {
     noStroke();
     fill(mouseColor, (gridX), maxBrightness, maxOpacity); 
     rect(gridX, 0, stepX, activeBorder);
     
     



     // draw squares to indicate current hue, saturation, brightness, opacity values   
     noFill();
     stroke(#555555);
     strokeWeight(1);
     rect((width-activeBorder), (mouseColor - (activeBorder/2)), (activeBorder), (activeBorder));
     rect((width - activeBorder - mouseSaturation - (activeBorder/2)), (height-activeBorder), (activeBorder), (activeBorder));
     rect(0, (height - mouseBrightness - (activeBorder/2)), (activeBorder), (activeBorder));
     rect((mouseOpacity-(activeBorder/2)), 0, (activeBorder), (activeBorder));
     fill(#555555);
     textSize(12);
     text("h", (width-activeBorder +5), (mouseColor + 5));
     text("s", (width-mouseSaturation-activeBorder-2), (height-activeBorder/2+2));
     text("b", (5), (height-mouseBrightness + 5));
     text("o", (mouseOpacity - 2), (activeBorder/2 +5));

  }
  
  fill(#000000);
  textSize(24);
  text("Merry Christmas and a Happy 2015!", 200, 600);
  
  if(mousePressed == true)
  {
 
 // rules for selecting opacity, saturation, brightness, hue
    
    if((mouseY < activeBorder) && mouseX <= (width - activeBorder))
    {
      mouseOpacity = mouseX;

    }
    
    else if ((mouseY > (height - activeBorder)) && (mouseX >= activeBorder))
    {
      mouseSaturation = (width - activeBorder - mouseX);
    }
    
   else if (mouseX > (width - activeBorder))
    {
     mouseColor = mouseY;
    }
   else if (mouseX < activeBorder)
   {
     mouseBrightness = height - mouseY;
   }
        
        
      else if (mouseX <= (width - activeBorder))
      {
       noStroke();  
       fill(mouseColor, mouseSaturation, mouseBrightness, mouseOpacity);
       ellipse(mouseX, mouseY, brushSize, brushSize);
       }
  
  }
}

void keyPressed()
{
  if (key == 's' || key == 'S')
  {
    saveFrame("transparencytest.jpg");
  }

  if (key == '-' || key == '_')
  {
    if (brushSize <= 5)
    {
      brushSize = 5;
    }
    else brushSize -= 5;
  }
  
  if (key == '+'|| key == '=')
  {
    brushSize += 5;
  }

  if (key == 'c' || key == 'C')
  {
    noStroke();
    fill(#ffffff);
    rect(border, border, (width-2*border), (height-2*border));
  }
}

