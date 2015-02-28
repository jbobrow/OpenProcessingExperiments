

//----------------------------------------------------------
//     file:  PanoramaViewer.pde
//  purpose:  class to load and view 360° panoramas.
//  version:  v1.0   2012-08-29  initial release   
//            v1.1   2012-11-29  correcting addPictureFileNames   
//   author:  Ing. Gerd Platl   
//   tested:  with processing 2.0 beta6 (works with P3D)
//----------------------------------------------------------

//-- methods -----------------------------------------------
//   getFileNames          get picture file names
//   addPictureFileNames   add panorama file names to name lists
//   loadImageFile         load panorama image file by name
//   selectByIndex         load panorama image by index (1..n) 
//   renderSphere          draw panorama as textured sphere
//   *Rotation*            set/change current rotation 
//   *RotationSpeed        set/change auto rotation speed
//   *ViewAngle            set/change field of view            
//----------------------------------------------------------
class PanoramaViewer 
{
  float globeRadius = 100000;  // panoramic sphere radius
  int sDetail = 72;            // panoramic sphere detail setting
  int startIndex = 1;          // panoramic picture starting index

  // rotation, zoom & display
  float fov = 1.8;             // vertical field-of-view angle (in radians) 
  float rotationX = 0.0;       // vertical rotation about x-axis (-90° .. 90°)
  float rotationY = 0.0;       // horizontal rotation about y-axis (0° .. 360°)
  float speed = 0.02;          // horizontal auto rotation speed
  float maxSpeed = 0.02;       // maximum horiz. rotation speed
  float velocityX = 0.0;       // vertical velocity  
  float velocityY = 0.0;       // horizontal velocity

  // panorama file handling  
  String path;
  String imageName;
  String[] fileNames = new String[100]; 
  String[] fileExt = new String[100]; 
  int filenameCount = 0;
  int filenameIndex = 0;

  PImage backgroundImage = null;

//----------------------------------------------------------
// constructor
//----------------------------------------------------------
void PanoramaViewer() 
{
  initTexturedSphere(sDetail);
}
//----------------------------------------------------------
// add picture file names to global lists
//----------------------------------------------------------
void addPictureFileNames(String path, String ext) 
{
  File file = new File(path);
  if (!file.isDirectory()) return;
  String names[] = file.list();
  for (int ni=0; ni<names.length; ni++)
  { 
    if (names[ni].indexOf(ext) > 0)
    {
      fileNames[filenameCount] = names[ni];
      println(filenameCount+1 + ": " + fileNames[filenameCount]);
      filenameCount++;
} } } 
//----------------------------------------------------------
// get panorama file names & extentions
//----------------------------------------------------------
int getFileNames()
{
  println("--- panorama pictures ---");
  path = sketchPath + "\\data";
  File f = new File(path);
  if (!f.isDirectory())
    println("can't find directory " + path);
  else
  { println(path);
    addPictureFileNames (path, ".png");
    addPictureFileNames (path, ".jpg");
    addPictureFileNames (path, ".gif");
    addPictureFileNames (path, ".tga");
    addPictureFileNames (path, ".bmp");
  }
  println();
  return filenameCount;
}  
//----------------------------------------------------------
// load panorama picture  
//----------------------------------------------------------
void loadPicture(int delta)
{
  filenameIndex = (filenameIndex + filenameCount + delta) % (filenameCount);
  imageName = fileNames[filenameIndex];
  cursor(WAIT);
  try
  {
    PImage texImage = null;
    texImage = loadImage (imageName);
    backgroundImage = texImage;
    backgroundImage.resize(width, height);
    retainedSphere = createTexturedSphere (globeRadius, texImage);
    magicSphere = createTexturedSphere (88, texImage);
  }
  finally { cursor(ARROW); } 
}  


//----------------------------------------------------------
// load panorama image file (with exception handling)
//----------------------------------------------------------
PImage loadImageFile (String imageName)
{ 
  println ("loading panorama: '" + imageName + "' ..."); 
  PImage tempImage = null;
  boolean makeImage = true;
  try
  { //File f = new File(imageName);
    //if (f.exists())
    {
      tempImage = loadImage(imageName);
      makeImage = (tempImage.width <= 2);
      //println("pic=" + tempImage.width + '*' + tempImage.height);
    }  
  }
  catch (Exception  ex)
  { println("\n  ERROR at loading image file '" + imageName + "'");
    //println(" >>> " + ex.toString());   // ex.getMessage()
    makeImage = true;
  }
  if (makeImage)
  { tempImage = createImage(256, 256, ARGB);
    tempImage.set(10,10, color(random(127,255),0,0));  // red image
  }
  return tempImage;
}
//----------------------------------------------------------
// load panorama by index (1..n) 
//----------------------------------------------------------
void selectByIndex(int pictureIndex)
{
  filenameIndex = pictureIndex % filenameCount;
  loadPicture (0);
}
//----------------------------------------------------------
//  draw loaded panorama picture as background picture 
//----------------------------------------------------------
void drawBackgroundPicture()
{   
  //background (0);
  background (backgroundImage);
}
//----------------------------------------------------------
// do camera steering and draw textured sphere 
//----------------------------------------------------------
void renderSphere()
{
  pushMatrix();
    perspective(fov, float(width)/height, 1, 100000);

    translate(width*0.5, height*0.5, 300);
    rotateX(radians(constrain(-rotationX, -90.0, 90.0)));
    rotateY(radians(rotationY));

    shape(retainedSphere);       // draw textured sphere 

  if (showMagicSphere) 
    shape(magicSphere); 

  popMatrix();

  // do rotations
    if (autoRotate) rotationY += speed;
  rotationX += velocityX;
  rotationY += velocityY;
  velocityX *= 0.98;
  velocityY *= 0.98;
  
//  println (  "rY=" + nf(rotationY,0,2) + "°  vY=" + nf(velocityY,0,2) + " speed=" + nf(speed,0,2)
//          +"  rX=" + nf(rotationX,0,2) + "°  vX=" + nf(velocityX,0,2) );  
}
//----------------------------------------------------------
// set/change rotation, auto rotation speed, view angle   
//----------------------------------------------------------
void resetRotation()  { rotationX = 0.0;  rotationY = 0.0;  speed = 0.0;  fov  = 1.8; } 

void setRotationX(float xRotation)  { rotationX = xRotation;   velocityX = 0.0; } 
void addRotationX(float xDelta)     { velocityX = xDelta; } 

void setRotationY(float yRotation)  { rotationY = yRotation;   velocityY = 0.0; } 
void addRotationY(float yDelta)     { velocityY = yDelta;   setRotationSpeed(yDelta);  } 

void setRotationSpeed(float xSpeed) { speed = constrain (xSpeed, -maxSpeed,  maxSpeed); }
void addRotationSpeed(float sDelta) { speed += sDelta; } 

void setViewAngle(float viewAngle)  { fov = constrain (viewAngle, 0.1, 2.5); } 
void multViewAngle(float viewMult)  { setViewAngle (fov * viewMult); }
void addViewAngle(float viewDelta)  { setViewAngle (fov + viewDelta); } 
}  // end of class PanoramaViewer


