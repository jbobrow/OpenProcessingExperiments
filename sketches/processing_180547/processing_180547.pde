
RotatingCircle[] circles;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  background(0);
  
  circles = new RotatingCircle[5];
  float a = 0;
  for(int i = 0; i < 5; i++)
  {
    circles[i] = new RotatingCircle(a);
    a+= 5;
  }
}
 
void draw(){
   background(0);
   
   for(RotatingCircle circle : circles)
   {
     circle.update();
   }
   
   fill(255);
   ellipse(width/2,height/2,180,180);
   fill(0);
   ellipse(width/2,height/2,160,160);
}



class RotatingCircle{

float a = 1;

  RotatingCircle(float start)
 {
   a = start;
 }
 
 void update()
 {
 float x1 = sin(a) * 100;
 float y1 = cos(a) * 100;
 
  fill(255);
  ellipse ((width/2)+x1, (height/2)+y1, 140,140);   
  
  fill(0);
  
  ellipse ((width/2)+x1, (width/2)+y1, 120,120);
  
  line((width/2)+x1, (width/2)+y1, width/2,height/2);
  
 
  a = a + 0.01;
 }

}

