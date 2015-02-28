
import java.awt.Color;

// These six variables are all tweakable
int g_iNumRenderSteps = 800;
int g_iNumCylinders = 5;
float g_fCylinderDistance = 150;
float g_fCylinderSize = 60;
int g_fFacesPerCylinder = 8;
int g_iCylinderTwistFactor = 1;

// Global texture where the twister graphics are stored
PImage g_texture;

void setup()
{
  size(512, 512, P2D);
  frameRate(30);
  smooth();
  createTexture();
}

void draw()
{
  if (keyPressed)
  {
    // Reveal the twister texture
    image(g_texture, 0, 0, width, height);
  }
  else
  {
    float fTime = (float)millis() / 1000;
    loadPixels();
    
    // Draw all lines of the screen
    for (int y = 0; y < height; y++)
    {
      // Figure out which row of the twister texture to use
      float fRow = fTime * 10 + sin(sin(fTime * 0.3 + float(y) * 0.001) * 1.1 + sin(fTime * 0.35) * 2.0) * g_iNumRenderSteps;
      int iTextureRow = int(floor(fRow));
      while (iTextureRow >= g_iNumRenderSteps) iTextureRow -= g_iNumRenderSteps;
      while (iTextureRow < 0) iTextureRow += g_iNumRenderSteps;
      
      // Fast copy of a single line from the twister texture to the screen
      System.arraycopy(g_texture.pixels, iTextureRow * width, pixels, y * width, width);
    }
    updatePixels();
  }
}

void createTexture()
{
  g_texture = new PImage(width, g_iNumRenderSteps);

  PGraphics buffer = createGraphics(width, height, P3D);
  buffer.beginDraw();
  
  // Set up drawing and lighting
  buffer.noStroke();
  buffer.ambientLight(50, 50, 50);
  buffer.lightSpecular(255, 255, 255);
  buffer.directionalLight(255, 255, 255, -1, 0, -0.5);
  buffer.shininess(50);
  
  // Draw the scene a number of times at different rotations. In total we draw a full 360 degrees
  // At each rotation we grab a line from the screen and save it in a texture
  // We can then recreate the from just that one line by drawing it to every line of the screen
  // Or, we can pick different lines from the texture to makegive an intersting twisting effect
  buffer.pushMatrix();
  buffer.translate(width/2, height/2, 0);
  for (int iRenderStep = 0; iRenderStep < g_iNumRenderSteps; iRenderStep++)
  {
    buffer.background(0);
    float fRotation = (float)iRenderStep / (float)g_iNumRenderSteps * PI * 2;
    for (int iCylinder = 0; iCylinder < g_iNumCylinders; iCylinder++)
    {
      float fCylinderAlpha = (float)iCylinder / (float)g_iNumCylinders;
      float fAngle = fRotation + fCylinderAlpha * PI * 2;
      float fX = sin(fAngle);
      float fY = cos(fAngle);
      buffer.fill(Color.HSBtoRGB(fCylinderAlpha, 1, fY * 0.4 + 0.6));  // Fade out as we go into the distance
      buffer.specular((fY * 0.4 + 0.6) * 255);
      buffer.pushMatrix();
      buffer.translate(fX * g_fCylinderDistance, 0, fY * g_fCylinderDistance);
      buffer.rotateY(fAngle * g_iCylinderTwistFactor);
      cylinder(buffer, 200, g_fCylinderSize, g_fFacesPerCylinder);
      buffer.popMatrix();
    }

    // Grab a row from the middle of the screen
    g_texture.copy(buffer, 0, height/2, width, height/2 + 1, 0, iRenderStep, width, iRenderStep + 1);
  }
  buffer.popMatrix();
  
  buffer.endDraw();
}

// Draws a cylinder
void cylinder(PGraphics buffer, float fHeight, float fRadius, int iNumFaces)
{
  buffer.beginShape(QUAD_STRIP);
  for (int iFace = 0; iFace < iNumFaces + 1; iFace++)
  {
    float fAngle = (float)iFace / (float)iNumFaces * PI * 2;
    buffer.vertex(sin(fAngle) * fRadius, fHeight/2, cos(fAngle) * fRadius);
    buffer.vertex(sin(fAngle) * fRadius, -fHeight/2, cos(fAngle) * fRadius);
  }
  buffer.endShape();
}


