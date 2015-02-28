

//==========================================================
// sketch:  PG_PlayingWithRecursion              2012-02-22
// originally based on "Platon's Dream" by Martin Schneider
//   http://www.openprocessing.org/visuals/?visualID=6009
//
// Draw a rotating cube where the sketch picture will be projected 
// to the six cube walls in the next frame. As result we get an 
// animated pseudo-3D iterative function system.
//==========================================================

color bg = #ffff55;      // yellow background
color fg = #123456;      // dark green  border
int border = 55;         // border thickness
float opacity = 200;     // somewhat transparent
float shady   = 200;     // somewhat shady
boolean transparent = false;
boolean shadow = true;
float s,s2,w2,h2;        // window size of our sketch 
PImage alphaImg;         // used for transparency

//-----------------------------------
void setup()
{
  size(512,512, P3D); 
  w2 = width / 2;
  h2 = height / 2;
  s = (w2 < h2) ? width : height;
  s2 = s / 2;   
  alphaImg = get();   // create alpha image for transparency effect
  colorMode(HSB, 255);
  textureMode(NORMALIZED);
}
//-----------------------------------
void draw()
{
  PImage img = get();  // get a slightly transparent copy of the visible scene
  if(transparent) img.mask(alphaImg);
  float cc = (frameCount*0.7)%255;

  // DRAW BACKGROUND
  if(shadow) 
  { // add some shading by fading the previous frame
    hint(DISABLE_DEPTH_TEST);
    fill(bg, 255-shady);
    noStroke(); 
    rect(w2-s2, h2-s2, s,s);
    hint(ENABLE_DEPTH_TEST);
  } 
  else background(bg, cc); 
  
  // DRAW SCENE
  pushMatrix();
    translate(w2,h2,s2);  // translate origin to the center
    translate(0,0,-s);
    // rotate the cube 
    rotateX(frameCount * .0073); 
    rotateY(frameCount * .0052);
  
    // draw all six faces of the cube
    for(int i=0; i<6; i++)
    { // roatate to next face direction
      rotateY(-PI/2* ( (i+1) %2)); 
      rotateX(PI/2 * (i%2)); 
      face(img);
    }
  popMatrix(); 
  
  // DRAW FOREGROUND
  // draw an extra thick frame around the viewport
  hint(DISABLE_DEPTH_TEST);
  stroke(cc,cc,177,144); 
  noFill();
  strokeWeight(border+mouseX/10);
  rect(w2-s2, h2-s2, s, s);
  hint(ENABLE_DEPTH_TEST);
}
//-----------------------------------
void face(PImage img) 
{
  pushMatrix();
    // "explode" the face if the mouse is moved
    float z = 1 + float(mouseY)*0.1/s;
    scale(1/z);
    translate(0, 0, s2 * z); 

    // project the image onto the face
    beginShape();
      texture(img);
      vertex(-s2, -s2, 0, 0);
      vertex(-s2,  s2, 0, 1);
      vertex( s2,  s2, 0, 1, 1);
      vertex( s2, -s2, 0, 1, 0);
    endShape();
  popMatrix(); 
}
//-----------------------------------
void keyPressed()
{ switch(key) {
    case 't':  transparent = !transparent;  break; // toggle transparency
    case 's':  shadow = !shadow;   break;   // toggle shadow
    case 'p':  save("PlayingWithRecursion.png");   break;   // save picture
  }
}



