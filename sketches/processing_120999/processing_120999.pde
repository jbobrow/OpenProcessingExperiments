
float counter = 0; 

void setup()
{
  size(400, 400); 
  colorMode(HSB, 360, 100, 100); 
}

void draw() 
{
  float h = map(sin(counter), -1, 1, 0, 90); 
  float b = map(sin(counter), -1, 1, 25, 50); 
  background(b, 100, 100); 
  
  translate(0, height/2); 
   for (int i=0; i<10; i++)
  {
  pushMatrix(); 
  translate(i*50, sin(counter+i)*20);  
  colorMode(HSB, 360, 100, 100); 
  fill(0, 98, 99); 
  noStroke();
  ellipse(0, 0, 40, 40); 
  popMatrix(); 
  counter -= 0.01;
  }
  {
  translate(width/2, 0); 
  pushMatrix(); 
  translate(sin(counter)*100, cos(counter)*100);   
  colorMode(HSB, 360, 100, 100); 
  fill(243, 98, 99); 
  noStroke();
  ellipse(0, 0, 20, 20); 
  popMatrix(); 
  counter += 0.01;
}
}
