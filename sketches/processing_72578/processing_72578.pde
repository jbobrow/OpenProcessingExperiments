


float size = 1.0;
float speed = 0.1;
int numSquares = 20;


void setup(){
  size(400, 400);
  background(255);
}


void draw()
{    
    // increase or decrease size
    size = size + speed;
    // if size too big, decrease it, and vice versa
    if(size > 10.0 || size < 1.0) speed = -1. * speed;
    
    // draw squares
    for(int i = 0; i < numSquares; i++)
    {
         fill(i * 255 / numSquares); // makes "numSquares" shades of gray
         rect(i * size, i * size, i * size, i * size); // location and size controlled by "size"
    }

}

