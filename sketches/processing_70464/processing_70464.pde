
float rad  = 150;
float angle = 0;
float px, py;
float A, B;

void setup()
{
  size(500, 500);
  smooth();
  A = 3;
  B = 4;
  
}
 
void draw()
{
  noStroke();
  fill(0, 15);
  rect(0, 0, width, height);
  float d=random(0,130);
 
  stroke(#c19700);
//     if (px < 0) {8
     float x = 200+sin(100*angle) * 250;
     float y = height/2 + cos(500*angle) * 250;
     line(x, y, px, py);
     angle += 0.03;
     px=x;
     py=y;
     fill(#c19700);
     ellipse(x,y,d,d);
  
 
 
  //fill(255);

 
 
 
}


