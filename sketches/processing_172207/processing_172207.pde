
float counter = 0;

void setup()
{
  size(500, 500);
  background(255);
}
void draw()

{

  float amplitude = map(sin(counter), -1, 1, 10, 360);
  float rgb1 = map(mouseX, 0, 500, 167, 163);
  float rgb2 = map(mouseX, 0, 500, 223, 15);
  float rgb3 = map(mouseX, 0, 500, 234, 22);
  background(255);


  translate(width/2, height/2);
  fill(rgb1, rgb2, rgb3);// 32,178,170



  float arm1 = map(mouseX, 500, 0, 0, 500);
  float arm2 = map(500, mouseX, 0, 0, 500);

  ellipse(0, arm1, 100, 100);
  ellipse(0, arm2, 100, 100);
  fill(255);
  ellipse(0, arm1, 50, 50);
  ellipse(0, arm2, 50, 50);
  noStroke();


  fill(rgb1, rgb2, rgb3, amplitude);
  ellipse(0, 0, 55, 55);

  println(sin(counter));
  counter += 0.1;
}

