
// happens just once

void setup() 
{  
  size(1024,512);
  background(0);
  smooth();
}

// happens over & over

void draw() 
{
  stroke(mouseX/2,mouseY/2,(mouseX-mouseY)/2,192);
  strokeWeight(6);
  line(0,0,mouseX,mouseY);
  line(512,0,mouseX,mouseY);
  line(0,512,mouseX,mouseY);
  line(512,512,mouseX,mouseY);
  
  
  
  stroke(mouseX/2,mouseY/2,(mouseX-mouseY)/2,192);
  line(1024,512,1024-mouseX,mouseY);
  line(512,512,1024-mouseX,mouseY);
  line(1024,0,1024-mouseX,mouseY);
  line(512,0,1024-mouseX,mouseY);
  
}


