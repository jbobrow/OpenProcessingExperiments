
float pink;
float purple;
float blue;
float incrementor;

void setup(){
  size(400, 600);
  noStroke();
}

void draw(){
  background(0);

  pink= map(cos(incrementor), -1, 1, 0, 127);
  fill(255, 0, pink);
  ellipse(width/2, height/2, 300, 350);
  
  incrementor +=0.05;
}
