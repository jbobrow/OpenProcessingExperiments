
//Taller de programacion 
//Minor Castro
//had troubles understanding the translate/rotate
//next will be to try to add dynamic angles.
float iniSize, angle, ang;
int level = 1;
void setup()
{
  size(800, 800);
  iniSize = 80;
  background(0);
  smooth();
  ang = 45;
  angle = radians(ang);
  level = 1;
}

void draw()
{
  background(#FFFDC0,150);
  
 
  //angle = radians((mouseX / (float) width) * 90);
  angle = radians(ang);

  translate(width/2-(iniSize/2), height/2);
  rect(0, 0, iniSize, iniSize);
  recursiveRect(iniSize);
  
  translate(80, 80);
  rotate(2*HALF_PI);
  rect(0, 0, iniSize, iniSize);
  recursiveRect(iniSize);
}

void recursiveRect(float s)
{

  float newSide = s*sin(angle);
  float newSide2 = s*cos(angle);//sqrt(pow(s,2)-pow(newSide,2));
  //println(ang,newSide,cos(angle));
  if (newSide > 2)
  {
    pushMatrix();
   
    rotate(-angle);
    fill(#CCB24C,100);
    rect(0, 0, newSide, -newSide);
    translate(0, -newSide);
    recursiveRect(newSide);
    popMatrix();

    pushMatrix();
    translate(s, 0);
    rotate(angle);
    fill(#F7D683,100);
    rect(0, 0, -newSide2, -newSide2);
    translate(-newSide2, -newSide2);
    recursiveRect(newSide2);
    popMatrix();
  }
}

void keyPressed() {
  if (key == 'a') {
    ang = 60;
  }
}

