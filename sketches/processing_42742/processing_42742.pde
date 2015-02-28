
float r;
float easedR=0;
float easing = 0.04;

void setup()
{
  size(600,400);
  smooth();
  rectMode(CENTER);
}

void draw()
{
  background(255);
  expload(mouseX);
}


void expload(float mx)
{
  //Map the incoming mouseX data to a smaller range
  r = map(mx, 0,width, 0,200);
  //Easing on r. Instead of r, we'll use easedR
  easedR += (r - easedR) * easing;
  
  translate(width/2,height/2);
  for(int i=0; i<=360; i+=10)
  { 
     pushMatrix();
     float x = easedR * cos(radians(i));
     float y = easedR * sin(radians(i));
     //Try commenting out translate, and put
     //x and y in the ellipse() function. Note the difference.
     translate(x,y);
     //rotate( radians(easedR*i/50.0));
     //rect(0,0, 30,55);
     ellipse(0,0, 20,20);
     popMatrix();
  }
  
  
}

