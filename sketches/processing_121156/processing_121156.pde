
float counter = 0;

void setup()
{
  size(500, 500);
  smooth();
}


void draw()
{
  background(52, 185, 36);

  
  //Change the value of the x amplituden here
  int xamp = 80;
  
  //Change the speed here
  float speed = 0.015;

  
  //Triangle base form
  pushMatrix();
  noStroke();
  fill(44, 78, 242);
  triangle(36, 464, 250, 36, 464, 464);
  popMatrix();
  resetMatrix();
  
  //Pendulum line
  translate(width/2, height/2);
  pushMatrix();
  stroke(255);
  strokeWeight(5);
  fill(255);
  line(0, -210, cos(counter)*xamp, sin(counter)*3+64);
  popMatrix();
  resetMatrix();
  
  //Triangle frame in foreground
  pushMatrix();
  stroke(255);
  strokeWeight(5);
  noFill();
  triangle(36, 464, 250, 36, 464, 464);
  popMatrix();
  resetMatrix();
  
  //Pendulum circle
  translate(width/2, height/2);
  pushMatrix();
  noStroke();
  fill(255, 196, 255);
  translate(cos(counter)*xamp, sin(counter)*3);
  ellipse(0, 100, 70, 70);
  popMatrix();
  resetMatrix();
  
  counter += speed;
  int newSpeed = int(speed); 
}

