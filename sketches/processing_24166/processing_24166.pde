
/*CHANGING SHAPE by Chayan Deb, National Institute of Design, India*/


void setup()
{
  size(600, 600);
  background(255);  
  strokeWeight(3);
}



float amount = PI/2;
float twist = PI*2-30;


void draw()
{
  translate(300, 300);
  rotate(millis()/1000000);
  stroke(3, 100, 123);
  smooth();
  beginShape();
  twist = 0;
  for (float i = 600; i > 20; i=i-8)
  {
    twist = twist + amount*sin((millis()/10000.0));
    curveVertex(sin(twist)*i,cos(twist)*i);
  }
  endShape();
  if(millis()>29500)
    noLoop();
}


