
import processing.opengl.*;
PImage tex;
float rotx = PI/1;
float roty = PI/1;

void setup() 
{
  size(840, 600, P3D);
  tex = loadImage("maya.jpg");
  textureMode(NORMALIZED);
  fill(255);
  stroke(color(44,48,32));
}

void draw() 
{
  background(255,3,150);
  noStroke();
  translate(width/2.0, height/2.0, -300);
  rotateX(rotx);
  rotateY(roty);
  scale(100);
  TexturedCube(tex);
}

void TexturedCube(PImage tex) {
  beginShape(QUADS);
  texture(tex);

  // Given one texture and six faces, we can easily set up the uv coordinates
  // such that four of the faces tile "perfectly" along either u or v, but the other
  // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces
  // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
  // rotation along the X axis will put the "top" of either texture at the "top"
  // of the screen, but is not otherwised aligned with the X/Z faces. (This
  // just affects what type of symmetry is required if you need seamless
  // tiling all the way around the cube)
  
  // +Z "front" face
  vertex(-1, -1,  1, 0, 0);
  vertex( 1, -1,  1, 1, 0);
  vertex( 1,  1,  1, 1, 1);
  vertex(-1,  1,  1, 0, 1);

  // -Z "back" face
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1,  1, -1, 1, 1);
  vertex( 1,  1, -1, 0, 1);

  // +Y "bottom" face
  vertex(-1,  1,  1, 0, 0);
  vertex( 1,  1,  1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1,  1, 1, 1);
  vertex(-1, -1,  1, 0, 1);

  // +X "right" face
  vertex( 1, -1,  1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1,  1, -1, 1, 1);
  vertex( 1,  1,  1, 0, 1);

  // -X "left" face
  vertex(-1, -1, -1, 0, 0);
  vertex(-1, -1,  1, 1, 0);
  vertex(-1,  1,  1, 1, 1);
  vertex(-1,  1, -1, 0, 1);

  endShape();
  
  
  pushMatrix();    
    translate( 120, 120, 0 );
rotateX( PI/6 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    translate(width/5.0, height/5.0, 300);
  rotateX(rotx);
  rotateY(roty);
 // scale(20);
    drawCylinder( 6, 50, 80, 100 );
    popMatrix();

    pushMatrix();    
    translate( 330, 120, 0 );
    //rotateX( PI/4 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    translate(width/5.0, height/5.0, 300);
  rotateX(rotx);
  rotateY(roty);
    drawCylinder( 9, 40, 20, 100 );
    popMatrix();

    pushMatrix();    
    translate( 120, 330, 0 );
    rotateX( PI/2 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    translate(width/5.0, height/5.0, 300);
  rotateX(rotx);
  rotateY(roty);
    drawCylinder( 30, 50, 50, 100 );
    popMatrix();

    pushMatrix();    
    translate( 330, 330, 0 );
   // rotateX( PI/12 );
    rotateY( radians( frameCount ) );
    rotateZ( radians( frameCount ) );
    translate(width/5.0, height/5.0, 300);
  rotateX(rotx);
  rotateY(roty);
    drawCylinder( 8, 50, 5, 100 );
    popMatrix();
}


void mouseDragged() {
  float rate = 0.01;
  rotx += (pmouseY-mouseY) * rate;
  roty += (mouseX-pmouseX) * rate;
}
 void drawCylinder( int sides, float r1, float r2, float h)
{
    float angle = 360 / sides;
    float halfHeight = h / 2;

    // draw top of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r1;
        float y = sin( radians( i * angle ) ) * r1;
        vertex( x, y, -halfHeight);
    }
    endShape(CLOSE);

    // draw bottom of the tube
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r2;
        float y = sin( radians( i * angle ) ) * r2;
        vertex( x, y, halfHeight);
    }
    endShape(CLOSE);
    
    // draw sides
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < sides + 1; i++) {
        float x1 = cos( radians( i * angle ) ) * r1;
        float y1 = sin( radians( i * angle ) ) * r1;
        float x2 = cos( radians( i * angle ) ) * r2;
        float y2 = sin( radians( i * angle ) ) * r2;
        vertex( x1, y1, -halfHeight);
        vertex( x2, y2, halfHeight);    
    }
    endShape(CLOSE);

}



