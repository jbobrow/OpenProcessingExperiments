
void setup()
{
  size(500, 500);

  background(255, 204, 0);
}

float x = 56;
float y = 46;
float b = 55;

float s = 10;

void draw(){
 //background(255, 204, 0);
  ellipse(x, y, b, b);
  ellipse(y, x, b, b);
  ellipse(x, x, b, b);
  ellipse(y, y, x, x);
  
  x = x + s;
    
   if (x > 490)
     {
     x = 0;
     s = random(30);
     }
      
     
   }
