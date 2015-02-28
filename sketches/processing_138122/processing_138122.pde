
PImage img;
PImage img2;
int imgW;
int imgH;
float theta=0;
int flag=0;
int n=1;
int particles=6;
int image=1;
void setup() {

  img=loadImage("1.jpg");
  img2=loadImage("2.jpg");
  //Resize Image
  imgW=1024;
  imgH=720;
  size(1024, 720);
  background(5);
}

void draw() {
  loadPixels();
  //# of particles
  if (mousePressed) {
    if (mouseButton==LEFT) {

      particles++;
    }
    if (mouseButton==RIGHT) {

      particles--;
    }
  }

  //Change Image(Images should have the same size for better results)
  if (keyPressed) {
    if (key=='c'||key=='C') {
      image=image*(-1);
    }
  }

  noStroke();
  fill(5, 60);
  rect(0, 0, width*2, height*2);
  noFill();
  noStroke();
  theta+=10;
  pushMatrix();
  for (int i=-width/2;i<width/2;i+=particles) {
    for (int j=-height/2;j<height/2;j+=particles) {
      int k=int(map(i, -width/2, width/2, 0, imgW));
      int l=int(map(j, -height/2, height/2, 0, imgH));
      if (image==1) {
        stroke(img.get(k, l));
      }
      if (image==-1) {
        stroke(img2.get(k, l));
      }
      float r=10;
      pushMatrix();
      translate(k, l);
      thing(r, theta, i, j, flag, n);
      popMatrix();
    }
  }
  popMatrix();

  //Change Modes
  if (keyPressed) {
    if (key=='1') {
      flag=0;//Lines
      n=1;
    }
    if (key=='2') {
      flag=1;//Circles
      n=1;
    }
    if (key=='3') {
      flag=2;//Rects
      n=1;
    }
    if (key=='4') {
      flag=3;//Polygons
      n=1;
    }
  }

  //n-gon
  if (keyPressed) {
    if (n>=0) {   
      if (key=='+'||key=='=') {
        n++;
      }
      if (key=='-') {
        n--;
      }
    }
  }


  //Save Frames
  if (keyPressed) {
    if (key=='s'||key=='S') {
      saveFrame(random(frameCount)+".tif");
    }
  }
}

void thing(float r, float theta, int i, int j, int flag, int n) {
  pushMatrix();
  translate(sin(radians(theta-j))*3, cos(radians(theta-i))*3);
  float rot=map(i*j, -width/2, width/2, -2, 2);
  rotate(radians(theta-rot));

  if (flag==0) {
    polygon(2, 0, 0, r);
  }
  if (flag==1) {
    ellipse(0, 0, r, r);
  }
  if (flag==2) {
    polygon(4, 0, 0, r);
  }

  if (flag==3) {
    polygon(n, 0, 0, r);
  }
  popMatrix();
}



//Polygon 
void polygon(int n, float cx, float cy, float r) 

{
  float angle=360/n;
  beginShape();
  for (int i=0;i<n;i++) {
    vertex(cx+r*cos(radians(angle*i)), 
    cy+r*sin(radians(angle*i)));
  }
  endShape(CLOSE);
}


