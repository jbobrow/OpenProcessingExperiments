
int newX = 0;

float bigness = 10;
 
void setup(){
  size(800,400);
  background(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));

   
}
 
float ballxpos = 0;
float ballypos = random(height);

void draw(){
 
noStroke();

ellipse(ballxpos,ballypos,100,100);

ballxpos = ballxpos + 10;

if(ballxpos>width+100)
{
  ballxpos = 0;
  ballypos = random(height);
  fill(random(255),random(255),random(255));

  
}
}



