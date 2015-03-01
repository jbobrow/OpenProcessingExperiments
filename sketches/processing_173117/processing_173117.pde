
float index = 0;

void setup()
{
  size(500, 500);
}

void draw()
{
  background(0);

  float my_sin = sin(index);

  index += 0.025;

  float pos = map (my_sin, -1, 1, width, 0);
  float Winkel = map(millis()/20, 0, 500, 45, 90);
  float rgb1= map(sin(index),-1,1,17,242);
  float rgb2= map(sin(index),-1,1,48,17);
float rgb3= map(sin(index),-1,1,242,17);


  translate(pos, height/2);
  fill(rgb1,rgb2,rgb3);
 rotate(Winkel/pos);
  rectMode(CENTER);
  rect(0, 0, 10+mouseX, 10+mouseX);
  
}

