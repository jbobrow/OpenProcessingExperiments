
 float t=0;

void setup()
{
  size(1500,1000,P3D);
  background(206,153,83,50);
   frameRate(300);
}

void draw()
{
  t+=0.3;
  ellipse(100,100,70,70);
  float heighT = noise(t/100,0,0)*200;
  float period = noise(0,t/100,0)*1;
  float flex = noise(0,0,t*100)*90;
  float sin1 = sin(radians(t*period));
  float saturation = map(flex,0,1,0,255);  
 // rotateY(radians(flex));
  strokeWeight(3);
  fill(0,saturation);
  point(t,500+sin1*heighT);
  //rotateY(-radians(flex));
  stroke(0,20);
  line(t,1000,t,500+sin1*heighT);
  stroke(0,10);
  line(t,560+sin1*heighT,t,500+sin1*heighT);  

  stroke(0,100);
  line(t,510+sin1*heighT,t,500+sin1*heighT);
}
