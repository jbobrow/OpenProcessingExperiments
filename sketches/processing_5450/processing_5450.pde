
import processing.opengl.*;

Bouton[][]boutons = new Bouton[80][80];

float s = 12.5;
void setup(){
  size(900, 900, P3D);


  for (int i = 0; i < 80; i++) {
    for (int j = 0; j < 80; j++) {
      boutons[i][j] = new Bouton(-25+i*12.5, -25+j*12.5, -550);
    }
  }

}

void draw(){
  background(85, 50, 50);
  translate(width/2, height/2, -150);

  translate(-width/2, -height/2, 150);
  ambientLight(0, 0, 55);
  directionalLight(250, 250, 250, -1, 1, -1);
  for (int i = 0; i < 80; i++) {
    for (int j = 0; j < 80; j++) {
      boutons[i][j].render();

    }
  }
  pushMatrix();
  for (int i = 1; i < 79; i++) {
    for (int j = 1; j < 79; j++) {
      float x = boutons[i][j].x;
      float y = boutons[i][j].y;
      float z = boutons[i][j].z;
      float x1 = boutons[i-1][j].x;
      float y1 = boutons[i-1][j].y;
      float z1 = boutons[i-1][j].z;
      float x2= boutons[i-1][j-1].x;
      float y2 = boutons[i-1][j-1].y;
      float z2 = boutons[i-1][j-1].z;
      float x3 = boutons[i][j-1].x;
      float y3 = boutons[i][j-1].y;
      float z3 = boutons[i][j-1].z;

     fill(150,255, 100);
     stroke(0, 0, 55);
     
      beginShape(QUADS);

      vertex(x, y, z);
      vertex(x1, y1, z1);
      vertex(x2, y2, z2);
      vertex(x3, y3, z3);


      endShape(CLOSE);

    }

  }

  popMatrix();
}
class Bouton{
  float stiffness = 0.25;
  float damping = 0.99;
  float velocityY = 0.0;
  float velocityX = 0.0;
  float velocityZ = 0.0;
  float targetY;
  float targetX;
  float targetZ;
  float a, b, c;
  float mass = 10.0;
  float x, y, z;

  Bouton(float xpos, float ypos, float zpos){
    x = xpos;
    y = ypos;
    z = zpos;
    a = xpos;
    b = ypos;
    c = zpos;
    targetX = a;
    targetY = b;
    targetZ = c;
  }
  void render(){
    float forceX = stiffness * (targetX -x);
    float accelerationX = forceX / mass;
    velocityX = damping * (velocityX + accelerationX);
    x += velocityX;
    float forceY = stiffness * (targetY -y);
    float accelerationY = forceY / mass;
    velocityY = damping * (velocityY + accelerationY);
    y += velocityY;
    float forceZ = stiffness * (targetZ -z);
    float accelerationZ = forceZ / mass;
    velocityZ = damping * (velocityZ + accelerationZ);
    z += velocityZ;
    targetX = a;
    targetY = b;
    targetZ = c;
    float d = dist(mouseX, mouseY, x, y);
    if(mousePressed==true && d < s*8 ){
      targetX = mouseX;
      targetY = mouseY;
      targetZ = -950;

    }

  }
}




