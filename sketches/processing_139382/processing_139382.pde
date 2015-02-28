
/* @pjs preload="800px-JM_marbles_01.jpg,Marbles_01.JPG"; */

PImage img,gmi;
PImage[] images;
ArrayList<Triangle> triangles;
float rr,theta,hw,hh;
float mx, my;
float a;
int n = 12;
int nimages;
int j;
boolean pressed;

void setup() {
  size(480,480,P3D);
  background(0);
  noStroke();
  colorMode(HSB);
  textureMode(NORMAL);
  nimages = 2;
  images = new PImage[nimages];
  hw = (float)width/2;
  hh = (float)height/2;
  mx = hw;
  my = hh;
  a = random(.1,1);
  rr = (sqrt(width*width+height*height));
  theta = 2*PI/n;
  triangles = new ArrayList<Triangle>();
  for (int j=0;j<n;j++) {
    triangles.add(new Triangle(j*theta));
  }
  
  images[0] = loadImage("Marbles_01.JPG");
  images[1] = loadImage("800px-JM_marbles_01.jpg");
  img = images[1];
  //String url = "http://upload.wikimedia.org/wikipedia/commons/thumb/a/a1/JM_marbles_01.jpg/800px-JM_marbles_01.jpg";
  //String url = "http://upload.wikimedia.org/wikipedia/commons/0/0f/Marbles_01.JPG";
  //Load image from a web server
  //img = loadImage(url, "jpg");
  gmi = img;

}

void draw() {
  if (pressed) {
    mx = mouseX;
    my = mouseY;
  }
  for (int i=0;i<n;i+=2) {
      triangles.get(i).display(hw,hh);
      triangles.get(i+1).display_f(hw,hh);
  }
}

class Triangle {
  PVector end1 = new PVector();
  PVector end2 = new PVector();
  Triangle(float angle) {  
    float atheta = angle+theta; 
    this.end1.x = rr*cos(angle)+.5*width;
    this.end1.y = rr*sin(angle)+.5*height;
    this.end2.x = rr*cos(atheta)+.5*width;
    this.end2.y = rr*sin(atheta)+.5*height; 
  }
  
  void display(float X1,float Y1) {
    float a1,a2;
    if (pressed) {
        a1 = mouseX/(float)width;
        a2 = (mouseY+hh)/(float)height;
    }
    else {
        a1 = mx/(float)width;
        a2 = (my+hh)/(float)height;
    }
    beginShape();
    texture(img);
    vertex(X1,Y1,a1,0);
    vertex(end1.x,end1.y,0,1);
    vertex(end2.x,end2.y,a1,a2);
    endShape();
  }
  void display_f(float X1,float Y1) {
        float a1,a2; 
    if (pressed) {
        a1 = mouseX/(float)width;
        a2 = (mouseY+hh)/(float)height;
    }
    else {
        a1 = mx/(float)width;
        a2 = (my+hh)/(float)height;
    }
    beginShape();
    texture(img);
    vertex(X1,Y1,a1,0);
    vertex(end1.x,end1.y,a1,a2);
    vertex(end2.x,end2.y,0,1);
    endShape();
  }
}

void mousePressed() {
  pressed = !pressed;
}

void keyPressed() {
  switch(key) {
    case ' ': 
      j = (j+1)%nimages;
      img = images[j];
      gmi = img;
      break;
    case 's':
      save("kaleidoscope.jpg");
      break;
    default:
      break;
  }
}


