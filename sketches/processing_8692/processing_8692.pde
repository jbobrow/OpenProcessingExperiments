
// A further variant of a Sketch "Plasma Fractal" by Giles Whitaker  
// that he'd adapted from Justin Seyster java version  
 
 
float PHI = (1 + sqrt(5))/2; 
float inc = random(0,1);

void setup() 
{ 
    size(500, 500);  
    noStroke(); 
    drawPlasma(width, height); 
} 
          
void draw() 
{ 
    drawPlasma(width, height); 
} 
 
float displace(float num) 
{ 
  float max = num / (float)(width + height) * 3; 
  inc+=0.0000003;
  return (noise(inc)-0.5)* max; 
} 
 
//Returns a color int based on a color value, c. 
int computeColor(float c) 
{ 
  float r = 127 + 128 * sin(c * PI); 
  float gr = 127 + 128 * tan(c * PI); 
  float b = 127 + 128 * cos(c * PI);		 
  int col = (255 << 24)|(floor(r) << 16)|(floor(gr) << 8)| floor(b); 
  return col;  
} 
	 
//This is something of a "helper function" to create an initial grid 
//before the recursive function is called.	 
void drawPlasma(float w, float h) 
{ 
   
   divideGrid(0.0, 0.0, w , h , noise(1.0), noise(1.0), noise(1.0), noise(1.0)); 
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
     set((int)x, (int)y, computeColor(c)); 
   } 
   else 
   { 
     float middle =(c1 + c2 + c3 + c4) / 4.0 + displace(newWidth + newHeight);      //Randomly displace the midpoint! 
     float edge1 = (c1 + c2) / PHI;	// Calculate the edges by averaging the two corners of each edge. 
     float edge2 = (c2 + c3) / PHI;     // for more sparse but more fractal like behavior 
     float edge3 = (c3 + c4) / PHI;     // set each divisor to PHI 
     float edge4 = (c4 + c1) / PHI; 
 
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
 
 
 
 
 
 
	 
	 
	 
 

