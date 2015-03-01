
float counter = 0;

void setup()
{
  smooth();
  colorMode(HSB, 360, 100, 100);
  size(500, 500);  
  background(0, 0, 0);
  rectMode(CENTER);
}

void draw()
{ 
  float hintergrund = map(mouseX,0,500,100,0);
  
  //background(0, 0, hintergrund);
  
  float farbstart = 60;

  float farbende = 120;
 
  float saturationstart = 50;

  float saturationende = 80;
  
  //background(0,0,hintergrund);

  pushMatrix();
  translate(width/2, height/2);

  float speed = map(mouseX,0,500,0.1,0.2);

  float drehungen = map(millis()*0.1, 0, width, 0, 360);

  rotate(radians(drehungen));

  float countermousee = map(mouseX, 0, width, 0.005, 0.3);

  float amplitudee = map(sin(counter), -1, 1, -150, 150);
  
  float amplitudee_rad = sqrt(pow(amplitudee, 2));

  if (mouseX > width/2) {
    
    farbstart = 0;

    farbende = 50;
  } else {
        
    farbstart = 60;

    farbende = 120;
  }

  float farben = map(sin(counter), -1, 1, farbstart, farbende);

  if (mouseX < width/2) {

    saturationstart = 50;

    saturationende = 80;
  } else {
    saturationstart = 75;

    saturationende = 100;
  }

  float saettigung = map(mouseX, 0, width, saturationstart, saturationende);

  float kontur = map(sin(counter), -1, 1, farbende, farbstart);

  fill(farben, saettigung, 100);
  stroke(kontur,100,100);  
  //ellipse(0,sin(counter)*100,100,100);
  ellipse(0, amplitudee, 50, 50);

  //println(sin(counter));
  counter += countermousee;
  popMatrix();

  resetMatrix();
}

