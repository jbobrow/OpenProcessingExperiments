
Flower f;
Flower[][] flowers;
int W = 4;
int H = 4;

int mouseTakenX = -1;
int mouseTakenY = -1;

void setup() {
  size(600, 600);
  frameRate(100);

  f = new Flower(0, 0, 50);
  f.setParams(0, 0, 0, 0, 0, 0);

  flowers = new Flower[W][H];
  for (int j=0; j<flowers.length; j++) {
    for (int i=0; i<flowers[j].length; i++) {
      flowers[i][j] = new Flower(int(i*width/(W+0.5)+width/(W+2)), int(j*height/(H+0.5)+height/(H+2)), 50);
    }
  }
}

void draw() {
  background(0);

  //  f.draw();
  for (int j=0; j<flowers.length; j++) {
    for (int i=0; i<flowers[j].length; i++) {
      flowers[i][j].draw();
      //      flowers[i][j].randomize();
    }
  }

  if (mouseTakenX >= 0 && mouseTakenY >= 0 ) {
    f.draw();
  }

  fill(255);
  text(int(frameRate), 10, 20);
  //  text( f.rWaves+" : "+f.gWaves+" : "+f.bWaves+" : "+f.rFlakes+" : "+f.gFlakes+" : "+f.bFlakes , 30,20);
}

/*
void mouseClicked() {
 for(int j=0; j<flowers.length; j++) {
 for(int i=0; i<flowers[j].length; i++) {
 flowers[i][j].randomize();
 }
 }
 }
 */

void mouseClicked() {

  for (int j=0; j<flowers.length; j++) {
    for (int i=0; i<flowers[j].length; i++) {
      if (dist(mouseX, mouseY, flowers[i][j].x, flowers[i][j].y) < flowers[i][j].s) {
//        flowers[i][j].randomize();
        int rF = flowers[int(random(W))][int(random(H))].rFlakes;
        int gF = flowers[int(random(W))][int(random(H))].gFlakes;
        int bF = flowers[int(random(W))][int(random(H))].bFlakes;
        int rW = flowers[int(random(W))][int(random(H))].rWaves;
        int gW = flowers[int(random(W))][int(random(H))].gWaves;
        int bW = flowers[int(random(W))][int(random(H))].bWaves;
        flowers[i][j].setParams(rF, gF, bF, rW, gW, bW);
      }
    }
  }
}

void mousePressed() {
  /*
  for (int j=0; j<flowers.length; j++) {
   for (int i=0; i<flowers[j].length; i++) {
   if (dist(mouseX, mouseY, flowers[i][j].x, flowers[i][j].y) < flowers[i][j].s) {
   mouseTakenX = i;
   mouseTakenY = j;
   f.duplicateFrom(flowers[i][j]);
   f.x = mouseX;
   f.y = mouseY;
   }
   }
   }
   */
}

void mouseReleased() {

  if (mouseTakenX >= 0 && mouseTakenY >= 0 ) {
    flowers[mouseTakenX][mouseTakenY].x = int(mouseTakenX*width/(W+0.5)+width/(W+2));
    flowers[mouseTakenX][mouseTakenY].y = int(mouseTakenY*width/(W+0.5)+width/(W+2));



    for (int j=0; j<flowers.length; j++) {
      for (int i=0; i<flowers[j].length; i++) {
        if (dist(mouseX, mouseY, flowers[i][j].x, flowers[i][j].y) < f.s) {
          //        mouseTakenX = i;
          //        mouseTakenY = j;
          flowers[i][j].mutateWith(f);
        }
      }
    }
  }

  mouseTakenX = -1;
  mouseTakenY = -1;
}

void mouseDragged() {
  if (mouseTakenX >= 0 && mouseTakenY >= 0 ) {
    //    flowers[mouseTakenX][mouseTakenY].x = mouseX;
    //    flowers[mouseTakenX][mouseTakenY].y = mouseY;
    f.x = mouseX;
    f.y = mouseY;
  } else {
    for (int j=0; j<flowers.length; j++) {
      for (int i=0; i<flowers[j].length; i++) {
        if (dist(mouseX, mouseY, flowers[i][j].x, flowers[i][j].y) < flowers[i][j].s) {
          mouseTakenX = i;
          mouseTakenY = j;
          f.duplicateFrom(flowers[i][j]);
          f.x = mouseX;
          f.y = mouseY;
        }
      }
    }
  }
}

