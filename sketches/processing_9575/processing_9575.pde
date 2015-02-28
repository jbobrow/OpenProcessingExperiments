
import processing.opengl.*;

int cubeSizeX = 100;
int cubeSizeY = 100;
int cubeSizeZ = 100;

int n = 25;
int sizeX = 700;
int sizeY = 500;
int tollerance = 5;

float latticeArray[][];
String[] fileData; //A String array for loading and saving details 

int preDrawSelection = -1;
color preDrawColour = color(255,0,0,50);
color DrawColour = color(50,50,50);
color EditColour = color(255,0,0);
int keypos = 3; //Used to count keypresses when entering numbers
float typedRadius = 0; //Holds radius values as they are entered
boolean showLattice = true;

//Camera position (cartesian coordinates)
Float camEyeX = 0.0;
Float camEyeY = 0.0;
Float camEyeZ = 0.0;
Float camCentreX = 0.0;
Float camCentreY = 0.0;
Float camCentreZ = 0.0;
Float camUpX = 0.0;
Float camUpY = 1.0;
Float camUpZ = 0.0;

//Camera sherical coordinates 
float phi = 90; // Rotation in YZ plane
float theta = 0; // Rotation in XZ plane
float rho = 200; //Distance to camera

//for calculations
int tmpMouseX = 0;
int tmpMouseY = 0;

int restrictToPlane = -1;

void setup()
{
  size(700, 500, P3D);
  background(255);
  
  //Calculate the 3d coordinates for the lattice
  setupLatticeArray();
  loadData();
  sphereDetail(8);
}

void draw()
{ 
  //Clear the screen
  background(255);

  //Lighting
  pointLight(150,255,255,200,200,200);
  lights();
  
  //Correct for multiple rotations in YZ plane that cause camera flipping
  if (theta > 360) theta = theta - 360;
  if (theta < -360 ) theta = theta + 360;
  
  //Position the camera
  positionCamera(rho, phi, theta);  
  camera(camEyeX, camEyeY, camEyeZ, camCentreX, camCentreY, camCentreZ, camUpX, camUpY, camUpZ);
  
  //Draw the lattice
  if (showLattice == true) drawLattice();
  drawSpheres();
  
  //Draw a sphere on the selected lattice point if no sphere is already there
  if (preDrawSelection >= 0 && latticeArray[preDrawSelection][5] == 0)
  {
   //Draw a sphere with n/3 radius
   DrawSphere(latticeArray[preDrawSelection][0], latticeArray[preDrawSelection][1], latticeArray[preDrawSelection][2], n/5, preDrawColour);
  }
}

int countLatticePoints()
{
  return ((cubeSizeX / n) + 1) * ((cubeSizeY / n) + 1) * ((cubeSizeZ / n) + 1);
}

void calculateScreenCoordinates()
//Caclulates the corresponding x and y screen coordinates for all lattice points and stores then in the lattice array
{
  for (int i = 0; i < countLatticePoints(); i++)
  {
    //Translate to account for cube centre at origin
    translate(-(cubeSizeX / 2), -(cubeSizeY / 2), -(cubeSizeZ / 2));
    
    //Store the current screen coordinates of each point in the lattice array
    latticeArray[i][3] = (int)screenX(latticeArray[i][0], latticeArray[i][1], latticeArray[i][2]);
    latticeArray[i][4] = (int)screenY(latticeArray[i][0], latticeArray[i][1], latticeArray[i][2]);
    
    //Reset the translation
    translate((cubeSizeX / 2), (cubeSizeY / 2), (cubeSizeZ / 2));
  }
}

