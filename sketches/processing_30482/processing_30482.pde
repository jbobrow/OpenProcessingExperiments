
size (600, 300); 
background (255);  
smooth(); 

noStroke();
 fill(120,100,100);
  
int grid = 13; 
int grid2 = 35;
int stepSizeH = (int) (height/ grid); 
int stepSizeW = (int) (width/ grid2+5);
 
for ( int h = 0; h < height+100; h = h + stepSizeH)
{
 rectMode(CENTER);
  for ( int w = 0; w < width+100; w = w + stepSizeW)
  {
    
    float quadrado = 90;
       fill (random (255));
       stroke (0);
         rect(w+w, h+h, quadrado, quadrado);
         noFill();
         noStroke();
 
     }
        
    }

    
float x1;
float x2;
float y1;
float y2;

int step;

x1 = 20;
x2 = width-10;

y1 = 10;
y2 = height-10;

step = 19;


fill(220,9,9,150);
noStroke();

float stepSize = 17.0/ step;
for ( float tx = 0; tx<= 50;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<=200;  ty = ty + stepSize)
      {
          
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          
        
          println(x);
                
          ellipse ( x,y, 80,15);
         
      }
}

saveFrame("4.png");

  
                
                
