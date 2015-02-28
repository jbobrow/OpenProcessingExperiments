

void setup()
{

  size(400,400);
  strokeWeight(8);
  colorMode(RGB);
  smooth();
  background(0);
}

float x = 100;
float y = 200;
float z = 300;

void draw()
{
  background(255);

  if (mousePressed == true) {
    loop();
    

    stroke(173,19,19);
    line(0, random (0,300), width, x); 
    line(0, x, width, random (20,200));
    
    stroke(227,68,52);
    line(0, random (0,300), width, y); 
    line(0, y, width, random (20,200));
    
    stroke(130,72,68);
    line(0, random (0,300), width, z); 
    line(0, z, width, random (20,200));
  }
}


