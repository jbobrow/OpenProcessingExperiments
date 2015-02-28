
float ball_x;
float ball_y;
float ball_dir = 1;
float ball_size = 30;
float rect_size = 30;
float dy = 0;
float x = random(255);
float y = random(255);
float z = random(255);
float a = 1;
float[] ellArr=new float[20];
float[] rectArr=new float[20];

void setup()
{
  frameRate(5);
  size(500,500);
  background(188, 242, 204);
  smooth();
  ellipseMode(RADIUS);
  rectMode(RADIUS);
  ball_y = height/2;
  ball_x = 1;
  float x = random(255);
  float y = random(255);
  float z = random(255);
  float a = 1/2;
  stroke(1);
  for (int  j = 0; j<ellArr.length; j++)
{
  ellArr[j] = random(0,500);
  //println(ellArr[j]);
}
  for (int k = 0; k<rectArr.length; k++)
{
  rectArr[k] = random(0,500);
}
}

void draw()
{ 
  background(188, 242, 204);
  for (int j = 0; j<ellArr.length; j++)
{
  ellipse(ellArr[j]+random(0,500), ellArr[j]+random(0,500), ball_size + random(0,5-0), ball_size); 
}

for (int j = 0; j < 10; j++)
{
  fill(random(255), random(255), random(255));
  ellipse(random(0,500),random(0,500), 20, 20);
}
for (int k = 0; k<10; k++)
{
  rect(rectArr[k]+random(0,500), rectArr[k]+random(0, 500), rect_size-random(10,0), rect_size+ random(0,10));
}
}

void mouseClicked()
{
  background(random(255), random(255), random(255));
  for (int k = 0; k<10; k++)
{
  rect(rectArr[k]+random(0,500), rectArr[k]+random(0, 500), rect_size-random(10,0), rect_size+ random(0,10));
}
}

