
//-----------------------------------------------------------------------------ScrenSaver.pde

/* Intent
  This program create the sierpinski triangles and displays them with colour
 
  
*/
// ---------------------------------------------------------------------------- initialisation
// Global (i.e. PApplet-wide) constants and variables
SierTri[] tris;
int redf =  (int) random(255); // colour red
int greenf = (int) random(255) ; // colour green
int bluef = (int) random(255) ; // colour blue 
int alphaf = (int) random(100) ; // tranparency value
int i = 1; // counter 1
int j = 0; // counter 2
float angle = PI/random(3); // rotation

// -------------------------------------------------

void setup() {
    size(500, 500, P3D); // shows in window 500 X 500
     
    noStroke();
            colorMode(HSB, random(255), noise(255), noise(255), 255);
            for (int i = 0; i < 100; i++) {
            for (int j = 0; j < 100; j++) {
            stroke(i, j, 100);
            point(i, j);
  }
}
   
    background(random(redf)%255, random(greenf)%255, random(bluef)%255); // background colour
    loop() ;
    noStroke(); // no oulines given
    smooth(); // gives smooth edges and curves
    frameRate(150); // 150 frames shown per second
    tris = new SierTri[10000]; // creates a new array of 10000 
    tris[0] = new SierTri(width/6, 20, height-30);
}

// ------------------------------------------------------------------------------ main methods

void draw() { 
                 rect(0,0, 500, 500) ;      
  fill(noise(redf)%255, noise(greenf)%255, noise(bluef%255));  
    tri(tris[j].xpos, tris[j].ypos, tris[j].Size);
    j++;
    
}
 /*float settri_x(float x, float len)
 { float rotx = x + cos(angle + len*(PI/3 * j)) ;
  
   return rotx ;
 }
 
 float settri_y(float y, float len)
 { float roty ;
       roty = y + sin( angle + len*(PI/3 * j)) ;
      
    return roty ;
 }
 */
public void tri(float x, float y, float s) {
    fill(redf++%255, greenf++%255, bluef++%255);
    float h = sin(2*PI/3)*s;
      //   x = settri_x(x,s) ;
      //   y = settri_y(y,s) ;
           triangle((x), (y), (x), y+s, x+h, y+s/2);
      fill(random(redf)%255, random(greenf)%255, random(bluef)%255);
      //   x = settri_x(x,s) ;
      //   y = settri_y(y,s) ;
           triangle(x, y+s/2, x+h/2, y+s/4, x+h/2, y+3*s/4);
      
    if (j >= i-1 && j > 0) {
        noLoop();
    }
    if (s >= 10) {
        tris[i] = new SierTri((x), (y), (s/2));
         
        tris[i+1] = new SierTri((x), (y+s/2), (s/2));

        tris[i+2] = new SierTri((x+h/2), (y+s/4), (s/2));
     
        i += 3;
    }
   }
   
// ----------------------------------------------------------------------------------- classes
/*
classes Used
''''''''''''''''''
SierTri - inbuilt class
*/
// -------------------------------------------------------------------------------------------

public class SierTri {
    float xpos, ypos, Size;
// ---------------------------------------------------------------------------- constructor
            
            SierTri(float nx, float ny, float ns) {
        xpos = (nx);
        ypos = (ny);
        Size = (ns);
    }
}

