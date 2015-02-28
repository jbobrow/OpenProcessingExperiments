
float index = 0.0;
float angle;
float jitter;

void setup() {
  background(0);
  size (500,500);
  colorMode(HSB, 360, 100, 100);  
  frameRate(25);
 
 
   
}
 
void draw()
{
  
  float h = map(sin(index), -1, 0, 250, 170);
background (0);
index += 0.008;
 translate(width/2, height/2);
 
  noStroke();
   if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);

  rotate(c);
  float b = map(sin(index), -1, 0, 40, 50);
  index += 0.021;
 
 fill(b,240, 200, 200);
  rect(cos(index)*100, sin(index)*100, cos(index)*200, cos(index)*200);

 fill(b,50, 160, 150);
  rect(cos(index)*200, sin(index)*200, cos(index)*50, cos(index)*50);

 fill(b,50, 160, 150);
  triangle(cos(index)*-10, sin(index)*-200, cos(index)*40, cos(index)*40,70,100);






  }

