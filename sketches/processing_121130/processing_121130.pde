
float counter = 0;
  
void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}
  
void draw()
{
  background(200);
    
  translate(width/2, height/2);
  
    
  for (int i=0; i<10; i++)
  {
    pushMatrix();
     
     
  strokeWeight(1.5);
     
  float mx = map(mouseX,-50,500,0,500);
   
      translate(sin(counter)*50,cos(counter)*150 );
 
    translate(cos(counter+i)*mx, sin(counter-i)*mouseY);
   
   float h = map(sin(counter), 1 ,-1,0,140);
  float g = map(sin(counter), 1 ,-1,280,380);
    
    
   fill(h,100,100);
    rect(0, 0, 20,20);
     
translate(100, 0);
    translate(cos(counter-i)*mx, sin(counter-i)*mouseY);
   
   
 
 
   
   fill(g,100,100);
   rect(0, 0, 20,20);
    
translate(-200, 0);
     translate(cos(counter-i)*mx, sin(counter-i)*mouseY);
   
   
   fill(g,100,100);
   rect(0, 0, 20,20);
     
    popMatrix();
      
    counter += 0.005;
  }
}
