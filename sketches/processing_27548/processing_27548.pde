
float theta = 2.0; 

void setup() {
  size(200,200);
  smooth();
  background(0);
  x = width/2;
  y = 0;
  smooth();
}

void draw() {
  fill(random(50),random(200),random(150));
  noStroke();
  ellipse(x,y,100,y);
  y++;
  theta += 0.05;
  noStroke();
  fill(225);
  float x = theta;
  
  fill(random(200),random(70),random(90));
  noStroke();
  ellipse(200,10,x,y);
  y++;
  theta += 0.05;
  noStroke();
  fill(225);
  float x = theta;
  
}



  
                                                
