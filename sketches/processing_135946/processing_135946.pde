
void setup() {
  size(2880,1800,P3D);
  background(134,134,230);
  lights();
}

void draw() {
  directionalLight(134,1,230,06,-70,800);
  stroke(255,255,130);
  strokeWeight(10);
  for(int x = 5; x < 2880; x += 20) {
    line(x,0,x, 1800);
  }
    for(int a = 400; a < 1200; a += 300) {
      fill(255);
      strokeWeight(01);
      pushMatrix();
      translate(a,900,0);
      sphere(80);
      popMatrix();
    }
      fill(128,128,255);
     noStroke();
     int b = 0;
     int c = 1;
     int d = 2;
     int e = 3;
     int f = 4;
//      for(int b = 0; b < displayWidth; b += 200) {
//        for(int c = 1; c < displayWidth; c += 200) {
//          for(int d = 2; d < displayWidth; d += 200) {
//            for(int e = 3; e < displayWidth; e += 200) {
//              for(int f = 4; f < displayWidth; f += 200) {

    for(float a = 325.0; a < 1200; a += 300) {
      pushMatrix();
                translate( a,600,0);
                scale(40);
                beginShape(TRIANGLES);
                //triangle a
                vertex(b,0,0);
                vertex(c,2,0);
                vertex(d,2,2);
                //endShape();
                //beginShape(TRIANGLES);
                //triangle b
                vertex(b,0,0);
                vertex(d,2,2);
                vertex(d,1.0);
                //endShape();
                //beginShape(TRIANGLES);
                //triangle c
                vertex(d,1,0);
                vertex(f,0,0);
                vertex(d,2,2);
                endShape();
                beginShape(TRIANGLES);
                //triangle d
                vertex(f,0,0);
                vertex(d,2,2);
                vertex(e,2,0);
                endShape();
                beginShape(TRIANGLES);
                //triangle e
                vertex(f,4,0);
                vertex(e,2,0);
                vertex(d,2,2);
                endShape();
                beginShape(TRIANGLES);
                //triangle f
                vertex(f,4,0);
                vertex(d,2,2);
                vertex(d,3,0);
                endShape();
                beginShape(TRIANGLES);
                //triangle g
                vertex(0,4,0);
                vertex(2,3,0);
                vertex(2,2,2);
                endShape();
                beginShape(TRIANGLES);
                //triangle h
                vertex(0,4,0);
                vertex(2,2,2);
                vertex(1,2,0);
                
                endShape();
                popMatrix();
                
                noStroke();
                pushMatrix();
                translate( a - 50,300,0);
                scale(65);
                directionalLight(246,0,255,187,190,87);
                //front face of pyramid
              
                rotateX(.2);
                beginShape(TRIANGLES);
                vertex(2,0,0);//apex
                vertex(0,2,2); //front left corner
                vertex(4,2,2); // front right corner
                //left side
                vertex(2,0,0);//apex
                vertex(0,2,2);//front left corner
                vertex(0,2,-2);//back left corner
                //right side
                vertex(2,0,0); // apex
                vertex(4,2,2); // front right corner
                vertex(4,2,-2);//back right corner
                //back side
                vertex(2,0,0);//apex
                vertex(0,2,-2); // back left corner
                vertex(4,2,-2);//back right corner
                //bottom
               
                endShape(CLOSE);
                popMatrix();
    }
//              }
//            }
//          }
//        }
//      }
      
      
}


