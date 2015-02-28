
int steps=0;
int[] colors = new int[3];
int x;
int y;
int position;
int rectangleSize;
int currentColor;


void setup()
{
  
  size(495,40);
  background(255);
  rectMode(CENTER);
  noStroke();
  colors[0] = #CA1212;
  colors[1] = #666666;
  colors[2] = 255;
  rectangleSize=30;
  x=20;
  y=20;
  position=0;
  currentColor = 0;
}

void draw()
{
  delay(300);
  fill(colors[currentColor]);
  rect(x+position*(rectangleSize+5),y,rectangleSize,rectangleSize);
  position++;
  println(position);
  
  if(position%14 == 0) position = 0;
  
  if(position%10 == 0) 
  {  
  currentColor = (currentColor+1)%colors.length;
  }
  if(position%11 == 0) 
  {  
  currentColor = (currentColor);
  }

}


