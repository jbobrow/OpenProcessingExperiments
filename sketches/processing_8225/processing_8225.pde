
String artooMagicCircleArtist = "http://openprocessing.org/images/iconVisualizer.gif";
PImage r2b2NeatLogo;
void load_logo() {
  r2b2NeatLogo = loadImage( artooMagicCircleArtist );
}
void draw_logo() {
  if (r2b2NeatLogo!=null)
    image( r2b2NeatLogo, width/2, height/2 );
}

  
class Cube {

  // Properties
  int w, h, d;
  int shiftX, shiftY, shiftZ;

  // Constructor
  Cube(int w, int h, int d, int shiftX, int shiftY, int shiftZ){
    this.w = w;
    this.h = h;
    this.d = d;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
  }

  // Main cube drawing method, which looks 
  // more confusing than it really is. It's 
  // just a bunch of rectangles drawn for 
  // each cube face
  void draw() {
    drawFront();
    drawBack();    
    /*
    // Left face
     vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
     vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
     vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 
     vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 
     
     // Right face
     vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
     vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
     vertex(w + shiftX, h + shiftY, d + shiftZ); 
     vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
     
     // Top face
     vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
     vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
     vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
     vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
     
     // Bottom face
     vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 
     vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
     vertex(w + shiftX, h + shiftY, d + shiftZ); 
     vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 
     
     endShape(); 
     */
  }
  void drawFace( int FACE ) {
  }

  PVector[] drawFront() {
    ArrayList pts = new ArrayList();
  // Front face
    pts.add( new PVector( -w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ) );
    pts.add( new PVector( w + shiftX, -h/2 + shiftY, -d/2 + shiftZ) );
    pts.add( new PVector( w + shiftX, h + shiftY, -d/2 + shiftZ) );
    pts.add( new PVector( -w/2 + shiftX, h + shiftY, -d/2 + shiftZ) ); 
    return( (PVector[])pts.toArray( new PVector[0] ) );

  }
  void drawBack() {
    // Back face
    beginShape(QUADS);
    vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    vertex(w + shiftX, h + shiftY, d + shiftZ); 
    vertex(-w/2 + shiftX, h + shiftY, d + shiftZ);
    endShape();
  }
}





