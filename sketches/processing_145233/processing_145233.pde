

float index = 0.0;
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
 
  float b = map(sin(index), -1, 0, 250, 170);
  index += 0.015;
 
 fill(b,b, 160, 200);
  ellipse(cos(index)*100, sin(index)*100, cos(index)*200, cos(index)*200);

 fill(b,50, 160, 150);
  ellipse(cos(index)*200, sin(index)*200, cos(index)*50, cos(index)*50);

 fill(b,50, 160, 150);
  ellipse(cos(index)*10, sin(index)*-200, cos(index)*40, cos(index)*40);

 fill(b,b, 160, 150);
  ellipse(cos(index)*250, sin(index)*100, cos(index)*20, cos(index)*20);


fill(b,b, 160, 150);
  ellipse(cos(index)*-80, sin(index)*-20, cos(index)*30, cos(index)*30);

fill(b,50, b, 150);
  ellipse(cos(index)*-230, sin(index)*50, cos(index)*15, cos(index)*15);

fill(b,50, 160, 150);
  ellipse(cos(index)*-10, sin(index)*-50, cos(index)*10, cos(index)*10);





  }

