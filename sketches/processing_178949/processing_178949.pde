
cell c;
float j = 0;

void setup()
{
  size(400, 400);
  smooth();
  c = new cell(0., 0., 75.); 
 
  strokeJoin(ROUND);
  strokeWeight(4);
  stroke(255,200,210);
  fill(255,200,210,10); 
}


void draw()
{
  pushStyle();
    noStroke();
    fill(0, 20);
    rect(0,0,width,height);
  popStyle();
  
  translate(width/2, height/2);
  rotate(j);
  
  c.oscilate(j);
  c.display();
  
  j += radians(0.25);
}


class cell
{
  int x, y;
  int r0;
  float a, b; 
 
  cell(float x_, float y_, float r0_)
  {
    x = int(x_);
    y = int(y_);
    r0 = int(r0_);
    a = 1.;
    b = 0.;

  }
 
  void display()
  {

    pushMatrix();
      translate(x, y);
      rotate(-PI/4);  //make the cell divide on the horizontal by default
      beginShape();
        for(int i = 0; i < 360; i += 1)
        {
          float angle = radians(i);           
          
          //change the radius according to the angle to make the new form      
          float r = r0 * (a + b * sq(cos(angle) + sin(angle)));
      
          //turn around (x,y), this line replace  rotate to allow the use of vertex 
          vertex(r*cos(angle), r*sin(angle)); 
        }
      endShape(CLOSE);
    popMatrix();
  }
  
  void oscilate(float osc)
  {
    //change a and b to oscilate between one circle and two "ellipses"
    a = abs(cos(osc));
    b = 1 - abs(cos(osc));
  }
  
}


