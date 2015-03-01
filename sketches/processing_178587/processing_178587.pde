
class Pupil {

  float delta = 10;  // point density
  float radius;  // slime Eyes radius
  float xp, yp, zp;    // slime's x, y, z position



  Pupil (float xpos, float ypos, float zpos, float r) {

    xp = xpos;
    yp = ypos;
    zp = zpos;
    radius = r;
  }



  void render(float inc1, float inc2, float inc3, float my) {
    inc1 = inc1*10;
    inc2 = inc2*10;
    inc3 = inc3*10;
    pushMatrix();
    translate(xp + inc1, yp + inc2 + jumpy, zp + inc3);
    rotateY(8);

    noStroke();
    fill(0);
    beginShape(TRIANGLE_STRIP);
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float phi = radians(deg2);
      for (float deg = 0; deg <= 360; deg +=delta) {
        if (deg >= 180 && deg <= 360) {
          fill(10);
          float theta = radians(deg);

          float x = radius * sin(phi)*cos(theta);
          float y = radius * sin(phi)*sin(theta);
          float z = radius * cos(phi);

          vertex(x, y, z);

          float phi2 = radians(deg2+delta);
          x = radius * sin(phi2)*cos(theta);
          y = radius * sin(phi2)*sin(theta);
          z = radius * cos(phi2);

          vertex(x, y, z);
        }
      }
    }
    endShape(CLOSE);
    popMatrix();
  }


  void jump() {
    if (isjump == true) {
      if (jumpy < 100) { 
        jumpy += 20;
      }
      if (jumpy >= 100) {
        isjump = false;
      }
    } else if (isjump == false) {
      if (jumpy <= 0) {
        isjump = false;
        jumpy = 0;
      } 
      if (jumpy > 0) {
        jumpy -= 20;
      }
    }
  }
}

