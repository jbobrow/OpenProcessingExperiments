

 int total = 1;

Face[] faces = new Face[total];

void setup() {
  size(700, 400);
 

 
  background(0);
  smooth();
  noStroke();
  fill(255,60);
  for (int i=0; i< faces.length; i++) {
    faces[i]= new Face(random(350, 350), random(200, 200), 0);
    faces[i].display();
  
}
   
}

void draw() {
  background(0);
  for (int i=0; i< faces.length; i++) {
    faces[i].display();
    faces[i].shake();
  }
}

void mouseDragged() {
 //total = total + 1;
 //faces = (Face[])expand(faces, total);
 //faces[total + 1] = new Face(random(350, 350), random(200, 200), 0);
  
  total = 1;
 faces = new Face[total];
 faces[0] = new Face(width/2, height/2, 0);

}

void mousePressed() {
  total = total + 1;
  faces = (Face[])expand(faces, total);
  faces[total - 1] = new Face(random(350, 350), random(200, 200), 0);


}

class Face {
  float x = 100;
  float y = 100;
  int csize = 0;
  int a = 20;

  Face(float xp, float yp, int fsize) {
    x = xp;
    y = yp;
    csize = fsize;
  }

  void display() {
    ellipse(x, y, csize, csize);
    csize = csize + 1;
  }

  void shake() {
    x=x+random(a)-random(a);
    // a = a + 1;
    y=y+random(a)-random(a);
    //a = a + 1;
  }
}

