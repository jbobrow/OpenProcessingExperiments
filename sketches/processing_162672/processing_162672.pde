
float curdeg = 0;


void setup()
{
  size(600,600);
  frameRate(60);
}

void draw()
{
  background(255);
  translate(width/2,height/2);
  
  ellipse(0,0,400,400);
  
 
  curdeg += 6;
  float rad = radians(curdeg);
  float x = radius * cos(rad);
  float y = radius * sin(rad);
  ellipse(x,y,20,20);
  fill(random(255),random(255),random(255));
  
  
  float rad2 = radians(curdeg) / 60;
  float x2 = radius * cos(rad2) /1.5;
  float y2 = radius * sin(rad2) /1.5;
  ellipse(x2,y2,30,30);
  fill(32,122,88,70);
  
  float rad3 = radians(curdeg) / 720;
  float x3 = radius * cos(rad3) /2;
  float y3 = radius * sin(rad3) /2;
  ellipse(x3,y3,50,50);
  fill(99,243,1,50);
    
  
  
}

