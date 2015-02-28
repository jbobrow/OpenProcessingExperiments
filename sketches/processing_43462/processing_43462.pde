

// sketch: PG_SpherePictures.pde - by Ing. Gerd Platl  
// v1.0  2011-10-21
// http://www.openprocessing.org/visuals/?visualID=43462
//
// Lighten your picture spheres with the mouse...
// Left mouse button - toggle light (L)
// Right mouse button - toggle background clearing (B)
// + / -   change sphere details

PImage pic;
int sphereDetails = 12;
boolean lightIsOn = true;
boolean clearBackground = true;
int usedSpheres = 2000;

void setup () 
{ pic = loadImage("loading.gif");
//pic = loadImage("PG_SpherePictures.jpg");
  size(512, 512 * pic.height / pic.width, P3D);
  noStroke();
}

void draw() 
{ if (clearBackground) background(190);
  sphereDetail(sphereDetails);
  if (lightIsOn)
  { ambientLight(55,55,55);
    pointLight(222, 222, 222, // Color
               mouseX, mouseY, 200); // Position
  } 
  else 
  {  pointLight(322, 322, 322, // Color
               width/2, height/2, 400); // Position
  }             
  for (int ni=0; ni<usedSpheres; ni++)
  { float rx = ni % width; 
    float ry = random(0,height);
    pushMatrix();
      translate(rx, ry);
      fill(pic.get(int((rx * pic.width / width) % pic.width),
                   int((ry * pic.height / height) % pic.height)));
      sphere(12);
    popMatrix();
  }
}
void keyPressed()
{ if      ((key == '+') && (sphereDetails < 16)) sphereDetails++;
  else if ((key == '-') && (sphereDetails >  2)) sphereDetails--;
  else if ( key == 'l') lightIsOn = !lightIsOn;
  else if ( key == 'b') clearBackground = !clearBackground;
  println("details = " + sphereDetails);
}

void mousePressed()
{ if (mouseButton == LEFT) lightIsOn = !lightIsOn;
  else if (mouseButton == RIGHT) clearBackground = !clearBackground;
}


