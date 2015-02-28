
float counter1 = 0;
float counter2 = 0;
float counter3 = 0;
 

 
void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);

}
 
void draw()
{
  background(#FAFF00);
 
  translate(200, 450);

  pushMatrix();
  float h = map(sin(counter3), -3, 3, 0, 360);
  background(h, 100, 100);

   translate(0,cos(counter1)*50);
   ellipse(0, 0, 40, 40);
   translate(50,sin(counter2)*50);
   ellipse(0, 0, 40, 40);
  

   translate(100,cos(counter1)*50);
   ellipse(0, 0, 40, 40);
   translate(-200,cos(counter2)*50);
   ellipse(0, 0, 40, 40);
  
  
   translate(-50,cos(counter1)*50);
   ellipse(0, 0, 40, 40);
   translate(-50,cos(counter2)*50);
   ellipse(0, 0, 40, 40);
 
  popMatrix();
  

 
  counter1 += 0.01; 
  counter2 += 0.02;
  counter3 +=0.01;
}

