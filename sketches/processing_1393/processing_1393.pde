
/**
 * Scale 
 * by Denis Grutze. 
 * 
 * Paramenters for the scale() function are values specified 
 * as decimal percentages. For example, the method call scale(2.0) 
 * will increase the dimension of the shape by 200 percent. 
 * Objects always scale from the origin. 
 */
 
float a = 0.20;
float s = 100.0;

void setup()
{
  size(200,200);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
}

void draw()
{
  background(102);
  
  a = a + 0.09;
  s = sin(a)*2;
  
  translate(width/2, height/2);
  scale(s); 
  fill(21);
  rect(40, 0, 50, 50); 
  
  translate(75, 0);
  fill(255);
  scale(s);
  rect(0, 20, 50, 50);       
}

