
//Understanding Relative Transformations
void setup()
{
  size(400, 400);
}
void draw()
{
  background(250);
  
  pushMatrix(); //Store the current graphics state
  
  stroke(140, 220, 245);        //grid 1
  noFill();
  rect(0, 0, width, height);
  for (int i=0; i<width; i+=10)
    line(i, 0, i, height);
  for (int i=0; i<height; i+=10)
    line(0, i, width, i);

  fill(50);
  rect(10, 10, 40, 40);

  stroke(255,0,0);
  line(0,0, 130,0);
  line(130,0, 130,170);

  translate(130, 170); //Translate the coordinate system
  rotate(HALF_PI/2);  // Rotate the coordinate system

  stroke(140, 220, 245);        //grid 2
  noFill();
  rect(0, 0, width, height);
  for (int i=0; i<width; i+=10)
    line(i, 0, i, height);
  for (int i=0; i<height; i+=10)
    line(0, i, width, i);

  fill(50);
  rect(10, 10, 40, 40);
  translate(30,30);
  rect(10,10, 40,40);   
  
  popMatrix(); //Restore the previous graphics state
  
  ellipse(width-50,height-50, 50,50); //This ellipse is unaffected
}


