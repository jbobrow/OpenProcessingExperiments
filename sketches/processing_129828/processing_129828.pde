
float c_x[] = {};       
float c_y[] = {};       
float move_x[] = {};    
float move_y[] = {};
void setup()
{
 size(800,600);
 noStroke();
}
void draw()
{
   background(0);
   fill(255);
   int i = 0;
   while(i < c_x.length)
   {
     if(c_y[i] > height+.20)
     {
     c_x[i] = width+100000000;
     c_y[i] = height+100000000;
     move_x[i] = 0;
     move_y[i] = 0;
     }
   ellipse(c_x[i],c_y[i],30,30);
   c_x[i] = c_x[i] + move_x[i];
   c_y[i] = c_y[i] + move_y[i];
 if(c_x[i]>width)
{
 c_x[i] = width;
 move_x[i] = -move_x[i];
}
if(c_x[i] < 0)
{
 c_x[i] = 0;
 move_x[i] = -move_x[i];
}
if(c_y[i] < 0)
{
 c_y[i] = 0;
 move_y[i] = -move_y[i];
}
 if(c_y[i] > height-30)
 {
   if(c_x[i] < mouseX+75 && c_x[i] > mouseX)
  {
   c_y[i] = height-30;
   move_y[i] = -move_y[i];
  }
 }
   i = i + 1; 
   }
   padle();
}
void mousePressed()
{
c_x = append(c_x,mouseX);
c_y = append(c_y,mouseY);
move_x = append(move_x,random(6,10));
move_y = append(move_x,random(6,10));
}
void padle()
{
fill(255);
rect(mouseX,height-15,75,10); 
}







