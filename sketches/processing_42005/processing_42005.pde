
//HW10 - Computing for arts with Processing
//Copyright Ziad Ewais (zewais) - 10/06/2011 - CMU
 
float z, deltaZ;
 
void setup()
{
  size(400,400,P3D);
  z = 1;
  deltaZ = 0;
}
 
void draw()
{
  prepScreen();
  initial();
  rotateBox();
 // rotateY(radians(z));
  //println(z);
}
 
void prepScreen()
{
  background(255);
  translate(width/2, height/2, 0);
  //line(-100,0,0,100,0,0);
  //line(0,-100,0,0,100,0);
}
 
void initial()
{
  strokeWeight(1);
  rotateY(radians(z));
  for(int i = 0; i < 3; i++)
  {
    pushMatrix();
      fill(150 - 20 * i,0,0);
      translate(-width*.1*i, width * .1 * i, 0);
      rotateY(radians(i * 20));
      box(width * .1);
    popMatrix();
    pushMatrix();
      fill(150 + 20 * i,0,0);
      translate(width*.1*i, -width * .1 * i, 0);
      rotateY(radians(-i * 20));
      box(width * .1);
    popMatrix();
     
  }
   
  for(int j = 0; j < 2 ; j++)
  {
    fill(150,0,0,160);
    pushMatrix();
      translate(0, width * .3, -width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
    pushMatrix();
      translate(0, -width * .3, width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
    pushMatrix();
      translate(0, width * .3, width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
    pushMatrix();
      translate(0, -width * .3, -width * .1  * j);
      box(width * 2/3, width * .1, width * .1);
    popMatrix();
  }
   
  strokeWeight(5);
  line(width * 1/3,-width * 1/3,0, -width * 1/3, width * 1/3,0);
   
  for(int k = 0; k < 4; k++)
  {
    line(-width * .1  * k, width * .3, width * .25, -width * .1 * k, .3* width, -width * .25);
    line(width * .1  * k, width * .3, width * .25, width * .1 * k,.3* width, -width * .25);
    line(-width * .1  * k, -width * .3, width * .25, -width * .1 * k, -.3* width, -width * .25);
    line(width * .1  * k, -width * .3, width * .25, width * .1 * k, -.3* width, -width * .25);
  }
}
 
void rotateBox()
{
  z = z + deltaZ;
   
}
  
void keyPressed()
{
  if(keyCode == LEFT)
  {
    deltaZ = deltaZ + .2;
  }
  else if(keyCode == RIGHT)
  {
    deltaZ = deltaZ - .2;
  }
    
}

