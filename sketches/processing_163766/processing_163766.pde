
void setup()
{
  size(600, 600, P3D);
}

void draw()
{
  background(255);
  translate(width/2, height/2,0);
  rotateX(y);
  y+=0.5;
  
  for (float Q= 0; Q<30; Q+=0.5) {
    for (float deg =0; deg<360; deg+=0.5 ) {
      float P =  radians(Q);
      float theta = radians(deg);
      float x= R* sin(P)*cos(theta);
      float y= R* sin(P)*sin(theta);
      float z= R* cos(P);
      strokeWeight(2);
      stroke(255, 0, 0);
      point(x, y, z);
    }
  }
  
  for (float Q= 30; Q<60; Q+=0.5) {
    for (float deg =0; deg<360; deg+=0.5) {
      float P =  radians(Q);
      float theta = radians(deg);
      float x= R* sin(P)*cos(theta);
      float y= R* sin(P)*sin(theta);
      float z= R* cos(P);
       strokeWeight(2);
      stroke(255, 184, 3);
      point(x, y, z);
    }
  }
  for (float Q= 60; Q<90; Q+=0.5) {
    for (float deg =0; deg<360; deg +=0.5) {
      float P =  radians(Q);
      float theta = radians(deg);
      float x= R* sin(P)*cos(theta);
      float y= R* sin(P)*sin(theta);
      float z= R* cos(P);
       strokeWeight(2);
      stroke(255, 230, 3);
      point(x, y, z);
    }
  }
for (float Q= 90; Q<120; Q+=0.5) {
    for (float deg =0; deg<360; deg +=0.5) {
      float P =  radians(Q);
      float theta = radians(deg);
      float x= R* sin(P)*cos(theta);
      float y= R* sin(P)*sin(theta);
      float z= R* cos(P);
       strokeWeight(2);
      stroke(73,255,3);
      point(x, y, z);
    }
  }
  for (float Q= 120; Q<150; Q+=0.5) {
    for (float deg =0; deg<360; deg +=0.5) {
      float P =  radians(Q);
      float theta = radians(deg);
      float x= R* sin(P)*cos(theta);
      float y= R* sin(P)*sin(theta);
      float z= R* cos(P);
       strokeWeight(2);
      stroke(3, 173, 255);
      point(x, y, z);
    }
  }
  for (float Q= 150; Q<180; Q+=0.5) {
    for (float deg =0; deg<360; deg +=0.5) {
      float P =  radians(Q);
      float theta = radians(deg);
      float x= R* sin(P)*cos(theta);
      float y= R* sin(P)*sin(theta);
      float z= R* cos(P);
       strokeWeight(2);
      stroke(170, 3, 255);
      point(x, y, z);
    }
  }
}

