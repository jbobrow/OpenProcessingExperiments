
int mx, my;          // I am used to using mx and my for mouse coords
PGraphics buffer;    // Framebuffer datatype
boolean reflectionSurface;

void setup(){
  size(800,800);    // P3D renderer 2x faster
  buffer = createGraphics(width/2, height/2);  //Framebuffer constructor
  noStroke();
  reflectionSurface = false;
}

void draw(){
 //frame.setTitle(str(frameRate));
 preDraw();      // Call this before drawing
 
 //-Your drawing calls go here-
 updateMouse();
 buffer.background(255); 
 buffer.fill(0);
 buffer.ellipse(mx,my,300,300);
 
 //Just make sure you prefix it with buffer so that it draws to the framebuffer
 
 postDraw();    // Call this after drawing
 
 if (reflectionSurface == true) {
   fill(255, 40);
   rect(0,height/2,width,height);
 }
}


void preDraw(){        
  buffer.beginDraw();
}

void postDraw(){      // Does all the fancy reflections
  buffer.endDraw();
  pushMatrix();
  scale(1);
  image(buffer, 0, 0);
  popMatrix();        // Resets the coords
  pushMatrix();
  scale(-1,1);
  image(buffer, -width, 0);    // When the scale is negative, the coord is negative
  popMatrix();
  pushMatrix();
  scale(1,-1);
  image(buffer, 0, -height);
  popMatrix();
  pushMatrix();
  scale(-1,-1);
  image(buffer, -width, -height);
  popMatrix();
}

void updateMouse(){
  mx = mouseX;
  my = mouseY;
}
