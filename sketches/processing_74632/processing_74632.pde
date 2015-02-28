
//swing ride 
float roty=0;
void setup ()
{
  size(400,400,P3D); 
}
void draw()
{
  background(0);
  translate(200,120,0);
  rotateX(-mouseY*.005);
  rotateY(roty);
  middle();
  cap();
  decor1();
  decor2();
  cone();
  swing();
  roty=roty-.05;
}
void middle()
{
  pushMatrix();
  float z=0; 
  rotateX(PI/2);
  while(z>-1.3)
  {
    translate(0,0,z);
    strokeWeight(5);
    stroke(0,145,255);
    ellipse(0,0,100,100);
    z=z-.005;
  }
  popMatrix();
}
void cap()
{
  pushMatrix();
  float z=0;
  rotateX(PI/2);
  while(z<.65)
  {
    translate(0,0,z);
    strokeWeight(5);
    stroke(0,145,255);
    fill(0,145,255);
    ellipse(0,0,270,270);
    z=z+.005;
  }
  popMatrix();
}
void decor1()
{
  pushMatrix();
  float y=0;
  while(y<2*PI)
  {
    rotateY(y);
    strokeWeight(5);
    stroke(255);
    line(55,0,55,170);
    y=y+PI/8;
  }
  popMatrix();
}
void decor2()
{
  pushMatrix();
  float y=0;
  while(y<2*PI)
  {
    rotateY(y);
    strokeWeight(5);
    stroke(255);
    line(140,0,140,-40);
    y=y+PI/8;
  }
  popMatrix();
}
void cone() 
{
  pushMatrix();
  translate(0,-40,0);
  float y=0;
  while(y<2*PI)
  {
    rotateY(y);
    strokeWeight(5);
    stroke(255);
    line(0,-30,140,0);
    y=y+PI/8;
  }
  popMatrix();
}
void swing()
{
  float rot=0;
  while(rot<2*PI)
  {
    rotateY(rot);
     
    pushMatrix();
    translate(110,-10,0);
    rotateZ(-PI/8);
  
    strokeWeight(1);
    stroke(255);
    //string1
    translate(10,0,10);
    line(0,0,0,120);
    translate(-10,0,-10);
  
  //string2
    translate(10,0,-10);
    line(0,0,0,120);
    translate(-10,0,10);
  
  //string3
    translate(-10,0,10);
    line(0,0,0,120);
    translate(10,0,-10);
  
  //string4
    translate(-10,0,-10);
    line(0,0,0,120);
    translate(10,0,10);
  
  //box 
    fill(0,75,220);
    translate(0,130,0);
    box(20);
    translate(0,-130);
    
    popMatrix();
    
    rot=rot+PI/4;
  }
  
}
