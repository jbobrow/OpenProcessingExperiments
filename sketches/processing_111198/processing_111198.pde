
//CUBE PART -------------------------
int sizeCube = 100;
int sizeMargin = 5;
int offset = sizeCube + sizeMargin;
int rotateAxis, rotatePosition, rotateAngle;
float a =PI/2;
//SLIDER PART --------------------------
boolean dragging = false;
float m =100;
float r = 400; //radius of ellipse
float sliderStart = 100;
float sliderEnd = 500;
float offsetX = 0;

void setup() {
  size(600, 600, P3D);
  smooth(); }

void draw() {
  background(0); lights();
  cameraView();
  mousePressed1();
  if(dragging) {
    a = map(mouseX, sliderStart, sliderEnd, 0,1720);
    m = mouseX + offset;}
  dragging = false;
  sliderBar();}
  
  void cameraView() {
  noStroke();
  camera();
  lights();
  float camDist = 500;
  float camAngle = radians(a*0.1);
  pushMatrix();
  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
  camera(camDist*sin(camAngle), -400, camDist*cos(camAngle), 0, 0, 0, 0, 1, 0);
  translate(-offset, -offset, -offset);
  cubeMatrix( );
  popMatrix();
}

void cubeMatrix() {
  fill(255, 123);
  noStroke();
  for (int xAxis= 0; xAxis<3; xAxis++) {
    for (int yAxis=0; yAxis<3; yAxis++) {
      for (int zAxis=0; zAxis<3; zAxis++) {
        pushMatrix();
        translate(xAxis*offset-5, yAxis*offset-5, zAxis*offset-5);
        box(sizeCube);
        popMatrix();
      }
    }
  }
}

void keepRotate() {
  //for(int i =0; i<360; i++){
  translate(-offset, -offset, -offset);
  
  rotateX(1);
  rotateY(1);
  //}
}


void mousePressed1() {
    if (mouseX > m && mouseX< m+r && mouseY >505 && mouseY < 575&&mousePressed;) {
      dragging = true;
    }
  }
  
void sliderBar() {
  m= constrain(m, sliderStart, sliderEnd-r);
  stroke(255, 100);
  strokeWeight(0.5);
  line(sliderStart, 550, sliderEnd, 550);
  if (dragging) {
    keepRotate();
  }
  ellipseMode(CENTER);
  ellipse(constrain(mouseX, sliderStart, sliderEnd), 550, 5, 5);
}
