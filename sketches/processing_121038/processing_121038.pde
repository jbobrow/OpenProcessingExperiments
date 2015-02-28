
void setup()
{
  size(400, 400);
  background(0);
  colorMode(HSB, 360, 100, 100);
  
}

float counter = 0;

void draw()
{
  background(360,100,0);
  
   fill(0,0,100);
   noStroke();
  ellipse(width/2, height/2, 80, 80);
  translate (width/2, height/2); 
 
 
  pushMatrix(); 
  translate(cos(counter)*50, sin(counter)*50);    
  float c = map(sin(counter), 1, -1, 240, 360); 
  fill (c, 100, 100); 
  ellipse(0, 0, 20, 20);
  popMatrix();
  
  pushMatrix(); 
  translate(cos(counter)*50, tan(counter)*50);    
  float d = map(sin(counter), 1, -1, 240, 360); 
  fill (d, 100, 100); 
  ellipse(0, 0, 20, 20);
  popMatrix();
  
  pushMatrix(); 
  translate(cos(counter)*50, tan(counter)*-50);    
  float a = map(sin(counter), 1, -1, 240, 360); 
  fill (a, 100, 100); 
  ellipse(0, 0, 20, 20);
  popMatrix();
  
  counter += 0.05;

}