int sign(float n) {
  int ans = 0;
  if (n<0) ans =- 1;
  if (n>0) ans =  1;
  return(ans);
}

class Flower {
  
  int x;
  int y;
  int s;
  
  int rFlakes;
  int gFlakes;
  int bFlakes;
  
  int rWaves;
  int gWaves;
  int bWaves;
  
  PGraphics img;
  
  Flower(int x, int y, int s) {
    this.x = x;
    this.y = y;
    this.s = s;
   
   img = createGraphics(2*s, 2*s);
   
   randomize();
   
  }
  
  void setParams(int rF, int gF, int bF, int rW, int gW, int bW ) {
    this.rFlakes = rF;
    this.gFlakes = gF;
    this.bFlakes = bF;
    this.rWaves  = rW;
    this.gWaves  = gW;
    this.bWaves  = bW;
    updateImg();
  }
  
  void duplicateFrom(Flower f) {
    this.rFlakes = f.rFlakes;
    this.gFlakes = f.gFlakes;
    this.bFlakes = f.bFlakes;
    this.rWaves  = f.rWaves;
    this.gWaves  = f.gWaves;
    this.bWaves  = f.bWaves;
//    this.x       = f.x;
//    this.y       = f.y;
    updateImg();
  }
  
  void mutateWith(Flower f) {
    this.rFlakes = (random(1)<0.5)?  f.rFlakes : this.rFlakes;
    this.gFlakes = (random(1)<0.5)?  f.gFlakes : this.gFlakes;
    this.bFlakes = (random(1)<0.5)?  f.bFlakes : this.bFlakes;
    this.rWaves  = (random(1)<0.5)?  f.rWaves  : this.rWaves;
    this.gWaves  = (random(1)<0.5)?  f.gWaves  : this.gWaves;
    this.bWaves  = (random(1)<0.5)?  f.bWaves  : this.bWaves;
//    this.x       = f.x;
//    this.y       = f.y;
    updateImg();
  }
  
  void updateImg() {
    img.loadPixels();

    for(int i=-s; i<s; i++) {
      int jR = int(sqrt(s*s - i*i));
      for(int j = -jR; j<jR; j++) {
        
        int p = s+i;
        int q = s+j;
        
        
        // 0.001 is added to i to avoid deleting by 0 !
//        float a = atan(1.0*j/(i))*sign(i*j);
        float a = -atan(j/(i+0.001));
        if(i>=0) a+=PI;
        if(i<0 && j<0) a+=TWO_PI;
        
        float r = dist(0,0,i,j);
        
        
        int cR = int( (128+int(127*sin(a*rFlakes))) * sin(100*(r/s)/rWaves) * (0.5*s/r) );
        int cG = int( (128+int(127*sin(a*gFlakes))) * sin(100*(r/s)/gWaves) * (0.5*s/r) );
        int cB = int( (128+int(127*sin(a*bFlakes))) * sin(100*(r/s)/bWaves) * (0.5*s/r) );
        
//        pixels[ p + width*q ] = color(cR, cG, cB) ;
        img.pixels[ p + img.width*q ] = color(cR, cG, cB) ;
      }
    }
    
    img.updatePixels();
  }
  
  void draw() {
    imageMode(CENTER);
    image(img,x,y);
  }
  
  void randomize() {
    rFlakes = (int)random(0,30);
    gFlakes = (int)random(0,30);
    bFlakes = (int)random(0,30);
    
    rWaves = (int)random(0,10);
    gWaves = (int)random(0,10);
    bWaves = (int)random(0,10);
    updateImg();
  }
  
  int sign(float n) {
    int ans = 0;
    if(n<0) ans =- 1;
    if(n>0) ans =  1;
    return(ans);
  }
  
}


