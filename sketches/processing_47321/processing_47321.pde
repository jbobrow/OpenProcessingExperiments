
color bg, mid, lin, cool, cooler;
int scale_factor;
int canvas_size;
int cells;
float radius;
float thickness;
float x, y, z, t;
float amp;
float angle;
int i;

 
void setup()
{
  smooth();
  noCursor();
  frameRate(20);
  mid  = color(169,65,99);
  bg   = color(120,67,90);
  lin  = color(0,0,0);
  cool = color(181,0,75);
  cooler = color(181,1,24);
  canvas_size = 700;
  cells = 5;
  size(canvas_size, canvas_size);
 
  background(bg);
 
  scale_factor = canvas_size/(cells*3);
  strokeWeight(10/scale_factor);
}
  
void draw(){
  float color1 = random(0,255);
  float color2 = random(0,255);
  float color3 = random(0,255);
  if(mousePressed){
    
  }
  else{
  fill(color1, color2, color3);
  ellipse(mouseX, mouseY, mouseX-150, mouseX-150);
  ellipse(width-mouseX, height-mouseY, mouseX-150, mouseX-150);
  }

   
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
   
    loop();
    
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
  fill(mid);
  noStroke();
  pushMatrix();
  do_rot(r);
  beginShape(LINES);
  vertex(0,0);
  vertex(0,8);
  vertex(3,5);
  vertex(7,0); 
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
  beginShape(SQUARE);
  vertex(1,1);
  vertex(1,9);
  vertex(9,9);
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
  
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
 
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
  fill(cool);
  beginShape(LINES);
  vertex(5,5);
  vertex(4,5);
  vertex(5,10);
  endShape();
  stroke(lin);
  beginShape(LINES);
  vertex(4,5);
  vertex(5,4);
  endShape();
  noStroke();
  beginShape(QUADS);
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
  beginShape(ELLIPSE);
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
  fill(bg);
  beginShape(LINES);
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
  fill(cool);
  beginShape(QUADS);
  vertex(0,2);
  vertex(4,0);
  vertex(5,0);
  vertex(5,1);
  vertex(0,3);
  endShape();
  stroke(lin);
  beginShape(SQUARE);
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
  beginShape(QUADS);
  vertex(5,2);
  vertex(1,0);
  vertex(0,0);
  vertex(0,1);
  vertex(5,3);
  endShape();
  stroke(cooler);
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
  beginShape(QUADS);
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
  beginShape(LINES);
  vertex(4,0);
  vertex(2,5);
  vertex(3,5);
  vertex(5,1);
  vertex(5,0);
  endShape();
  stroke(cooler);
  beginShape(QUADS);
  vertex(4,0);
  vertex(2,5);
  vertex(3,5);
  vertex(5,1);
  endShape(); 
}

void keyPressed(){
  if(key =='s'){
    saveImage();}
    if(key =='b'){
      filter(BLUR);
       
}
}

