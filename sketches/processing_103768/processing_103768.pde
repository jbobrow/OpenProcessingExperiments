
bubu[][] bus;


// Number of columns and rows in the grid
int cols = 30;
int rows = 30;
void setup()
{

  size(600,600);
  bus = new bubu[cols][rows];
  background(0);
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      bus[i][j] = new bubu(i*(width/cols),j*(height/rows));
    }
  }
}

void draw()
{
   background(0);  
   for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Oscillate and display each object
      
      bus[i][j].display();
    }
   }

}


class bubu 
{
  // Our object has two PVectors: location and distance
  float dist;
  float xpos;
  float ypos;
  float size;
  PVector location;
  PVector mouseLoc;
  PVector tempdist;
  
  //constructor
  bubu(float xxpos,float yypos)
  {
    xpos = xxpos;
    ypos = yypos;
    location = new PVector (xpos,ypos);
    mouseLoc = new PVector (mouseX, mouseY);
    tempdist = PVector.sub(location,mouseLoc);
    dist = tempdist.mag();
    size = (width - dist)/5;
  }

  //methods
  void display()
  {
    mouseLoc = new PVector (mouseX, mouseY);
    tempdist = PVector.sub(location,mouseLoc);
    dist = tempdist.mag();
    dist = max(dist,15);
    size = (width - dist)/5;
    size = max(size,0);
    //background(0);
    ellipseMode(CENTER);
    fill(255);
    noStroke();
    ellipse(xpos,ypos,size/8,size/8);
  }  
}


