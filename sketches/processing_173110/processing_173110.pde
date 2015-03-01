
float counter =0;
void setup()
{
  size (500, 500);
    background(255);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  
}

void draw()

{
if (mousePressed == true)
{
  float hintergrund = map(mouseY, 0, height- mouseY, 100, 50);
background(360, 0, hintergrund);


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

else
{
 background (0, mouseX, 100);


  float big = map (mouseX, 0, width, 20, 70);
  float counter_mouse = map(mouseX, 0, width, 0.01, 0.2);
  float farbe = map(sin(counter), -1, 1, 0, 100);


  translate (width/2, height/2);

  fill(0, 70, width-mouseX);


rotate(radians(millis())*0.1);
  ellipse ( 0, sin(counter)*100, big, big);
  ellipse ( 0, -sin(counter)*100, big, big);
  ellipse (sin(counter)*100, 0 , big, big);
  ellipse (-sin(counter)*100, 0,  big, big);
  
  

  counter += counter_mouse;
}
}
