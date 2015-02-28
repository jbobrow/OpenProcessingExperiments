
int circlesize;

void setup() {
  background(#52FF43);
  size(600, 500);
  circlesize = 35;
  smooth();
  noStroke();
}


void draw() 
{
  for (int y=0; y<height+15; y+=circlesize) {
    for (int x=0; x<width+15; x+=circlesize) {
      fill(random(0, 74), random(74, 255), random(255), 25);
      ellipse(random(600), random(500), circlesize, circlesize);
    }
  }
    int specialX = mouseX - (mouseX % circlesize);
    int specialY = mouseY - (mouseY % circlesize);
  
  fill(#FEFF00);
  ellipse(specialX, specialY, circlesize, circlesize);
  if (circlesize==10)
  {
   circlesize= 20;
  }
}

void keyPressed()
{
 if (key == 'w' || key =='w')
{
  circlesize++;
} 
if (key == 's' || key =='s')
{
  circlesize--;
} 

}


