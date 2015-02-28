
void setup()
 
{
background(255, 204, 0);
 
size(400,400); // Changes the size of the canvas
} // void setup
 
void draw()
 
{
 
for( int i=0; i<70; i++){ // Changes the speed in which pixels are created
 
point(mouseX + random(51), mouseY + random(201)); // This changes the size of the brush
 
} // For loop.
 
} // void draw.
