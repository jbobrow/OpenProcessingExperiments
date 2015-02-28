
//inspired by this: http://www.openprocessing.org/visuals/?visualID=4938

Eye[][] eyes;
int cols = 10;
int rows = 10;
float rad = 20;
float mouseDistance = 0;
float diameterLim = 0;
float newDiameter = 0;
float maxDist;
color eyecol = color(0,0,200,100);


void setup()
{
  size(500,500);
  smooth();
  maxDist = dist(0,0, width, height);

  eyes = new Eye[cols][rows];

  for(int i=0; i<cols; i++)
  {
    for(int j=0; j<rows; j++)
    {   
    eyecol = color(random(0,255),random(0,255),random(0,255),random(0,255)); 
      
       eyes[i][j] = new Eye(25 + i*50,  25 + j*50, eyecol, rad);
    }
  }
}

void draw()
{
  background(200);
  diameterLim = 20;
  //iterate through the array. render and update the eye objects. 
  for(int i=0; i<cols; i++)
  {
    for(int j=0; j<rows; j++)
    {
      eyes[i][j].render(); 
      eyes[i][j].follow();
      eyes[i][j].changeSize();    
    }
  }
}



class Eye
{
  float x;
  float y;
  color eyecolor;
  float angle;
  float radius;
  float diameter;

  Eye (float xpos, float ypos, color init_color, float radius)
  {
    x = xpos;
    y = ypos;
    eyecolor = init_color;
    angle = 0.0;
    diameter = radius*2;
  }


  void render()
  { 
 
    //draw eyeball 
    pushMatrix(); 

    //draw white 
    noStroke(); 
    fill(255, 228, 255); 
    translate(x,y);
    ellipse(0, 0, diameter, diameter); 

    //draw iris 
    rotate(angle); 
    //translate(4,0); 
    fill(eyecolor); 
    ellipse(10, 0, diameter/2, diameter/2); 
   
    //draw pupil 
    fill(85,85,89); 
    ellipse(10, 0, diameter/3, diameter/3); 

    popMatrix();
  }

  void follow()
  {
    angle = atan2(mouseY-y, mouseX-x);
  }
  void changeSize()
  {
    mouseDistance = dist(mouseX,mouseY,this.x,this.y);
    newDiameter = diameterLim + (mouseDistance/maxDist) * 50;
    diameter = newDiameter;
    

  } 
}


