
float counter = 0;

void setup()
{
  size(500, 500);
  background(255);
}

void draw()
{
  background(255);
  
  colorMode(HSB,360,100,100);
  
  float counter_mouse = map(mouseX,0,width,0.01,0.2);
  float farbe = map(sin(counter),-1,1,30,100);
  
  fill(360,farbe,100);
  noStroke();

  pushMatrix();
  translate(150, 150);
  ellipse(0, 0, 200, 200);
  //arc(0,0,200,200,PI,2*PI,OPEN);

  translate(200, 0);
  ellipse(0, 0, 200, 200);
   //arc(0,0,200,200,PI,2*PI,OPEN);
  popMatrix();

  translate(width/2, height/2);
  rectMode(CENTER);
  rect(0,0,50,200);
  triangle(-183, -45, 0, 180, 183, -45);
  
  counter += counter_mouse;
}
