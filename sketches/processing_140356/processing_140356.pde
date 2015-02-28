
/* @pjs preload="n2.gif,c2.gif" */
  
/*
  Andor Salga
    
  Blog: (includes some really dumb mistakes, which are corrected in this sketch)
  https://asalga.wordpress.com/2012/09/26/experimenting-with-normal-mapping/
  
  Performance notes:
  - Avoid using PVector.sub because it is too slow
  - Avoid using 'new' in the calculation hotloop because that's way too slow
  - Avoid calling PImage.get() to get the pixel data, that's too slow. Use a data array instead.
*/
   
// colorImage is the original image the user wants to light
// targetImage will hold the result of blending the
// colorImage with the lighting.
PImage colorImage, targetImage, normalImage;

// normalMap holds our 2D array of normal vectors.
// It will be the same dimensions as our colorImage
// since the lighting is per-pixel.
PVector normalMap[][];
PVector diffuseMap[][];
 
// shine will be used in specular reflection calculations
// The higher the shine value, the shinier our object will be
float shine = 20.0f;
float specCol[] = {255, 128, 50};
   
// rayOfLight will represent a vector from the current
// pixel to the light source (cursor coords);
PVector rayOfLight = new PVector(0, 0, 0);
PVector view = new PVector(0, 0, 1);
PVector specRay = new PVector(0, 0, 0);
PVector reflection = new PVector(0, 0, 0);
   
// These will hold our calculated lighting values
// diffuse will be white, so we only need 1 value
// Specular is orange, so we need all three components
float finalDiffuse = 0;
float finalSpec[] = {0, 0, 0};

// animation stuff
float xOffset = 0;
int lastTime = 0;
   
// nDotL = Normal dot Light. This is calculated once
// per pixel in the diffuse part of the algorithm, but we may
// want to reuse it if the user wants specular reflection
// Define it here to avoid calculating it twice per pixel
float nDotL;
 
// These will map to keyboard keys to change the sketch state
boolean debugOn = false;
float flipNormalZ = -1.0;
boolean calculateLighting = true;
boolean isAnimating = false;

PFont font;
  
void setup(){
  size(256, 256);
  font = createFont("arial", 24);
  textFont(font);
  fill(0);
    
  // Create targetImage only once
  colorImage = loadImage("c2.gif");
  normalImage =  loadImage("n2.gif");
     
  targetImage = createImage(width, height, RGB);
  loadNormal();
}
  
void keyPressed(){
  // N key for toggling normal mapping
  if(keyCode == 78){
    calculateLighting = !calculateLighting;
  }
    
  // D key for toggling debug info
  if(keyCode == 68){
    debugOn = !debugOn;
  }
   
  // F key for flipping normals
  if(keyCode == 70){
    flipNormalZ *= -1;
  }
  
  // A key for animation
  if(keyCode == 65){
    isAnimating = !isAnimating;
  }
   
  // R key for random specular color
  if(keyCode == 82){
    specCol[0] = random(0, 255);
    specCol[1] = random(0, 255);
    specCol[2] = random(0, 255);
  }
}
  
void loadNormal(){
   normalMap = new PVector[width][height];
   diffuseMap = new PVector[width][height];
     
   targetImage.loadPixels();
   normalImage.loadPixels();
  
  // i indexes into the 1D array of pixels in the normal map
  int i;
     
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      i = y * width + x;
   
      // Convert the RBG values to XYZ
      float r = red(normalImage.pixels[i]) - 127.0;
      float g = green(normalImage.pixels[i]) - 127.0;
      float b = blue(normalImage.pixels[i]) - 127.0;
         
      normalMap[x][y] = new PVector(r, g, b);
         
      // Normal needs to be normalized because Z
      // ranged from 127-255
      normalMap[x][y].normalize();
    }
  }
    
  colorImage.loadPixels();
  for(int x = 0; x < width; x++){
    for(int y = 0; y < height; y++){
      i = y * width + x;
   
      // Convert the RBG values to XYZ
      float r = red(colorImage.pixels[i]);
      float g = green(colorImage.pixels[i]);
      float b = blue(colorImage.pixels[i]);
  
      diffuseMap[x][y] = new PVector(r, g, b);     
    }
  }
}
   
