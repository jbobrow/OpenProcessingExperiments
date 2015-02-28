
/*
© 2013 Luck$mith

Move mouse to rotate
Click for a new stone
*/


Diamond d;

float lr;
float lg;
float lb;

//boolean sketchFullScreen() {
//  return true;
//}

void setup() {
  //size(displayWidth, displayHeight,P3D);
  size(400,400,P3D);
  colorMode(RGB,1);
  noStroke();
  d = new Diamond();
  lr = random(0.5,1);
  lg = random(0.5,1);
  lb = random(0.5,1);
}

void draw() {
  lights();
  background(0);
  translate(width/2,height/2,-1*(width+height));
  pointLight(lr,lg,lb,width,height,-(width+height)/4);
  scale(min(width,height)/2);
  rotateY(map(mouseX,0,width,-TWO_PI,TWO_PI));
  rotateX(-1*map(mouseY,0,height,-TWO_PI,TWO_PI));
  rotateZ(radians(frameCount/8 % 360));
  d.show();
}

void mouseClicked() {
  d = new Diamond(); 
  lr = random(0.5,1);
  lg = random(0.5,1);
  lb = random(0.5,1);
}

class Diamond {
  float r;       //red
  float g;       //green
  float b;       //blue
  float a;       //transparency
  int n;         //number of vertixes of upper facet
  PVector[] v1;  //array of vertixes in upper facet
  PVector[] v2;  //array of vertixes in middle facet
  PVector v3;    //lower vertix
  
  Diamond() {
    h = random(1);
    s = random(1);
    b = random(1);
    a = random(0.3,0.9);
    n = int(random(3,9));
    v1 = new PVector[n];
    v2 = new PVector[2*n];
    v3 = new PVector(0,0,-2);
    sp = new PVector();
    float da = PI/n;
    for (int i=0; i<n; i++) {
      v1[i] = new PVector(cos(da*i*2+da/2),sin(da*i*2+da/2),1);
    }
    for (int i=0; i<2*n; i++) {
      v2[i] = new PVector(2*cos(da*i),2*sin(da*i),0);
    }
  }

  void show() {
    fill(r,g,b,a);
    //specular(sp.x,sp.y,sp.z);
    beginShape(TRIANGLE);
    vertex(v3.x,v3.y,v3.z);
    for (int i=0; i<n*2; i++) {
      //vertex(v3.x,v3.y,v3.z);
      vertex(v2[i].x,v2[i].y,v2[i].z);
      //vertex(v2[(i+1)%(n*2)].x,v2[(i+1)%(n*2)].y,v2[(i+1)%(n*2)].z);
    }
    vertex(v2[0].x,v2[0].y,v2[0].z);
    endShape(CLOSE);
    beginShape(TRIANGLE);
    vertex(v1[0].x,v1[0].y,v1[0].z);
    for (int i=1; i<(n); i++) {
      //vertex(v1[0].x,v1[0].y,v1[0].z);
      vertex(v1[i].x,v1[i].y,v1[i].z);
      //vertex(v1[i+1].x,v1[i+1].y,v1[i+1].z);
    }
    //vertex(v1[0].x,v1[0].y,v1[0].z);
    endShape(CLOSE);
    //beginShape(TRIANGLE);
    for (int i=0; i<n; i++) {
      beginShape(TRIANGLE);
      vertex(v1[i].x,v1[i].y,v1[i].z);
      vertex(v2[i*2].x,v2[i*2].y,v2[i*2].z);
      vertex(v2[i*2+1].x,v2[i*2+1].y,v2[i*2+1].z);
      endShape(CLOSE);
      
      beginShape(TRIANGLE);
      vertex(v1[i].x,v1[i].y,v1[i].z);
      vertex(v2[i*2+1].x,v2[i*2+1].y,v2[i*2+1].z);
      vertex(v2[(2*i+2)%(n*2)].x,v2[(2*i+2)%(n*2)].y,v2[(2*i+2)%(n*2)].z);
      endShape(CLOSE);

      beginShape(TRIANGLE);
      vertex(v1[i].x,v1[i].y,v1[i].z);
      vertex(v2[(2*i+2)%(n*2)].x,v2[(2*i+2)%(n*2)].y,v2[(2*i+2)%(n*2)].z);
      vertex(v1[(i+1)%n].x,v1[(i+1)%n].y,v1[(i+1)%n].z);
      endShape(CLOSE);
    }
    
   //endShape(CLOSE);
  }
}
