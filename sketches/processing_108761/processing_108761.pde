
//Homework 3, 60-257
//Copyright 2013 Stephanie Cheung and the mysterious hooded figures
void setup()
{
  colorMode(HSB);
  size(600,600);
  smooth();
}

  float angle=0;
  float c = 300; //this will be the center of the circles
  float magic = 0.002; //determines speed of circle orbits

void draw()
{
  float c2 = abs(mouseX-c); //defines the radius of the circles
  background((mouseX/2),(mouseY/3),200); //background color depends on Y position of the mouse
  fill(0, 0,mouseX/2,mouseY/2); //determines color of small circles depending on Y position of mouse
  for(float i=0; i<2*PI; i=i+0.1*PI){ //for loop changes the distribution of circles 
  ellipse(c+(cos(angle)*c2), c+(sin(angle)*c2), 10,10); 
  ellipse(c-(cos(angle)*c2), c-(sin(angle)*c2), 10,10);
  ellipse(c-(cos(angle+.5*PI+i)*c2), c-(sin(angle+.5*PI+i)*c2), 10,10);
  ellipse(c+(cos(angle+.5*PI+i)*c2), c+(sin(angle+.5*PI+i)*c2), 10,10);
  
  ellipse(c+0.6*(cos(angle+i)*c2), c+(sin(angle)*c2+i), 10,10); 
  ellipse(c-0.6*(cos(angle+i)*c2), c-(sin(angle)*c2+i), 10,10);
  ellipse(c-(cos(angle+.5*PI+i)*c2), c-0.6*(sin(angle+.5*PI+i)*c2), 10,10);
  ellipse(c+(cos(angle+.5*PI+i)*c2), c+0.6*(sin(angle+.5*PI+i)*c2), 10,10);
  
  ellipse(c+0.5*(cos(angle+i)*c2), c+0.5*(sin(angle+i)*c2), 10,10);
  ellipse(c-0.5*(cos(angle+i)*c2), c-0.5*(sin(angle+i)*c2), 10,10);
  
  ellipse(c+0.75*(sin(angle+.5*PI)*c2), c+0.75*(cos(angle+.5*PI)*c2), 10,10);
  ellipse(c-0.75*(sin(angle+.5*PI)*c2), c-0.75*(cos(angle+.5*PI)*c2), 10,10);
  
  ellipse(c+1.5*(cos(angle+.5*PI)*c2), c+1.5*(sin(angle+.5*PI)*c2), 10,10);
  ellipse(c-1.5*(cos(angle+.5*PI)*c2), c-1.5*(sin(angle+.5*PI)*c2), 10,10);
  
  ellipse(c+0.25*(sin(angle+PI)*c2), c+0.25*(cos(angle+PI)*c2), 10,10);
  ellipse(c-0.25*(sin(angle+PI)*c2), c-0.25*(cos(angle+PI)*c2), 10,10);
  
  ellipse(c+2*(cos(angle)*c2), c+(sin(angle)*c2), 10,10); 
  ellipse(c-2*(cos(angle)*c2), c-(sin(angle)*c2), 10,10);
  ellipse(c-2*(cos(angle+.5*PI+i)*c2), c-(sin(angle+.5*PI+i)*c2), 10,10);
  ellipse(c+2*(cos(angle+.5*PI+i)*c2), c+(sin(angle+.5*PI+i)*c2), 10,10);
  
  ellipse(c+(cos(angle)*c2), c+2*(sin(angle)*c2), 10,10); 
  ellipse(c-(cos(angle)*c2), c-2*(sin(angle)*c2), 10,10);
  ellipse(c-(cos(angle+.5*PI+i)*c2), c-2*(sin(angle+.5*PI+i)*c2), 10,10);
  ellipse(c+(cos(angle+.5*PI+i)*c2), c+2*(sin(angle+.5*PI+i)*c2), 10,10);
  
  angle = angle+magic; //updates the position of the little circles
  }
}

void mousePressed(){
  magic = random(0.0005,0.02); //changes the speed to a random number when the mouse is clicked
}



