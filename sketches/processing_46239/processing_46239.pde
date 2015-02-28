
//import processing.opengl.*;

int part=300, part2=10;
float pro[], var[], cx, cy, radio=1, radio2=1, radio3=1, piy;
float ang=TWO_PI/(float)part;

void setup() {
  size(800, 400, P3D); 
  background(0); 
  smooth();
}

void draw() {
  stroke(255);
  strokeWeight(0.5);
  translate(width/2, height/2);
  point(0, 0);
  stroke(223, 235);
  rotateX(-20);
  for (int i=0;i<part; i++) {
    for (int s=0;s<radio/30;s+=40) {
      point(radio*sin(ang*i)+s, radio*cos(ang*i)+s);
      ang+=i;
      radio+=0.01;
    }
  }
  strokeWeight(1.5);
  for (int i=0;i<part2; i++) {
    point(radio2*sin(ang*i), radio2*cos(ang*i));
    // ang+=i+1.5;
    radio2+=5;
  }
  strokeWeight(2);
  for (int i=0;i<part/30; i++) {
    point(radio3*sin(ang*i), radio3*cos(ang*i), sin(i));
    //    ang+=i+1.5;
    radio3+=1;
  }
  strokeWeight(3);
  for (int i=0;i<part/100; i++) {
    point(radio3*sin(ang*i), radio3*cos(ang*i), sin(i));
  }
}


