
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
  size(800,800);
  noStroke();
  rectMode(CENTER);
  frameRate(30);
}

void draw()
{
  
  
  a = a + 0.04;
  s = cos(a)*2;
  background(102,234);
  
  translate(10, height/2);
  scale(s); 
  fill(a);
  textSize(50);
  text("alpha graphics", 50, a-50); 
  
  translate(75, 50);
  fill(a);
  scale(s);
  text("dunkin' donuts", 100, a); 
  
    translate(75, 50);
  fill(a);
  scale(s);
  text("starbucks coffee", 20, a); 
  
  
   translate(35, 90);
  fill(a);
  scale(s);
  text("textron", 80, a); 
 
}

