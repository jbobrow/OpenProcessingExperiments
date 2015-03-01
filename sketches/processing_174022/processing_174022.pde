
float counter = 0;

void setup()
{
  size(500,500);
 
}
void draw()
{
  background(0);
 translate(mouseX,0);
 pushMatrix(); 
 translate(0,height/2);
//translate(mouseX,height/2);
   colorMode(HSB,360,100,100);
   float helligkeit = map(sin(counter/80),-1,1,20,100);
   float farbe = map(sin(counter/80),-1,1,10,45);
 //scale(1+0.1*sin((millis()/100.0))); 
  
  for (int i=0; i<360; i+=15)
  {
    
    stroke(farbe,100,helligkeit); 
    rotate(radians(i));
    
    float radius = 150+10*sin((millis()/10.0));
    line(counter,0,radius,0);
    
    
  }

for (int i=25; i<360; i+=15)
  {
    stroke(255,251,173); 
    rotate(radians(i));
    
    float radius = 150+10*cos((millis()/50.0));
    line(radius,0,radius,0);
    
  }
 popMatrix();
 
  pushMatrix();
  translate(-width/2,0);
  for (int i=0; i<20; i++)
  {
    ellipse(random(100,400),random(100,400),2,2);
  }
  popMatrix();
  
  if (counter<400)
  {
  counter += 5;
  }
  else
  {
    counter = 0;
  }
  stroke(360,10,100);
  line(0, height+10,0,height-counter+180);
}

