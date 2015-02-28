
int x1, y1;
float x2, y2;
int trans;
void setup()
{
  size(400, 400);
  background(255);
  ellipseMode(CENTER);
  strokeWeight(2);
  smooth();
  x1 = 25;
  y1 = 25;
  x2 = 125;
  y2 = 125;
  trans = 5;
};
void draw ()
{
  if(y1 == 25 && x1 <= width-25)
    {
      x1++;
      y1 = 25;     
      x2+=0.42;
      y2 = 125;  
     };
    
  if(x1 >= width-25 && y1 >= 25)
    {
      x1 = width-25;
      y1++;
      x2 = width-125;
      y2+=0.42;      
     };
      
  if(x1 <= width-25 && y1 >= height-25)
    {
      y1 = height-25;
      x1--;   
      y2 = height-125;
      x2-=0.42;        
     };
  if(y1 <= height-25 && x1 <= 25)
    {
      x1 = 25;
      y1--;  
      x2 = 125;
      y2-=0.42;       
     };

    noFill(); 
//----------------------  
//lineas que van de las esquinas a los circulos
stroke(255, 128, 0, trans);
line(x1, y1, 0, 0);
line(x2, y2, 0, 0);
line(width-x1, height-y1, 0, 0);
line(width-x2, height-y2, 0, 0);
//---
stroke(255, 0, 0, trans);
line(x1, y1, 0, height);
line(x2, y2, 0, height);
line(width-x1, height-y1, 0, height);
line(width-x2, height-y2, 0, height);
//---
stroke(255, 0, 0, trans);
line(x1, y1, width, 0);
line(x2, y2, width, 0);
line(width-x1, height-y1, width, 0);
line(width-x2, height-y2, width, 0);
//---
stroke(255, 128, 0, trans);
line(x1, y1, width, height);
line(x2, y2, width, height);
line(width-x1, height-y1, width, height);
line(width-x2, height-y2, width, height);
  
  stroke(255, 255, 128, trans);   
  ellipse(x1, y1, 50, 50);
  ellipse(x1, y1, 25, 25);
  ellipse(x2, y2, 50, 50);
  ellipse(x2, y2, 25, 25);
  ellipse(width-x1, height-y1, 50, 50);
  ellipse(width-x1, height-y1, 25, 25);
  ellipse(width-x2, height-y2, 50, 50);
  ellipse(width-x2, height-y2, 25, 25);
  
 line(x1, y1, width/2, height/2);
line(x2, y2, width/2, height/2);
line(width-x1, height-y1, width/2, height/2);
line(width-x2, height-y2, width/2, height/2); 
  
  //------------------
};

