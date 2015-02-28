
// A variant of a Sketch "Plasma Fractal" by Giles Whitaker 
// that he'd adapted from Justin Seyster java version 

float PHI = (1 + sqrt(5))/2;
int DIM = ceil(500 * PHI); // improve divisability by golden ratio

void setup()
{
    size(DIM, DIM); 
    noStroke();
    drawPlasma(width, height);
}
         
void draw()
{
  if (frameCount % 13 == 0) drawPlasma(width, height);
}

float displace(float num)
{
  float max = num / (width  + height) * 3;
  return random(-0.5, 0.5)* max;
}

//Returns a color int based on a color value, c. -(concise version)-
int computeColor(float c)
{		
  float r = (c < 0.5)? c : 1.0 - c;
  float gr = (c >= 0.8)? 1.3 - c : (c < 0.3)? 0.3 - c : c - 0.3;
  float b = (c < 0.5)? 0.5 - c: c - 0.5;		
 // Note using custom bit shift for r, gr & to do doubling
  int col = (255 << 24)|(floor(r * 255) << 17)|(floor(gr * 255) << 9)| floor(b * 255) << 1;
  return col; 
}
	
//This is something of a "helper function" to create an initial grid
//before the recursive function is called.	
void drawPlasma(float w, float h)
{
   noiseSeed(8); // different seeds effects the noise
   divideGrid(0.0, 0.0, w , h , noise(w, h), noise(w, h), noise(w, h), noise(w, h));
}
	
void divideGrid(float x, float y, float w, float h, float c1, float c2, float c3, float c4)
{
   float newWidth = w / 2;
   float newHeight = h / 2;
   float c = (c1 + c2 + c3 + c4) / 4.0;
   if (w < 1.0 || h < 1.0)
   {        
     set((int)x, (int)y, computeColor(c));
   }
   else
   {
     float middle = c + displace(newWidth + newHeight);      //Randomly displace the midpoint!
     float edge1 = (c1 + c2) / 2.0;	// Calculate the edges by averaging the two corners of each edge.
     float edge2 = (c2 + c3) / PHI;     // for more sparse but more fractal like behavior
     float edge3 = (c3 + c4) / PHI;     // set each divisor to PHI
     float edge4 = (c4 + c1) / 2.0;

     //Make sure that the midpoint doesn't accidentally "randomly displaced" past the boundaries!
     middle = (middle <= 0) ? 0 : (middle <= 1) ? middle : 1;     
     //Do the operation over again for each of the four new grids.                  
     divideGrid(x, y, newWidth, newHeight, c1, edge1, middle, edge4);
     divideGrid(x + newWidth, y, newWidth, newHeight, edge1, c2, edge2, middle);
     divideGrid(x + newWidth, y + newHeight, newWidth, newHeight, middle, edge2, c3, edge3);
     divideGrid(x, y + newHeight, newWidth, newHeight, edge4, middle, edge3, c4);
   }
}





	
	
	


