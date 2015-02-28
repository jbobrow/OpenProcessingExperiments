




float size = 1.0;
float speed = 0.1;
int numBezier = 40;
int weight = 0;

 
void setup(){
  size(500, 500);
  background(255);
  smooth();
}
 
 
void draw()
{   
  size = size + speed;
  if(size > 10.0 || size < 0.1) speed =- 1 * speed;
  for(int i = 0; i < numBezier; i++)
    {
      ellipse(0, 0, i * size, i * size);
      ellipse(300, 100, i * size, i * size);
      ellipse(random(0, 50), 500, 400, 400);
      bezier(500,500 ,i *size+400, 300, i *size+200 ,100,0, 0);
      bezier(500,500 ,i *size, 300, i *size+200 ,100,i *size, 0);
 
  

         
    }
       if(mouseX % 4 == 0) weight = 1;
  else if(mouseX % 4 == 1) weight = 4;
  else if(mouseX % 4 == 2) weight = 8;
  else if(mouseX % 4 == 3) weight =16;
  strokeWeight(weight);
  line(mouseX, mouseY, mouseX, mouseY);
}


