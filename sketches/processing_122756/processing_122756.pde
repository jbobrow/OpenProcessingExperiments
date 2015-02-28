
float counter = 0;
 
void setup()
{
  size(500, 500);
  colorMode(HSB, 360, 100, 100);
 
}
 
void draw()
{
  if(hour()<=6)
  {
    background(25); 
  }
  else if(hour() <=18)
  {
    background(0, 0, 99); 
  }
  else if (hour() >=19)
  {
    background (25); 
  }
  
    translate( width/2, height/2); 
    pushMatrix(); 
    float h = map(sin(counter), -1, 1, 30, 60);
    fill(h, 100, 100);
    noStroke();  
    popMatrix(); 
    
    counter += 0.005;
    
    pushMatrix(); 
    translate(0,0); 
    fill(h, 100, 100); 
    noStroke(); 
    ellipse(0, 0, 425, 425); 
    popMatrix(); 
    
    pushMatrix();
    float s = map(sin(counter), -1, 1, 0, 720);
    fill(s, 100, 100);
    noStroke();
    rotate(radians(s));
    translate(0, 0); 
    rect(0, 0, 100, 2);
    popMatrix(); 

    counter +=0.005;


float sec = map(second(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(sec));
translate(0, -235);
fill(s, 100, 100);
noStroke(); 
ellipse(0, 0, 10, 10);
popMatrix();
 
 
float min = map(minute(), 0, 60, 0, 360);
pushMatrix();
rotate(radians(min));
translate(0, -175);
fill(0, 0, 99); 
noStroke(); 
ellipse(0, 0, 20, 20);
popMatrix();
  

float std = map(hour(), 0, 12, 0, 360); 
pushMatrix(); 
rotate( radians(std)); 
translate(0, -70); 
fill(0, 0, 99); 
noStroke(); 
ellipse(0, 0, 30, 30); 
popMatrix(); 
}

