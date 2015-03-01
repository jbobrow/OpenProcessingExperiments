
float counter = 0;

void setup()
{
  smooth();
  size(600, 400);
  colorMode(HSB, 360, 100, 100);
  background(0, 1, 52);
  ellipseMode(CENTER);
}

void draw()
{
  background(0, 1, 52);

  float amp = map(sin(counter), -1, 1, 0, 50);
  float counter_Mouse = map(mouseX, 0, width, 0.01, 0.05);
  float pos1 = 50+amp;
  float pos2 = -50+amp;


  translate(width/2, height/2);
  noStroke();
  fill(0);
  ellipse(0, 0, 300, 300);


  if (mousePressed == false)
  {

    pushMatrix();
    fill(264, 2, 73);
    ellipse(50+amp, -20, 50, 10);
    popMatrix();

    pushMatrix();
    fill(264, 2, 73);
    ellipse(-50+amp, -20, 50, 10);
    popMatrix();

    //Tränen_langsam
    pushMatrix();
    fill(216, 53, 96);
    ellipse(pos2, -20+frameCount*2, 10, 10);
    popMatrix();
    pushMatrix();
    fill(216, 53, 96);
    ellipse(pos1, -20+frameCount*2, 10, 10);
    popMatrix();

    if ( frameCount > 150)
    {
      frameCount = 0;
    }

    counter += counter_Mouse;
  } else
  {
    float a = map(sin(counter), 1, -1, 240, 360);
    float newposx1 = 50+amp/2;
    float newposx2 = -50-amp/2;

    background(a, 12, 90);

    noStroke();
    fill(0);
    ellipse(0, 0, 300, 300);

    //Verwirrt
    pushMatrix();
    translate(sin(counter)*25, cos(counter)*25);   
    fill(a, 100, 100);
    ellipse(newposx1, -20, 10, 10);
    popMatrix();

    pushMatrix();
    translate(sin(counter)*25, cos(counter)*25);   
    fill(a, 100, 100);
    ellipse(newposx2, -20, 10, 10);
    popMatrix();

    pushMatrix();
    translate(-sin(counter)*25, -cos(counter)*25);   
    fill(a, 100, 100);
    ellipse(newposx1, -20, 10, 10);
    popMatrix();

    pushMatrix();
    translate(-sin(counter)*25, -cos(counter)*25);   
    fill(a, 100, 100);
    ellipse(newposx2, -20, 10, 10);
    popMatrix();

    pushMatrix();
    translate(sin(counter)*25, cos(counter)*25);   
    fill(a, 100, 100);
    ellipse(newposx1, -20, 10, 10);
    popMatrix();

    pushMatrix();
    translate(sin(counter)*25, cos(counter)*25);   
    fill(a, 100, 100);
    ellipse(newposx2, -20, 10, 10);
    popMatrix();

    //Augen
    pushMatrix();
    fill(192, 40, 89);
    ellipse(50+amp/2, -20, 30, 30);
    popMatrix();

    pushMatrix();
    fill(192, 40, 89);
    ellipse(-50-amp/2, -20, 30, 30);
    popMatrix();
    //Mund
    pushMatrix();
    fill(340, 34, 95);
    ellipse(0, 55, 60+amp/2, 40+amp/2);
    popMatrix();

    counter += 0.1;
  }
}
