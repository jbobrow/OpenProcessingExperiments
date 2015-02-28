
float counter = 0;

void setup()
{
  size(400, 400);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  float h = map(sin(counter), -1, 1, 5, 45);
  background(h, 100, 100);
  counter += 0.001;
  noFill();
  stroke(h,100,80);
  strokeWeight(2);
  
  translate(width/4, height/2);

  float step = map(width/2, 0, width, 10, 50);
  float amplitude = map(height, 300, width, 20,40);

  for (int i=0; i<20; i++)
  {
    pushMatrix();
    rotate(PI/2);
    translate(step*i, sin(counter+i)*amplitude);
    
    ellipse(0, 0, 20, 20);
    popMatrix();

    pushMatrix();
    translate(width/4,-height/3);
    rotate(PI/2);
    translate(i*step, cos(counter+i)*amplitude);
    ellipse(0, 0, 20, 20);
    popMatrix();
    
    pushMatrix();
    translate(width/2, height/70);
    rotate(PI/2);
    translate(i*step, cos(counter+i)*amplitude);
    ellipse(0, 0, 20, 20);
    popMatrix();
    
    counter += 0.001;

  }
}

