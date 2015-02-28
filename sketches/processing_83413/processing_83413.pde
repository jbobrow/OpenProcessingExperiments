
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}int counter = 0;

void setup()
{
  size(400, 400);
  background(0, 0, 0);
  smooth();
  frameRate (5);
  noStroke();
}


void draw ()

{

  fill(255);
  rect (0, 380, 400, 20);

  stroke (255, 255, 255) ;
  strokeWeight (5);
  point (random (width), random (height));
}



void mousePressed ()
{
  noStroke();

  if (counter == 0)
  {
    fill (255, 255, 255);
    ellipse (200, 325, 175, 175);
  }

  if (counter == 1)
  {
    fill (255, 255, 255);
    ellipse (200, 220, 100, 100);
  }


  if (counter == 3)
  {
    fill (255, 255, 255);
    ellipse (200, 155, 50, 50);
  }

  if (counter == 4)
  {
    fill(252, 152, 0);
    triangle (200, 158, 200, 152, 210, 155);
  }
  
  counter++;
}

void mouseDragged ()
{
  noStroke();

  fill(0, 0, 0);
  ellipse(mouseX, mouseY, 5, 5);
}
