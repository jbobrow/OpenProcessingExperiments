
color[] strokeColors = {  color(255,0,0),
                           color(0,255,0),
                           color(0,0,255)
                         };
color[] fillColors = {  color(0,0,255),
                         color(255,0,0),
                         color(0,255,0)
                      };

PVector[] positions = new PVector[3];
PVector[] speeds = new PVector[3];
PVector[] sizes = new PVector[3];

void setup()
{
  positions[0] = new PVector(random(width),random(height));
  positions[1] = new PVector(random(width),random(height));
  positions[2] = new PVector(random(width),random(height));
  
  speeds[0] = new PVector(random(1,5),random(1,5));
  speeds[1] = new PVector(random(1,5),random(1,5));
  speeds[2] = new PVector(random(1,5),random(1,5));
            
  sizes[0] = new PVector(random(20,50),random(20,50));
  sizes[1] = new PVector(random(20,50),random(20,50));
  sizes[2] = new PVector(random(20,50),random(20,50));
          
  size(500,500,JAVA2D);
}

void draw()
{
  background(0,0,0);
  positions[0] = updateEllipse(positions[0],speeds[0], -3,3);
  drawEllipse(strokeColors[0],fillColors[0],positions[0], sizes[0]);
  
  positions[1] = updateEllipse(positions[1],speeds[1], -3,3);
  drawEllipse(strokeColors[1],fillColors[1],positions[1], sizes[1]);

  positions[2] = updateEllipse(positions[2],speeds[2], -3,3);
  drawEllipse(strokeColors[2],fillColors[2],positions[2], sizes[2]);  
}

PVector updateEllipse(PVector oldPosition, PVector speed, float randomMin, float randomMax)
{
  PVector newPosition = new PVector(0,0);
  newPosition.x = oldPosition.x+speed.x+random(randomMin,randomMax);
  newPosition.y = oldPosition.y+speed.y+random(randomMin,randomMax);
  if(newPosition.x>width)
    newPosition.x=0;
  if(newPosition.y>width)
    newPosition.y=0;
  return newPosition;
}
void drawEllipse(color strClr, color flClr, PVector elPos, PVector elSize)
{
  if(elPos.x>width*0.25&&
      elPos.x<width*0.7&&
      elPos.y>height*0.25&&
      elPos.y<height*0.75)
  {
    strokeWeight(4);
    stroke(flClr);
    fill(strClr);
  }
  else
  {
    strokeWeight(2);
    stroke(strClr);
    fill(flClr);
  }

  ellipse(elPos.x, elPos.y, elSize.x, elSize.y);  
}


