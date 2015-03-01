
/*
Set of 4 Box Lines (adjustable)
 By Jasmine Rajavadee
 Feburary 5, 2015
 */

void setup()
{
  size(500, 500); 
  background(0);
}

void draw()
{
  //color (all lines)
  float c = random(255); 
  stroke(c, 0, c); 
  //margins, parameters
  int ma = width/10; 
  //box1
  line(ma, random(ma, height/2 - ma/2), width/2-ma/2, random(ma, height/2 - ma/2)); 
  //box2
  line(width/2+ma/2, random(ma, height/2 - ma/2), width-ma, random(ma, height/2 - ma/2)); 
  //box3
  line(ma, random(height/2 + ma/2, height-ma), width/2-ma/2, random(height/2 + ma/2, height-ma)); 
  //box4 
  line(width/2+ma/2, random(height/2 + ma/2, height-ma), width-ma, random(height/2 + ma/2, height-ma));
}

