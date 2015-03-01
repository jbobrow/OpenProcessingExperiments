
float r = 120;
float X1, Y1=10;
int MAX = 648; 

float mouthDelta = 3;
float mouth = 0;
boolean isOpening = true;


void setup() {
  size(800, 800, P3D);
  frameRate(60);
  colorMode(HSB, 360, 100, 100);
}

void drawPac() {
pushMatrix();
fill(150);
sphere(500);
  popMatrix();
} 



void draw() {
  if (isOpening) {
    if (mouth<30)
      mouth+=mouthDelta;
    else
      isOpening = false;
  } else {
    if (mouth>0)
      mouth-=mouthDelta;
    else
      isOpening = true;
  }


  background(0);
  noStroke();
  lights();
  if (mousePressed) {
    noLights();
  }




  translate(width/2, height/2, 0);
  if (mousePressed) {
    rotateY(radians(0));
  } else {
    rotateY(radians(mouseX));
  }
  pushMatrix();
  rotateX(radians(180));  //upper
  rotateY(radians(180));
  rotateZ(radians(-mouth));
  fill(255, 0, 0);
  drawPacman(mousePressed);
  popMatrix();

  pushMatrix();
  rotateZ(radians(mouth));
  fill(0, 255, 0);
  rotateY(radians(180));
  drawPacman(mousePressed);
  popMatrix();
}

void drawPacman(boolean isDot) {
  if (isDot) {
    //drawBody
    float delta = 20;
    beginShape(TRIANGLE_STRIP);
    for (float deg2 =0; deg2 <= 180; deg2 += delta) {
      float phi = radians(deg2);
      for (float deg = 0; deg <= 180; deg +=delta) {

        fill(55, 100, 100);      

        float theta = radians(deg);
        float x = r * sin(phi)*cos(theta);
        float y = r * sin(phi)*sin(theta);
        float z = r * cos(phi);
        pushMatrix();
        translate(x, y, z);
        box(40);
        popMatrix();
      }
    }
    endShape(CLOSE);
  } else {
    float delta = 3;
    beginShape(TRIANGLE_STRIP);
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float phi = radians(deg2);
      for (float deg = 0; deg <= 180; deg +=delta) {

        fill(55, 100, 100);      
        float theta = radians(deg);
        float x = r * sin(phi)*cos(theta);
        float y = r * sin(phi)*sin(theta);
        float z = r * cos(phi);
        vertex(x, y, z);
        float phi2 = radians(deg2+delta);
        x = r * sin(phi2)*cos(theta);
        y = r * sin(phi2)*sin(theta);
        z = r * cos(phi2);
        vertex(x, y, z);
      }
    }
    endShape(CLOSE);
  }

}