void setupLatticeArray()
//Caclualtes the 3D coordinates for all lattice points and stores them in the lattice array.  Also clears any existing sphere data.
{
  int i = 0;
  
  //first dimension defined number of lattice points
  //Second dimension defines x (0), y (1) & z (2) coordinates, x (3) & y (4) screen coordinates, and then sphere size (5)
  latticeArray = new float[countLatticePoints()][6];
 
  //Iteratively populate lattice points
  for (int z = 0; z <= cubeSizeZ; z = z + n)
  {
    for (int y = 0; y <= cubeSizeY; y = y + n) 
    {
      for (int x = 0; x <= cubeSizeX; x = x + n) 
      { 
          latticeArray[i][0] = x;
          latticeArray[i][1] = y;
          latticeArray[i][2] = z;
          latticeArray[i][5] = 0;
          //println(x + "; " + y + "; " + z);
          i++;
      }
    }
  }
}

void drawSpheres()
//Draws all the spheres specified in the lattice array
{
  for (int i = 0; i < countLatticePoints(); i++)
  {
    //If the lattice point has a sphere then draw it
    if (latticeArray[i][5] > 0)
    {
      if (i != preDrawSelection) 
      {
        //if plane restriction has been applied then only draw spheres on specified plane
        if (restrictToPlane == -1 || restrictToPlane == latticeArray[i][1] / n)
        {
          //If the sphere is not selected then draw it in black
          DrawSphere(latticeArray[i][0], latticeArray[i][1], latticeArray[i][2], (int)latticeArray[i][5], DrawColour);
        }
      }
      else
      {
        //if plane restriction has been applied then only draw spheres on specified plane
        if (restrictToPlane == -1 || restrictToPlane == latticeArray[i][1] / n)
        {
          //If an existing sphere is selected then colour to indicate it is selected and editable
          DrawSphere(latticeArray[i][0], latticeArray[i][1], latticeArray[i][2], (int)latticeArray[i][5], EditColour);
        }
      }
    }
  }
}

void drawLattice()
{
  int closestColour = 100;
  int furthestColour = 100;
  int lineColour = 100;
  
  //Translate space to draw with origin at centre of cube
  translate(-(cubeSizeX / 2), -(cubeSizeY / 2), -(cubeSizeZ / 2));
  
  stroke(lineColour);
  
  //Iteratively draw lattice lines
  for (int z = 0; z <= cubeSizeZ; z = z + n)
  {
    for (int y = 0; y <= cubeSizeY; y = y + n) 
    {
      for (int x = 0; x <= cubeSizeX; x = x + n) 
      { 
        //Calcuate line colour for this Z dimension
        //lineColour = furthestColour - (furthestColour * n / cubeSizeZ) * (z / n);
              
        //Draw Cube
        //stroke(lineColour);
        
        if (restrictToPlane == -1 || restrictToPlane == y / n)
        {
          line(0, y, z, cubeSizeX, y, z); // X dimension lines
          if (restrictToPlane == -1) line(x, 0, z, x, cubeSizeY, z); // Y Dimension Lines
          line(x, y, 0, x, y, cubeSizeZ); // Z dimension lines
        }
        //noStroke();
      }
    }
  }
  noStroke();
  
  //Invert translation to return origin to 0,0,0
  translate((cubeSizeX / 2), (cubeSizeY / 2), (cubeSizeZ / 2));
 
}

void positionCamera(float r, float p, float t)
{
  //sets the camera position by converting the spherical coordinates to cartesian
  camEyeX = r * cos(radians(t)) * cos(radians(p));
  camEyeY = r * sin(radians(t));
  camEyeZ = r * cos(radians(t)) * sin(radians(p));
  
  //Prevent flipping if camera moves past top or bottom of cube
  if ((t > 90.0 && t < 270.0) || (t < -90.0 && t > -270.0)) 
  {
    camUpY = -1.0;
  }
  else
  {
    camUpY = 1.0;
  }
  
  calculateScreenCoordinates();
}

void mouseMoved()
{
  if (keyPressed)
  { 
    if (key == 's')
    {
      rho -= pmouseY - mouseY;
    }
    
    if (key == 'a')
    {
      phi -= pmouseX - mouseX; 
      theta += pmouseY - mouseY;
    }
  }
  
  //Check if the new mouse position selects a lattice point
  preDrawSelect(mouseX, mouseY);

}

