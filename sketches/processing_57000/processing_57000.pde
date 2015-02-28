
class Chair 
{
  float xpos, ypos;
  float speed;
  float r=random(255);

  //Constructor is like a "setup" for this class
  Chair ( float tx, float ty, float ts)
  {




    size(500, 500,P3D);
    smooth();




    xpos=tx;
    ypos=ty;
    speed=ts;
  }
  void update()
  {
    float rx=random(-speed, speed);
    float ry=random(-speed, speed);
    xpos =  xpos + rx;
    ypos = ypos + ry;
  }

  void display()
  {
    background(0);
    fill(0);
    stroke(xpos);
    translate(25,-100,-100);
    
    beginShape();
   
    vertex(144, 170);
    vertex(228, 174);
    vertex(192, 182);
    vertex(90, 178);
    vertex(144, 170);
    strokeWeight(1);
    endShape();


    //back
    strokeWeight(1);
    strokeCap(ROUND);
    stroke(98,236,242);
    line(149, xpos, 144, 274);
    line(232, xpos, 228, 174);
    

  
    //legs
    stroke(98,236,242);
    line(90, xpos, 92, 303);
    line(192, xpos, 191, 321);
    line(228, xpos, 225, 282);
    

  
   
  }
  void infinite()
  {
     if(xpos >= width)
 xpos=5;
 else if(xpos<=0)
 xpos=width;
 else if (ypos >= height)
 ypos = 0;
 else if(ypos <= 0)
 ypos = height; 
  }
}


