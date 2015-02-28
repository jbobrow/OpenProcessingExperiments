
float rot_x = 0.0;
float rot_z = 0.0;
int x = 0;
int y = 0;
float c = 0;
void setup() {
  size(600, 600, P3D);
  smooth();
  stroke(0);
}

void draw() {
  background(75);
  mouseLines();

  translate (width/2, height/2);
  rotateX(rot_x);
  rotateZ(rot_z);
  //fill(0, 150, 50, 75);
  fill(0,175);
  noStroke();
  //box(150,150,150);
  sphere(100);
  //sphere(50);
  sphereDetail(30);
  fill(255, 100);
  stroke(0);
  strokeWeight(2.5);
  box(200, 200, 200);
  fill(0,100);
  box(250,250,250);
  noStroke();
  fill(0);
  sphere(25);
  sphereDetail(15);
  

  /*translate (width/2, height/2);
   rotateX(rot_x);
   rotateZ(rot_z);
   fill(0, 0, 255, 50);
   sphere(150);*/
}

void mouseDragged() {
  float reduire = 0.01;
  rot_x += (pmouseY-mouseY) * reduire;
  rot_z += (mouseX-pmouseX) * reduire;
}

void mouseLines() {
  c=(30);
  if ( mousePressed) {
    stroke(random(255)/*, random(255), random(255)*/, 200);
    for (x=0;x<301;x+=20) {
      line(x, 0, 0, 300);
      line(x, 600, 0, 300);
    }
    for (x=300;x<601;x+=20) {
      line(x, 0, 600, 300);
      line(x, 600, 600, 300);
    }
  }
  if (! mousePressed) {
    for (x=0;x<601;x+=50) {
      stroke (c);
      strokeWeight(1.75);
      line(x, 0, 0, 180);
      line(x, 600, 0, 420);
      line(x, 600, 600, 420);
      line(x, 0, 600, 180);
    }
    /*for (y=40;y<260;y+=40) {
     noFill();
     stroke(random(200));
     ellipse(0, 300, y, y);
     ellipse(600, 300, y, y);
     }*/
    y+=6;
  }
}


