
float y=5;
float angle=0.0;
 

void setup()
{
  size(300, 300);
  smooth();
  background(0);
  frameRate(20);
}


void draw()
{
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
  angle=angle+0.1;
  translate(200,60);
  rotate(angle);

  fill(#D8FF00, 200);
  ellipse(y, y, 30, 30);
  ellipse(y+5, y+5, 30, 30);
    fill(#E8FC78, 200);
  ellipse(y+10, y+10, 30, 30);
  fill(#B3D353, 200);
  ellipse(y/2, y/2, 30, 30);
   fill(#B1E83D, 200);
  ellipse(y, y-50, 30, 30);
     fill(#B1E83D, 100);
  ellipse(y, y-20, 20, 20);
       fill(#B1E83D, 100);
  ellipse(y, y/2, 20, 20);
  
  
  y+=10;
  if (y>height) {
    y=-height;
  }
}

