

color bg, mid, lin;
int scale_factor;
int canvas_size;
int cells;

void setup() 
{
  smooth();
  mid  = color(0xFF,0xCC,00);
  bg   = color(0xb3, 0x9D, 0x33); 
  lin  = color(0,0,0);

  canvas_size = 600;
  cells = 15;
  size(canvas_size, canvas_size);

  background(bg);

  scale_factor = canvas_size/(cells*5);
  strokeWeight(1/scale_factor);
}

void keyPressed()
{
    loop();
}

void draw() 
{
  
  scale(scale_factor);

  for(int i = 0; i < cells; i++)
  {
    pushMatrix();
    for (int j = 0; j < cells; j++)
    {
      random_square();
      translate(5,0);
    }
    popMatrix();
    translate(0,5);
  }
  
    noLoop();
}

void random_square()
{
  if (random(1) > .5)
  {
    square_over(int(random(1,9)));
  }
  else
  {
    square_under(int(random(1,9)));
  }
}

void square_over(int r)
{
  fill(bg);
  noStroke();
  pushMatrix();
  do_rot(r);
  beginShape(QUADS);
  vertex(0,0);
  vertex(0,5);
  vertex(5,5);
  vertex(5,0);  
  endShape();
  if (r > 4)
  {
    bar1p();
    bar2p();
    bar3p();
  }
  else 
  {
    bar1();
    bar2();
    bar3();
  }
  cap();
  popMatrix();
}

void square_under(int r)
{
  fill(bg);
  noStroke();
  pushMatrix();
  do_rot(r);
  beginShape(QUADS);
  vertex(0,0);
  vertex(0,5);
  vertex(5,5);
  vertex(5,0);
  endShape();
  if (r > 4)
  {
    bar3p();
    bar2p();
    bar1p();
  }
  else
  {
    bar3();
    bar2();
    bar1();
  }
  cap();
  popMatrix();
}

void do_rot(int r)
{
  switch(r)
  {
  case 2:
  case 6:
    translate(5, 0);
    rotate(PI/2);
    break;
  case 3:
  case 7:
    translate(5,5);
    rotate(PI);    
    break;
  case 4:
  case 8:
    translate(0,5);
    rotate(-(PI/2));
    break;
  }
}

void cap()
{
  noStroke();
  fill(mid);
  beginShape(POLYGON);
  vertex(5,5);
  vertex(4,5);
  vertex(5,4);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(4,5);
  vertex(5,4);
  endShape();
  noStroke();
  beginShape(POLYGON);
  vertex(0,5);
  vertex(1,5);
  vertex(0,4);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(1,5);
  vertex(0,4);
  endShape();
}

void bar1() {  
  noStroke();
  fill(mid);
  beginShape(POLYGON);
  vertex(2,0);
  vertex(3,0);
  vertex(5,2);
  vertex(5,3);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(3,0);
  vertex(5,2);
  vertex(5,3);
  vertex(2,0);
  endShape();
}

void bar1p()
{
  noStroke();
  fill(mid);
  beginShape(POLYGON);
  vertex(2,0);
  vertex(3,0);
  vertex(0,3);
  vertex(0,2);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(2,0);
  vertex(0,2);
  vertex(0,3);
  vertex(3,0);
  endShape();
}


void bar2()
{  
  noStroke();
  fill(mid);
  beginShape(POLYGON);
  vertex(0,2);
  vertex(4,0);
  vertex(5,0);
  vertex(5,1);
  vertex(0,3);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(0,2);
  vertex(4,0);
  vertex(5,1);
  vertex(0,3);
  endShape();
}

void bar2p()
{  
  noStroke();
  fill(mid);
  beginShape(POLYGON);
  vertex(5,2);
  vertex(1,0);
  vertex(0,0);
  vertex(0,1);
  vertex(5,3);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(5,2);
  vertex(1,0);
  vertex(0,1);
  vertex(5,3);
  endShape();
}

void bar3()
{
  fill(mid);
  noStroke();
  beginShape(POLYGON);
  vertex(1,0);
  vertex(3,5);
  vertex(2,5);
  vertex(0,1);
  vertex(0,0);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(1,0);
  vertex(3,5);
  vertex(2,5);
  vertex(0,1);
  endShape();

}

void bar3p()
{
  fill(mid);
  noStroke();
  beginShape(POLYGON);
  vertex(4,0);
  vertex(2,5);
  vertex(3,5);
  vertex(5,1);
  vertex(5,0);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(4,0);
  vertex(2,5);
  vertex(3,5);
  vertex(5,1);
  endShape();

}



