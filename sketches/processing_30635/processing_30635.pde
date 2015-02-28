
size (800, 600);
background (255); 
smooth(); 

float n1;
float n2;

int step;
 
n1 = 0;
n2 = width;
step = 5;




 fill(227,214,169);
noStroke();


float stepSize = 10.0/ step;
for ( float t = 0; t<= 10;  t = t + stepSize)
{
         
          float interpolant = n1 + (t*0.1) *(n2 - n1);
         
          println(interpolant);
          println(t);
        
          quad (random(width), random(height), random(width), random(height), random (width), random(height), random(width), random(height));
}


float x1;
float x2;
float y1;
float y2;



x1 = 100;
x2 = width-100;

y1 = 100;
y2 = height-100;

step = 10;

strokeWeight(10);
stroke(227,206,128); 
point(x1,y1);


stroke(167,144,59);
point (x2, y2);

fill(167,144,59);
noStroke();







for ( float tx = 0; tx<= 10;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
        
          println(x);
       
          ellipse ( x,y, 40,40);
          
      }
}

                
                
