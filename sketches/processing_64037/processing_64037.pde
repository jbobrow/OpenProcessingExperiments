

//--------------------------------------------------------
// sketch: ASV_Lightning.pde - by Gerd Platl
//         handle material and lightning properties
// date:   v1.0  2012-06-12  inital release
//         v1.1  2012-12-16  added printColorList
//         v1.2  2013-04-13  random colors error corrected
//--------------------------------------------------------
// material syntax: 
//     ambient(color)          // RGB/HSB
//     emissive(color)         // RGB/HSB 
//     specular(color)         // RGB/HSB
//     shininess(float shine)  // degree of shininess >= 0
// light syntax:
//     lights()                       // set default light values
//     noLights()                     // disable lightning
//     lightFalloff(const,lin,quad)   // default (1, 0, 0)
//     lightSpecular(color)           // default (0, 0, 0)
//     ambientLight(color)            // light from all sides
//     directionalLight(color,dir)    // default (128,128,128, 0,0,-1)
//     pointLight(color,pos)          // to add a point light
//     spotLight(color,pos,dir,angle) // to add a spot light
//--------------------------------------------------------

color backgroundColor = color(33, 55, 111);

// material and light colors 
float fShininess = 20.0;
float newShininess = 0.0;
color cAmbientMaterial, cAmbientLight;
color cSpecularMaterial, cSpecularLight;
color lightColor1, lightColor2, lightColor3;
boolean whiteMaterial = false;

// light directions
PVector light1Direction, light2Direction, light3Direction;

//--------------------------------------------------------
void initLights()
{
  fShininess = 20.0;
  newShininess = 0.0;
  colorMode(RGB, 255);
  cAmbientMaterial  = color (200, 200, 200);
  cAmbientLight     = color (25, 25, 25);
  cSpecularMaterial = color (200, 180, 50);
  cSpecularLight    = color (200, 180, 50);
  lightColor1       = color (140, 110, 50);
  lightColor2       = color (0, 0, 0);
  lightColor3       = color (0, 0, 0);

  light1Direction  = new PVector(0, 400, -400);
  light2Direction  = new PVector(400, -400, -200);
  light3Direction  = new PVector(-400, 400, 200);
}
//-----------------------------------
void printColorList()
{
  println ("--- light & color parameters ---");
  println (" shininess = " + nf(fShininess,0,2));
  println (" ambient Material: " + rgbString(cAmbientMaterial));
  println (" ambient Light: " + rgbString(cAmbientLight));
  println (" specular Material: " + rgbString(cSpecularMaterial));
  println (" specular Light: " + rgbString(cSpecularLight));
  println (" light color 1: " + rgbString(lightColor1));
  println (" light color 2: " + rgbString(lightColor2));
  println (" light color 3: " + rgbString(lightColor3));
  
}
//-----------------------------------
void toggleTransparency()
{
  print ("toggleTransparency: " + colorString(cAmbientMaterial));
  if (int(alpha(cAmbientMaterial)) == 255) 
    cAmbientMaterial = color(cAmbientMaterial, 111);
  else cAmbientMaterial = (cAmbientMaterial & 0x00FFFFFF) + 0xFF000000;  // set opaque
  //  else cAmbientMaterial = color(cAmbientMaterial, 255);  // set opaque ... not working ?!?
  //ambient(cAmbientMaterial);
  //specular(cSpecularMaterial);
  println (" -> " + colorString(cAmbientMaterial));
}
//--------------------------------------------------------
// set all kind of lights
//--------------------------------------------------------
void setLights()
{
  //println ("setLights: ");
  noLights();    // turn off standard lights
  if (whiteMaterial)
  { 
    ambient(color(255));
    ambientLight(12, 120, 120);
 
    specular(11);
    lightSpecular(red(cSpecularLight), green(cSpecularLight), blue(cSpecularLight));    // color
    shininess(fShininess);
    
    directionalLight(222, 222, 222,      // color
      light1Direction.x, light1Direction.y, light1Direction.z);   // lightning direction
    return;      // ===>
  }  

  // ambient material and light
  ambient(cAmbientMaterial);
  ambientLight(red(cAmbientLight), green(cAmbientLight), blue(cAmbientLight));

  // specular material and light
  specular(red(cSpecularMaterial), green(cSpecularMaterial), blue(cSpecularMaterial));
  lightSpecular(red(cSpecularLight), green(cSpecularLight), blue(cSpecularLight));    // color
  shininess(fShininess);

  // light 1
  directionalLight(red(lightColor1), green(lightColor1), blue(lightColor1), // color
    light1Direction.x, light1Direction.y, light1Direction.z);     // lightning direction

  // light 2
//  directionalLight(red(lightColor2), green(lightColor2), blue(lightColor2), 
//    light2Direction.x, light2Direction.y, light2Direction.z);

  // light 3
  directionalLight(red(lightColor3), green(lightColor3), blue(lightColor3), 
    light3Direction.x, light3Direction.y, light3Direction.z);

  // point light 1
  pointLight(red(lightColor2), green(lightColor2), blue(lightColor2), // color
    0, 0, 0);     // lightning direction
}
//-----------------------------------
int shininessFrame = 0;

void changeShininess(float delta)   // F3,F4    
{
  fShininess = constrain (fShininess + delta, 1.0, 80.0);
  if (frameCount != shininessFrame)
    text ("shininess=" + nf(fShininess, 0, 2), -60, 180, 60);
  println ("shininess: " + nf(fShininess, 0, 2));
}
//-----------------------------------
void randomColors()
{
  println ("random colors");
  randomMaterialColors();
  randomLight1Colors();
  randomLight2Colors();
  randomLight3Colors();
}
//-----------------------------------
void randomMaterialColors()
{
  println (" random material color");
  whiteMaterial = false;
  cAmbientMaterial = randomColor (0, 180, 255);    // get dark color
  cSpecularMaterial = randomColor (100, 255, 255); // get bright color
  cAmbientLight = randomColor (0, 20, 255);        // get very dark color
}
//-----------------------------------
void randomLight1Colors()
{
  println (" random light-1 color");
  lightColor1 = randomColor (0, 255, 255);
}
//-----------------------------------
void randomLight2Colors()
{
  println (" random light-2 color");
  lightColor2 = randomColor (0, 255, 255);
}
//-----------------------------------
void randomLight3Colors()
{
  println (" random light-3 color");
  lightColor3 = randomColor (0, 255, 255);
}

//-----------------------------------
color randomColor(int minValue, int maxValue, int alpha)
{
  return color(minValue + random(maxValue - minValue)  // R
  , minValue + random(maxValue - minValue)  // G
  , minValue + random(maxValue - minValue)  // B
  , alpha); // transparency
}
//-----------------------------------
String rgbString(color aColor)
{
  return nf(int(red(aColor)),3) 
    +'-'+nf(int(green(aColor)),3) 
    +'-'+nf(int(blue(aColor)),3)
    +'.'+nf(int(alpha(aColor)),3);
}
//-----------------------------------
String colorString(color aColor)
{
  return str(int(red(aColor))) 
    +'-'+str(int(green(aColor))) 
    +'-'+str(int(blue(aColor)))
    +'.'+str(int(alpha(aColor)));
}


