
float x_value;
float w=1;
void setup()
{
  size(400,400);
  background(0);
  stroke(255);
}

void draw()
{
  strokeWeight(w);
  x_value = (x_value+20) % 400;
  line(x_value, 100, x_value+15, 300);
}

void keyPressed()
{
  if ( key == 'x' )
  {
    stroke(random(255),random(255),random(255));
  }
  if(key=='r'){
  stroke(255,0,0);
}
if(key=='g'){
  stroke(0,255,0);
}
if (key=='b'){
  stroke(0,0,255);
}
if(key=='f'){
  
w=w+1;}  
  
  
}

