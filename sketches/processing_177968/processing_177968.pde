


void setup() 
{
  size(600, 600, P3D);
  background(168,35,48);
}

void draw()
{
 
  rotateX(radians(mouseX));
  translate(width/2, height/2, 0);
  fill(200,0,0);
  for (float r = 100; r < 200; r+= 3 ) {
    for (float paul = 0; paul<90; paul  += 1) {
      for (float thomas = 0; thomas <360; thomas+= 1) {

        float theta = radians(paul); 
        float delta = radians(thomas); 
        point(r*cos(delta), r*sin(delta), r*cos(theta)/sin(theta));
      }
    }
  }
}
  
  
  

