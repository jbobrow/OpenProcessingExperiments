

float theta=0.0;
float x=0;

void setup(){
  size(600,600);
  stroke(20);
  fill(25,50);
  background(255);
  ellipse(50,50,50,50);
  
}

void draw(){
  background(255);
  float x=width/2+(cos(theta)*300);
  fill(240,50,50);
  ellipse(x,300,20,20);
  theta=theta+.03;
  fill(100,200,100);
   ellipse(250,250,50,50);
   ellipse(340,250,50,50);
   fill(200,95,190);
   ellipse(250,260,20,20);
   fill(200,95,190);
   ellipse(345,245,20,20);
   fill(250,50,50);
   ellipse(300,370,200,100);
   fill(210,200,50);
   ellipse(300,370,50,50);
   
}
