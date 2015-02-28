
float counter = 0;
 
void setup()
{
  size(800, 800);
  colorMode(HSB, 360, 100, 100);
}
 
void draw()
{
  background(0, 0, 100);
   
  translate(0, height/2);
  //translate(width/2, height/2);
   
  for (int i=0; i<10; i++)
  {
    pushMatrix();
    translate(i*90, sin(counter+i)*100); 
    float h = map(sin(counter+i), -1, 1, 100, 150);
    fill(h, 100, 100);
    ellipse(0, 0, 40, 40);
    popMatrix();
    
    pushMatrix();
    translate(i*80, sin(counter+i)*200);
    float c = map(sin(counter+i), -3, 3, 150, 300);
    fill(c, 100, 100);
    ellipse(10, 0, 40, 40);
    popMatrix();
     
    counter += 0.001;
  }
}
