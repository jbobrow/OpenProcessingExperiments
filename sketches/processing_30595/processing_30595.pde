

                
             size (1280,720);
background (255);  
noStroke();

float pointSize = 12;

int numberPoins = 10000; 
int numShapes = 6; 
int stepSize = (int) (height/ numShapes); 

for ( int h = 0; h < height; h = h + stepSize)
{
 
       stroke(random(255),random(255),random(255));
       for ( int i = 0; i < numberPoins; i = i +1)
        { 
          strokeWeight( random(pointSize)); 
          point (random(width), random(h,h+stepSize));
        }
      }
//--------------------------------------------------------------------------
float x1, y1; 
float x2, y2; 


float radius =  250;
float  degree = 190;


stroke(0);

for ( int i = 0 ; i < 360; i++){
 
  degree = degree -2; 
  println("anglulo = " + degree%360);
 
// - rad inverte
float rad = - radians(degree); 
x2 = radius * cos(rad);
y2 = radius * sin (rad);

// draw the line
stroke(3);
line (width/2, height/2,width/2+x2, height/2+y2);

}

saveFrame("tut6.png");   
