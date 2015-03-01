
float counter = 0;

void setup()
{
  size (500, 500);
  background(255);
  colorMode(HSB, 360, 100, 100);
  noStroke();
}

void draw()
{

  background(360, 0, 100);

  float counter_mouse = map(mouseY, 0, height, 0.1, 0.01);
  float big = map(mouseY, 0, height, 20, 70);
  float farbe = map(mouseY, 0, height, 233, 233);


  translate(width/2, height/2);

  fill(farbe, 70, height - mouseY );


  ellipse(-100, sin(counter)*200, big, big);
  ellipse(100, sin(counter)*200, big, big);
  ellipse(0, sin(counter)*50, big, big);
  ellipse(-200, sin(counter)*100, big, big);
  ellipse(200, sin(counter)*100, big, big);
  



  counter +=counter_mouse;
}

