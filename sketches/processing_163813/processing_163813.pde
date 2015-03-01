
float x, y, z ;
float delta = 3;

void setup() {
  size(600, 600, P3D);
  frameRate(30);
}

void draw() {
  background(255);
  translate(width/2, height/2,0);
  rotateX(radians(90));
  spere();
}

void spere() {

    for (float theta = 0; theta < 360; theta+=5) {
      for(float pol = 0; pol < 180; pol+=delta) {
          float theta_r = radians(theta);
          float pol_r = radians(pol);
          float r = random(100, 200);
          float x = r*sin(pol_r)*cos(theta_r);
          float y = r*sin(pol_r)*sin(theta_r);
          float z = r*cos(pol_r);
          stroke(random(255), random(255), random(255));
          point(x, y, z);
          
          if(mousePressed) {
            background(255);
          for (theta = 0; theta < 360; theta+=5) {
      for(pol = 0; pol < 180; pol+=delta) {
          theta_r = radians(theta);
          pol_r = radians(pol);
          r = 200;
          x = r*sin(pol_r)*cos(theta_r);
          y = r*sin(pol_r)*sin(theta_r);
          z = r*cos(pol_r);
          stroke(random(255), random(255), random(255));
          line(x, y, z, x+10, y+10, z+10);
          float i = mouseX+mouseY;
          rotate(PI/i);
          }
          }
          }
          
         if(keyPressed) {
           for ( theta = 0; theta < 360; theta+=5) {
      for( pol = 0; pol < 180; pol+=delta) {
           theta_r = radians(theta);
           pol_r = radians(pol);
           r = random(100, 200);
           x = r*sin(pol_r)*cos(theta_r);
           y = r*sin(pol_r)*sin(theta_r);
           z = r*cos(pol_r);
              if(key==CODED) {
                   if (keyCode == UP) {
                       line(x, y, z, x+5, y+5, z+5);
                       stroke(random(255), random(255), random(255));
                       rotate(PI/2);
                        } else if (keyCode == DOWN) {
                          line(x, y, z, x+10, y+10, z+10);
                          stroke(random(255), random(255), random(255));
                          rotate(-PI/2);
                        }
                      }
                    }
          
      }
    }

      }
    }
}

