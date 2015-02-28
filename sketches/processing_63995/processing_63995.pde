
/**
 * Scale 
 * by Denis Grutze. 
 * 
 * Paramenters for the scale() function are values specified 
 * as decimal percentages. For example, the method call scale(2.0) 
 * will increase the dimension of the shape by 200 percent. 
 * Objects always scale from the origin. 
 */
 
float a = 0.0;
float s = 0.0;

void setup()
{
  size(200,200);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
  ellipse(100,100,random(120),random(120));

}

void draw()
{
  background(#FFFFFF);
  
  a = a + 0.08;
  s = cos(a)*3;
  float radius=(random(50));
  
  translate(width/2, height/2);
  scale(s); 
  fill(random(256),random(256),random(256));
  rect(0, 0, radius, radius); 
  
  a=a+0.6;
  translate(75, 50);
  fill(#62097C);
  scale(s);
  ellipse(0, 0, radius, radius); 

  a=a+0.9;
  translate(75,50);
  fill(#010101);
  scale(s);
  ellipse(0,200,50,50);
  
  translate(50,50);
  fill(#FFE603);
  scale(s);
  ellipse(0,50,50,50);
}

