
// http://chris-hernandez.net/artwork/2988920_10.html
// rework of 10 2013 Tissue by Chris Hernandez, The White Album


class Rect {
  int x1,y1,x2,y2;
  int middleX, middleY;
  Rect(int xx1,int yy1, int xx2, int yy2) {
    x1=xx1;y1=yy1;x2=xx2;y2=yy2;
    middleX = x1+(x2-x1)/2;
    middleY = y1+(y2-y1)/2;
  }
  boolean intersect(Rect r) {
    return max(0,min(x2,r.x2)-max(x1,r.x1)) > 0
          && max(0,min(y2,r.y2)-max(y1,r.y1)) > 0;
  }

}

ArrayList<Rect> rects;

void setup() {
  size(450,800);
  noStroke();
  smooth();
  frameRate(5);
  initialize();
}

void initialize() {
  background(234,229,225); 
  resetMatrix(); 
  doPaper();  
  rects = new ArrayList<Rect>();
  rects.add(new Rect(0,0,450,120));
  rects.add(new Rect(0,680,450,800));
  rects.add(new Rect(0,0,30,800));
  rects.add(new Rect(420,0,450,800));
  sizebase = 7;
}

void mouseClicked() {
  initialize();
}

float sizebase;

void draw() {

  int size = (int)(sizebase+randomGaussian()/2);
  boolean intersect = true;
  Rect r = null;
  int iters = 0;
  while(intersect && sizebase > 4) {
    int x = (int)random(30,420);
    int y = (int)random(120,680);
    r = new Rect(x,y,x+size*11,y+size*11);
    boolean n = false;
    for(Rect rr : rects)
      n = n || r.intersect(rr);
    intersect = n;
    iters++;
    if(iters>10000 && intersect) {
      iters = 0;
      sizebase-=0.5;
      size = (int)(sizebase+randomGaussian()/2);
    }  
  }
  
  if(!intersect) {
    rects.add(r);
 
    translate(r.middleX,r.middleY);
    rotate(random(0,TWO_PI));
    doTurtle(random(0,1)<0.25?true:false,size);
  }
}

void doTurtle(boolean light, int size) {
  pushMatrix();
  rotate(PI/8);
  translate(-size/2,-size);
     doQuad(size*2.2+randomGaussian(),light);
   rotate(-PI/8);
   translate(size/2,size);
   pushMatrix();
   translate(0,-size*4.5+randomGaussian()/2);
   rotate(PI/8);
   doQuad(size*1.2+randomGaussian()/1.5,light);
   popMatrix();
   for(int i=0;i<4;i++) {
     rotate(1.25+randomGaussian()/40);
     pushMatrix();
     translate(0,-size*4.5+randomGaussian());
     rotate(PI/8);
     doQuad(size*1.2+randomGaussian()/1.5,light);
     popMatrix();
   }
  popMatrix();
}

void doQuad(float size, boolean light) {
  pushMatrix();
  float ls = random(0.8*size,1.2*size);
   float lm = random(-0.1,0.2);
   float tdx = random(0.9,1.0);
   float tdy = random(0.9,1.0);
   color cl,cr;
   if(light) {
     if(random(0,1)<0.20) {
       cl = color(103,93,96);
       cr = color(155,151,151);
     } else {
       cl = color(153,143,146);
       cr = color(175,171,171);
     }
   } else {
     cl = color(42,42,36);
     cr = color(57,53,50);
   }
   for(int i=0;i<size/1.4;i++) {
     fill(lerpColor(cl,cr,random(0,1)),140+randomGaussian());
     rect(0,-ls/2,3,ls);
     ls+=lm;
     translate(tdx,tdy+randomGaussian()/40);
     rotate(randomGaussian()/50);
   }
   popMatrix();
}

void doPaper() {
  for(int i=0;i<450;i+=2)
    for(int j=0;j<800;j+=2) {
      color l = color(220,220,220);
      color r = color(250,245,240);
      color blend = lerpColor(l,r,noise(i/40.0,j/40.0));
      fill(blend);
      ellipse(i,j,2,2);
      fill(100+randomGaussian()*10,30);
      ellipse(i,j,1,1);
    }
   filter(ERODE);filter(ERODE);filter(ERODE);  
}

float nextGaussian = 0;
boolean haveNextGaussian = false;
 
float randomGaussian() {
  if(haveNextGaussian) {
    haveNextGaussian = false;
    return nextGaussian;
  } else {
    float v1,v2,s;
    do {
      v1 = 2 * random() - 1;
      v2 = 2 * random() - 1;
      s = v1 * v1 + v2 * v2;
    } while (s >=1 || s == 0);
      
    float mult = sqrt(-2 * log(s) / s);
    nextGaussian = v2 * mult;
    haveNextGaussian = true;
    return v1 * mult;
  }
}
