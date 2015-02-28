
ArrayList objs;
PImage img;
int halfW;
boolean bLight;

//-----------------------------------------------------

void setup() {
  size(900,600);
  smooth();
  textSize(10);
  imageMode(CENTER);
  textAlign(CENTER,CENTER);
  
  halfW = width/2;
  objs = new ArrayList();
  img = loadImage("light.jpg");
  bLight = true;
}

//-----------------------------------------------------

void draw() {
  if (bLight) {
    background(0);
    image(img, mouseX, mouseY); //draw the light image fist
  }
  else {
    background(200);
  }
  for (int i=0; i<objs.size(); i++) {
    obj o = (obj) objs.get(i);
    o.drawShadow(); //draw the shadows second
  }
  for (int i=0; i<objs.size(); i++) {
    obj o = (obj) objs.get(i);
    o.drawShape(); //draw the objects last
  }
  fill(64,64,128);
  text("Left-click to drop a random polygon on the screen", halfW, height-45);
  text("Right-click to remove the prior polygon", halfW, height-30);
  text("Press 'L' key do toggle localized light source", halfW, height-15);
}

//-----------------------------------------------------

void mousePressed() {
  if (mouseButton == LEFT) objs.add(new obj());
  if (mouseButton == RIGHT && objs.size() > 0) objs.remove(objs.size()-1);
}

//-----------------------------------------------------

void keyPressed() {
  if (key == 'l') bLight = !bLight;
}

//-----------------------------------------------------

class obj {
  int vertCnt;
  PVector p[];
  
  obj() {
    vertCnt = int(random(3,7));
    p = new PVector[vertCnt];
    for (int i=0; i< vertCnt; i++)
      p[i] = new PVector(random(-100,100)+mouseX, random(-100,100)+mouseY);
  }
  
  void drawShadow() {
    PVector tmp;
    PVector m = new PVector(mouseX, mouseY); //mouse vector
    
    fill(0);
    stroke(0);
    for (int i=0; i < vertCnt; i++) {
      beginShape();
        
        PVector v1 = p[i]; //current vertex
        PVector v2 = p[i==vertCnt-1?0:i+1]; //"next" vertex
        vertex(v2.x, v2.y);
        vertex(v1.x, v1.y);
        
        //current shadow vertex
        tmp = PVector.sub(v1, m);
        tmp.normalize();
        tmp.mult(5000); //extend well off screen
        tmp.add(v1); //true up position
        vertex(tmp.x, tmp.y);
        
        //"next" shadow vertex
        tmp = PVector.sub(v2, m);
        tmp.normalize();
        tmp.mult(5000); //extend well off screen
        tmp.add(v2); //true up position
        vertex(tmp.x, tmp.y);
        
      endShape(CLOSE);
    }
  }
  
  void drawShape() {
    stroke(64);
    fill(64);
    beginShape();
      for (int i=0; i< vertCnt; i++)
        vertex(p[i].x, p[i].y);
    endShape(CLOSE);
  }
}

