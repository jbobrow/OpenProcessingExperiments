
// Adapted for Processing from "Plasma Fractal" - Written January, 2002 by Justin Seyster (thanks for releasing into public domain, Justin).
import guicomponents.*;
GWSlider slider;
GButton button;
GCheckbox checkbox;
int GRAIN=3;
int pwidth=600;
int pheight=600;
PFont font;

void setup()
{
    size(600, 650); 
    background(255);
    noStroke();
    colorMode(RGB, 1.0, 1.0, 1.0);
    font= loadFont("ArialMT-10.vlw");
    textFont(font);
    G4P.setFont(this, "Arial", 10);
    checkbox= new GCheckbox(this, "Colour", 375, 615, 100);
    checkbox.setSelected(true);
    slider = new GWSlider(this,20,615,260);
    slider.setValue(GRAIN);
    button = new GButton(this, "Generate", 470, 610 ,100,30);
    drawPlasma(pwidth, pheight);
}
         
void draw()
{
    colorMode(RGB, 1, 1, 1);
    fill(1, 1, 1);
    rect(0, 600, width, 50); 
    fill(0,0,0);
    text("graininess", 313, 624); 
}

float displace(float num)
{
  float max = num / (float)(pwidth + pheight) * GRAIN;
  return random(-0.5, 0.5)* max;
}

//Returns a color based on a color value, c.
color computeColor(float c)
{		
  float Red = 0;
  float Green = 0;
  float Blue = 0;
		
  if (c < 0.5)
  {
    Red = c * 2;
  }
  else
  {
    Red = (1.0 - c) * 2;
  }
  if (c >= 0.3 && c < 0.8)
  {
    Green = (c - 0.3) * 2;
  }
  else if (c < 0.3)
  {
     Green = (0.3 - c) * 2;
  }
  else
  {
     Green = (1.3 - c) * 2;
  }
		
  if (c >= 0.5)
  {
     Blue = (c - 0.5) * 2;
  }
  else
  {
     Blue = (0.5 - c) * 2;
  }
		
   return color(Red, Green, Blue);
}
	
//This is something of a "helper function" to create an initial grid
//before the recursive function is called.	
void drawPlasma(float w, float h)
{
   float c1, c2, c3, c4;
		
   //Assign the four corners of the intial grid random color values
   //These will end up being the colors of the four corners of the applet.		
   c1 = random(0,1);
   c2 = random(0,1);
   c3 = random(0,1);
   c4 = random(0,1);
   divideGrid(0.0, 0.0, w , h , c1, c2, c3, c4);
}
	
	//This is the recursive function that implements the random midpoint
	//displacement algorithm.  It will call itself until the grid pieces
	//become smaller than one pixel.	
void divideGrid(float x, float y, float w, float h, float c1, float c2, float c3, float c4)
{

   float newWidth = w / 2;
   float newHeight = h / 2;

   if (w < 1.0 || h < 1.0)
   {
     //The four corners of the grid piece will be averaged and drawn as a single pixel.
     float c = (c1 + c2 + c3 + c4) / 4.0;
     if(checkbox.isSelected())
     {
       colorMode(RGB, 1.0, 1.0, 1.0);  
       set((int)x, (int)y, computeColor(c));
     }
     else 
     {
       colorMode(RGB, 255);
       set((int)x, (int)y, color(c*255));
     }
   }
   else
   {
     float middle =(c1 + c2 + c3 + c4) / 4.0 + displace(newWidth + newHeight);      //Randomly displace the midpoint!
     float edge1 = (c1 + c2) / 2.0;	//Calculate the edges by averaging the two corners of each edge.
     float edge2 = (c2 + c3) / 2.0;
     float edge3 = (c3 + c4) / 2.0;
     float edge4 = (c4 + c1) / 2.0;

     //Make sure that the midpoint doesn't accidentally "randomly displaced" past the boundaries!
     if (middle <= 0)
     {
       middle = 0;
     }
     else if (middle > 1.0)
     {
       middle = 1.0;
     }

     //Do the operation over again for each of the four new grids.                  
     divideGrid(x, y, newWidth, newHeight, c1, edge1, middle, edge4);
     divideGrid(x + newWidth, y, newWidth, newHeight, edge1, c2, edge2, middle);
     divideGrid(x + newWidth, y + newHeight, newWidth, newHeight, middle, edge2, c3, edge3);
     divideGrid(x, y + newHeight, newWidth, newHeight, edge4, middle, edge3, c4);
   }
}

void handleButtonEvents(GButton button) 
{
  drawPlasma(pwidth, pheight);
}	

void handleSliderEvents(GSlider slider)
{
  GRAIN=slider.getValue();
}

	
	
	

