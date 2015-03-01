
void setup(){
  size(800,600,P3D);
  fill(255);
  noStroke();
}
void draw(){
  background(0);
  lights();
  translate(width/2,height/2);
  rotateX(-atan(sin(PI/4)));
  rotateY(PI/4+TWO_PI*frameCount/60/20);
  float radius = 20;
  float angle = -TWO_PI*frameCount/60/60;
  float speed = 10;
  float deltaAngle;
  for(int i=0;i<512;i++){
    pushMatrix();
    deltaAngle = speed/radius;
    angle += deltaAngle;
    radius += 20/TWO_PI*deltaAngle;
    rotateX(PI/64*cos(TWO_PI*i/512*12-TWO_PI*frameCount/60/2));
    rotateY(PI/64*cos(TWO_PI*i/512*12-TWO_PI*frameCount/60/2.1));
    translate(radius*cos(angle),radius*sin(angle));
    rotateZ(angle);
    fill(
    128+127*cos(TWO_PI*i/512*32-TWO_PI*frameCount/60/-1.9),
    128+127*cos(TWO_PI*i/512*42-TWO_PI*frameCount/60/2.1),
    128+127*cos(TWO_PI*i/512*22-TWO_PI*frameCount/60/-2));
    rotateX(PI/8*cos(TWO_PI*i/512*9-TWO_PI*frameCount/60/3));
    box(16+4*cos(TWO_PI*i/512*16-TWO_PI*frameCount/60),8,8);
    popMatrix();
  }
}



