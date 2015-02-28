
size (700,700); // set up window size
background (0);  // define background color
smooth(); // define the render to be smooth (anti-alias)

// given two coordinates n1 and n2
float x1;
float x2;
float y1;
float y2;

// you want to generate equal spacing between them defined by a paremeter:
int step;
 
x1 = 10;
x2 = width-10;

y1 = 10;
y2 = height-10;

step = 8;

strokeWeight(10);
stroke(255,188,3); // n1
point(x1,y1);

stroke(255); // n2
point (x2, y2);

fill(255,188,3);
noStroke();
// calculto do Interpolante
// t is a control parameter that varies between 0 and 1

// the loop goes from o to 1, so the increment parameter has to be scaled
// 10 / step is the correct increment for the desired number of interpolations
float stepSize = 6.0/ step;
for ( float tx = 0; tx<= 40;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          // float interpolant = n1 + t*(n2 - n1); // this is the normal equation
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          // I am using (t*0.1), because the loop goes from 0 to 10 and we  need to varie from 0 to 1
        
          println(x);
          //println(tx);
       
          ellipse ( x,y, 50,50);
          
      }
}



strokeWeight(10);
stroke(255); // n1
point(x1,y1);
for ( float tx = 0; tx<= 40;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          // float interpolant = n1 + t*(n2 - n1); // this is the normal equation
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          // I am using (t*0.1), because the loop goes from 0 to 10 and we  need to varie from 0 to 1
        
          println(x);
          //println(tx);
       
          ellipse ( x,y, 25,25);
          
      }
}



strokeWeight(3);
stroke(0); // n1
point(x1,y1);
for ( float tx = 0; tx<= 40;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          // float interpolant = n1 + t*(n2 - n1); // this is the normal equation
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          // I am using (t*0.1), because the loop goes from 0 to 10 and we  need to varie from 0 to 1
        
          println(x);
          //println(tx);
       
          ellipse ( x,y, 25,25);
          
      }
}


strokeWeight(10);
stroke(255); // n1
point(x1,y1);
for ( float tx = 0; tx<= 40;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          // float interpolant = n1 + t*(n2 - n1); // this is the normal equation
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          // I am using (t*0.1), because the loop goes from 0 to 10 and we  need to varie from 0 to 1
        
          println(x);
          //println(tx);
       
          ellipse ( x,y, 25,25);
          
      }
}



strokeWeight(3);
stroke(0); // n1
point(x1,y1);
for ( float tx = 0; tx<= 20;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          // float interpolant = n1 + t*(n2 - n1); // this is the normal equation
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          // I am using (t*0.1), because the loop goes from 0 to 10 and we  need to varie from 0 to 1
        
          println(x);
          //println(tx);
       
          ellipse ( x,y, 15,15);
          
      }
}


strokeWeight(3);
stroke(0); // n1
point(x1,y1);
for ( float tx = 0; tx<= 20;  tx = tx + stepSize)
{
  for ( float ty = 0; ty<= 10;  ty = ty + stepSize)
      {
          // float interpolant = n1 + t*(n2 - n1); // this is the normal equation
          float x = x1 + (tx*0.1) *(x2 - x1);
          float y = y1 + (ty*0.1) *(y2 - y1);
          // I am using (t*0.1), because the loop goes from 0 to 10 and we  need to varie from 0 to 1
        
          println(x);
          //println(tx);
       
          ellipse ( x,y, 5,5);
          
      }
}

