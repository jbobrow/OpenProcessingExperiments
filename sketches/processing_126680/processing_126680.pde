


void setup()
{
  size(1800, 1000); 
}


    float zoff = 0.0;
    float xoff = 0.0;
    float yoff = 0.0;
 
PFont font;   
    float text1;
    float text2;
    float text3;
    
    float q;
        
void draw() 
{
    background(#FFFF99);
    // white background as hexidecimal
    
    
 // the lower the value after the + the slower the changes
  zoff = zoff + 0.007;
  xoff = xoff + 0.006;
  yoff = yoff + 0.005;
  
  float v = noise(zoff) * width;
  float n = noise(xoff) * width;
    float a = noise(yoff) * width;
    
      float v2 = noise(zoff) * width/2;
  float n2 = noise(xoff) * width/2;
    float a2 = noise(yoff) * width/2;
  
  rectMode (CENTER);
  ellipseMode (CENTER);
 
smooth (); 

translate (width/2, height/2);


// best value for zoom.. keep this!!!!!
q = q + 0.05;

scale (q); 
 
 
 
//scale (1);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);




scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);




scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);




scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);




scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);


scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);



scale (0.90);
rotate (50);

stroke (#000000);
fill (#000000);
ellipse(n/2, a/2, 30 + a2/10, 30 + a2/10);

line(n/2, a/2, v/2 + 60, a);

line(n/2, a/2, n, v/2 + 100);

line(n/2, a/2, n + 30, v/2 + 100);

line(n/2, a/2, a, v/2 + 100);

line(n/2, a/2, v + 100, v/2 + 100);

line(n/2, a/2, n + v2, v/2 + 100);


line(n/2, a/2, -v/2 + 60, -a);

line(n/2, a/2, -n, -v/2 + 100);

line(n/2, a/2, -n + 30, -v/2 + 100);

line(n/2, a/2, -a, -v/2 + 100);

line(n/2, a/2, -v + 100, -v/2 + 100);

line(n/2, a/2, -n + v2, -v/2 + 100);

//PFont font;
//font = loadFont("Serif-100.vlw"); 
//textFont(font); 
//textMode(CENTER);
//text(a, 620, 630);
//text(n, 620, 740);
   
 

}