void preDrawSelect(int x, int y)
{
  //Default to nothing being selected
  preDrawSelection = -1; 
  
  //Iterate through array and return array
  for (int i = 0; i < countLatticePoints() && preDrawSelection == -1; i++)
  {
    //If the mouse is within the tollerance range of a lattice point
    if (x >= latticeArray[i][3] - tollerance && x <= latticeArray[i][3] + tollerance && y >= latticeArray[i][4] - tollerance && y <= latticeArray[i][4] + tollerance)
    {
      //If plane restriction is applied the only allow preselection of lattice points on specified plane
      if (restrictToPlane == -1 || restrictToPlane == latticeArray[i][1] / n)
      {
        //set the predraw selection to the array index of the selected lattice point
        if (preDrawSelection != i) keypos = 0; 
        preDrawSelection = i;
      }
    }
  }
}

void DrawSphere(float x, float y, float z, int s, color c)
{
    translate(x - (cubeSizeX/2), y - (cubeSizeY/2), z - (cubeSizeZ/2));
    fill(c);
    specular(255,255,255);
    shininess(1.0); 
    sphere(s);
    translate(-(x - (cubeSizeX/2)), -(y - (cubeSizeY/2)), -(z - (cubeSizeZ/2)));
}

void mouseDragged()
{
  //Right mouse button moves camera in x and Z plane
  if (mouseButton == RIGHT)
  {
    rho -= pmouseY - mouseY;
  }
  
  if (mouseButton == LEFT)
  {
    phi -= pmouseX - mouseX; 
    theta += pmouseY - mouseY;
  }
}

void addSphere(int i, float s)
{
  //add sphere information to the lattice array
  latticeArray[i][5] = s;
}

void keyTyped()
{ 
  //Only take action if the key pressed is a number and a lattice point is selected
  if (int(key) >= 48 && int(key) <= 57 && preDrawSelection >= 0) 
  {
    //only interested in the first two keypresses after selection
    if (keypos == 0)
    {
      typedRadius = int(key) - 48;
      typedRadius = typedRadius * 10;
      keypos++;
    }
    else if (keypos == 1)
    {
      typedRadius += int(key) - 48;
      if (typedRadius > n / pow(2, 0.5))
      {
        typedRadius = n / pow(2, 0.5);
      }
      
      addSphere(preDrawSelection, typedRadius);
      keypos ++;
      preDrawSelection = -1;
    }
  }
  
  //Press g to toggle lattice display
  if ((int)key == 103 || (int)key == 71) showLattice = !showLattice;
  
  //Press s to save current configuration
  if (int(key) == 32)
  {
    if (restrictToPlane < cubeSizeX / n)
    {
      restrictToPlane ++;
    }
    else
    {
      restrictToPlane =-1;
    }
    println(restrictToPlane);
  }
  
  //Press s to save current configuration
  if (int(key) == 115 || int(key) == 83)
  {
    //Create a String array to save details 
    String[] fileData = new String[countLatticePoints()];
    
    //Populate string array with array data.
    for (int i = 0; i < countLatticePoints(); i++)
    {
      fileData[i] = i + " " + latticeArray[i][5];
    }
    
    //Save circle data to file
    //saveStrings("circles.dat", fileData);
  }
  
  //press l to load the saved image
  if (int(key) == 108 || int(key) == 76)
  {
     loadData();
  } 
}

void loadData()
{
   //String[] pointData;
    
    //Load circle data from file
    //fileData = loadStrings("circles.dat");
    
    //Populate array with file data.
    //for (int i = 0; i < fileData.length; i++)
    //{
    //    pointData = split(fileData[i], " ");
    //    latticeArray[Integer.parseInt(pointData[0])][5] = Float.parseFloat(pointData[1]);
    //}
}

