
float scale;


void setup()
{
  size(500,500);
  noStroke();
  scale = width/6;
}

void draw()
{
  int[] numbers={millis(), second()};
  int m = numbers[0]; 
  int s = numbers[1];
 
 
  for(int i=0; i<scale; i++)
  {
  colorMode(100, (i+1) * scale * 10);
  fill(millis()%((i+4) * scale * 10) );
  rect(i*scale, 0, scale, height); 
  }
  for (int j=0; j<scale; j++)
  {
    colorMode(HSB, (j+5) * scale * 10);
    fill(second()*((j+7) * scale * 10));
    ellipse( j*scale, 0, scale, height);
  }
 if (mousePressed||numbers[1]==2)
{
  fill(83);
 rect(83, 83,95, 83);
 }
 if (keyPressed||numbers[1]==5)
 {
   fill(115);                     
   ellipse(45, 45, 45, 45);
 } 
}