void draw(){  
  // When the user is no longer holding down the mouse button,
  // the specular highlights aren't used. So reset the values
  // every frame here and set them only if necessary
  finalSpec[0] = 0;
  finalSpec[1] = 0;
  finalSpec[2] = 0;
    
    int xPos = (int)xOffset;
  // Per frame we iterate over every pixel. We are performing
  // per-pixel lighting.
  if(calculateLighting){
    
    for(int x = 0; x < width; x++, xPos++){
      
      xPos %= width;
      
      for(int y = 0; y < height; y++){
         
        // We're going to create a point light instead of
        // a directional light because points lights will
        // provide a more interesting simulation.
        
        // Because we'll be using point lights, we need to calculate
        // the ray of light from each point to the actual light
        // Here we avoid using the .sub() PVector method because
        // it is much slower than simply doing the calculations ourselves.
 
        // The ray of light then will go from the current pixel to the cursor
        // coordinates.       
        rayOfLight.x = x - mouseX;
        rayOfLight.y = y - mouseY;
         
        // We only have two dimensions with the mouse, so we
        // have to create/make up a third component ourselves.
        // We pick width 'pixels' down +Z. Experiment with this
        // value for interesting results.
        rayOfLight.z = width * flipNormalZ;
         
        // Normalize the ray it can be used in a dot product
        // operation to get a sensible values(-1 to 1).
        // The normal will point towards the viewer
        // And the ray will be pointing from the pixel to the viewer
        // It's a kind of strange backwards way of thinking about it,
        // but it helps ease the math.
        // When the two vectors are pointing in the same direciton
        // the dot product will return 1
        // if they are 90 degree apart 0
        // if they are in opposite directions -1
        rayOfLight.normalize();
         
        // get the absolute value since we allow flipping the normal
        nDotL = abs(rayOfLight.dot(normalMap[xPos][y]));
           
        // Avoid more processing by only calculating
        // specular lighting if the users wants to do it.
        // It is fairly processor intensive.
        if(mousePressed){
          // The next few lines calculates the reflection vector
          // using Phong specular illumination. I've written
          // a detailed blog about how this works:
          // http://asalga.wordpress.com/2012/09/23/understanding-vector-reflection-visually/
          // Also, when we have to perform vector subtraction
          // as part of calculating the reflection vector,
          // do it manually since calling sub() is slow.
          reflection.x = normalMap[xPos][y].x;
          reflection.y = normalMap[xPos][y].y;
          reflection.z = normalMap[xPos][y].z;
            
          reflection.mult(2.0 * nDotL);
            
          reflection.x -= rayOfLight.x;
          reflection.y -= rayOfLight.y;
          reflection.z -= rayOfLight.z * flipNormalZ;
             
          // The view vector points down (0, 0, 1) that is,
          // directly towards the viewer. The dot product
          // of two normalized vector returns a value from
          // (-1 to 1). However, none of the normal vectors
          // point away from the user, so we don't have to
          // deal with making sure the result of the dot product
          // is negative and thus a negative specular intensity.
             
          // Raise the result of that dot product value to the
          // power of shine. The higher shine is, the shinier
          // the surface will appear.     
          float specIntensity = pow(reflection.dot(view), shine);
             
          finalSpec[0] = specIntensity * specCol[0];
          finalSpec[1] = specIntensity * specCol[1];
          finalSpec[2] = specIntensity * specCol[2];
        }
           
        // Now that the specular and diffuse lighting are
        // calculated, they need to be blended together
        // with the original image and placed in the
        // target image. Since blend() is too slow,
        // perform our own blending operation for diffuse.
                                    
         targetImage.pixels[y*width + x] =
            
          // .get(x,y) for color is wayyy slow, use use a data array
         color(finalSpec[0] + (nDotL * diffuseMap[xPos][y].x ),
               finalSpec[1] + (nDotL * diffuseMap[xPos][y].y ),
               finalSpec[2] + (nDotL * diffuseMap[xPos][y].z ));
      }
    }
    targetImage.updatePixels();
    image(targetImage, 0, 0);
  }
  else{
    xPos %= width;
  
    image(colorImage, -xPos, 0 );
    image(colorImage, width-xPos, 0 );
  }
  
  if(isAnimating){
    xOffset += (millis() - lastTime) / 50.0f;
  }
  
  drawDebugInfo();
  lastTime = millis();
}

// I try not to crowd the sketch too much with text output
void drawDebugInfo(){
  if(debugOn){
    text("FPS: " + floor(frameRate), 10, 20);
  }
}
