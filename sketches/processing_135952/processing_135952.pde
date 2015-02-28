
void setup() {
  size(900,900,P3D);
  background(255,130,130);
  lights();
}

void draw() {
  float r = random(20);
  int x = 150;
  int y = 150;
  stroke(165,103,165,103);
  strokeWeight(19);
  fill(180,103,255,255);
  stroke(0,128,128,103);
  strokeWeight(r);
  strokeCap(CORNER);
  line(0,0,0,height);
  line(50,0,50,height);
  line(100,0,100,height);
  strokeWeight(40);
  stroke(255,120,120,103);
  line(0,270,width,270);
  line(0,170,width,170);
  lights();
  directionalLight(255, 156, -6, 98, 56, 1);
  float c = random(50);
  stroke(128,128,255);
  fill(0,255,128);
  strokeWeight(0.5);
  pushMatrix();
  translate(450,450, mouseY);
  sphere(c);
  popMatrix();

  //triangles
  lights();
  directionalLight(-255,-156,6,-98,-56,-1);
 
  beginShape();
  //Front face
  vertex(450,550,0);//apex
  vertex(250,700,150);//left angle
  vertex(650,700,150);//right angle
  //back face
  vertex(450,550,0);//apex
  vertex(250,700,-150);//left angle
  vertex(650,700,-150);//right angle
  //left face
  vertex(450,550,0);//apex
  vertex(250,700,150);
  vertex(250,700,-150);
  //right face
  vertex(450,550,0);
  vertex(650,700,150);
  vertex(650,700,-150);
  endShape();
}

 








