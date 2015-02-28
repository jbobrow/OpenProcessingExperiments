
/* Triacon 3D Visualization, version 201012121
 Copyright © 2010 Thomas J. Greenbaum All Rights Reserved
 The triacontahedron model is constructed one Golden Rhombus face at a time.
 User can rotate and modify the geometry.
 Class for drawing 30 faces of the triacon
 Uses Golden Ratio for dimensions
*/
class Triacon {
  int rj, rForm;
  float ryRot, rxRot, rzRot;
  // Constructor
  Triacon(int cj, float cyRot, float cxRot, float czRot, int cForm ) {
    rj      = cj;
    ryRot   = cyRot;
    rxRot   = cxRot;
    rzRot   = czRot;
    rForm   = cForm;
  }

  void drawGoldRhombus(){
    pushMatrix();                  // Save current state of matrix for next time through the for(j) loop
    rotateZ(radians(72)*rj);       // Rotate the orthogonal set of 6 Golden Rhombus around Z axis 72 degrees (360/5) 
    rotateX(goldAngle1);           // Rotate the orthogonal set of 6 Golden Rhombus around X axis to align vertexes to Z axis
    // Create the orthogonal set of 6 Golden Rhombus
    rotateY(radians(ryRot));       // Rotate Golden Rhombus Y axis
    rotateX(radians(rxRot));       // Rotate Golden Rhombus X axis
    rotateZ(radians(rzRot));       // Rotate Golden Rhombus Z axis
    translate(0, 0, Pz1);          // Translate the Golden Rhombus distance Pz from the origin on the positive Z axis
    // Create the individual Golden Rhombus, the form depends on the var rForm
    switch(rForm){
      case 0:                      // Triangle fan, has 4 triangles, diagonal lines connecting opposite vertex
        stroke(rStroke);
        fill(rFill[rj], fAlpha);           // Fill for the Golden Rhombus
        beginShape(TRIANGLE_FAN);          // Define the vertexes of the Golden Rhombus
          vertex(0,        0, Pz2);
          vertex(0, Py1*fGap,   0);
          vertex(Px2*fGap, 0,   0);
          vertex(0, Py2*fGap,   0);
          vertex(Px1*fGap, 0,   0);
          vertex(0, Py1*fGap,   0);
        endShape(CLOSE);
        break;
      case 1:                              // Rhombus only, no diagonal lines within the face area
        stroke(rStroke);
        fill(rFill[rj], fAlpha);           // Fill for the Golden Rhombus
        beginShape();                      // Define the vertexes of the Golden Rhombus
          vertex(0,  Py1*fGap, 0);
          vertex(Px2*fGap,  0, 0);
          vertex(0,  Py2*fGap, 0);
          vertex(Px1*fGap,  0, 0);
        endShape(CLOSE);
        break;
      case 2:                              // Framed outline for the faces, just the frame, no faces
        stroke(rStroke);
        fill(rFill[rj], 255);              // Fill for the Golden Rhombus
        beginShape(TRIANGLE_STRIP);
          vertex(0, Py1, 0);
          vertex(0, Py1, 1);
          vertex(Px2, 0, 0);
          vertex(Px2, 0, 1);
          vertex(0, Py2, 0);
          vertex(0, Py2, 1);
          vertex(Px1, 0, 0);
          vertex(Px1, 0, 1);
          vertex(0, Py1, 0);
          vertex(0, Py1, 1);
        endShape();
        break;
      case 3:                              // Rhombus composed of 8 golden triangles
        fill(rFill[rj], fAlpha);           // Fill for first pair of large golden triangles
        for(int i = 0; i < 360; i = i + 180) {
          pushMatrix();
          rotateZ(radians(i));              // Triangle duplicated 180 degrees opposite center of rhombus
          rotateZ(goldAngle1);              // Triangle first drawn square to the major axis then rotated into place
            beginShape();                   // Define the vertexes of the golden triangle
              vertex(0,               0, Pz2);
              vertex(Px3*fGap, Py3*fGap,   0);
              vertex(Px3*fGap,        0,   0);
            endShape();
          popMatrix();
        }
        fill(rFill[rj+1], fAlpha);           // Fill for second pair of large golden triangles
        for(int i = 0; i < 360; i = i + 180) {
          pushMatrix();
          rotateZ(radians(i));               // Triangle duplicated 180 degrees opposite center of rhombus
          rotateZ(-goldAngle1);              // Triangle first drawn square to the major axis then rotated into place
            beginShape();                    // Define the vertexes of the Golden Rhombus
              vertex(0,                0, Pz2);
              vertex(-Px3*fGap, Py3*fGap,   0);
              vertex(-Px3*fGap,        0,   0);
            endShape();
          popMatrix();
        }
        fill(rFill[rj+2], fAlpha);           // Fill for first pair of small golden triangles
        for(int i = 0; i < 360; i = i + 180) {
          pushMatrix();
          rotateZ(radians(i));               // Triangle duplicated 180 degrees opposite center of rhombus
          rotateZ(-goldAngle2);              // Triangle first drawn square to the major axis then rotated into place
            beginShape();                    // Define the vertexes of the Golden Rhombus
              vertex(0,               0, Pz2);
              vertex(0,        Px3*fGap,   0);
              vertex(Px4*fGap, Px3*fGap,   0);
            endShape();
          popMatrix();
        }
        fill(rFill[rj+3], fAlpha);           // Fill for second pair of small golden triangles
        for(int i = 0; i < 360; i = i + 180) {
          pushMatrix();
          rotateZ(radians(i));               // Triangle duplicated 180 degrees opposite center of rhombus
          rotateZ(goldAngle2);               // Triangle first drawn square to the major axis then rotated into place
            beginShape();                    // Define the vertexes of the Golden Rhombus
              vertex(0,                0, Pz2);
              vertex(0,         Px3*fGap,   0);
              vertex(-Px4*fGap, Px3*fGap,   0);
            endShape();
          popMatrix();
        }
        break;
    }
    popMatrix();                             // Restore state of matrix for next time through the for(j) loop
  }
  color getStroke() {
    return rStroke;
  }
}


