
void setup() {
  size(500, 500);
  colorMode(RGB,255);
  smooth();
  noStroke();
  frameRate(5);
  drawMe();
}

class Block {
  int x,y,w,h;
  int layer;
  float lines;
  Block(int xx, int yy, int ww, int hh, int l) {
    x=xx; y=yy; w=ww; h=hh;
    layer = l;
    lines=random(0.05,0.2);
  }
  
  void draw() {
    for(int curry=y;curry<550;curry++) 
      for(int currx=x;currx<x+w;currx++) {
        float ny = map(curry,0,500,-3,3);
        float r = 0.25 * randomGaussian();
        ny = lines * ( floor(ny/lines)-0.5+r);
        ellipse(currx,map(ny,-3,3,0,500),1,1);
    }
    
  }
}

ArrayList<Block> bl;
int currblock = 0;

void drawMe() {
  currblock = 100;
  bl = new ArrayList<Block>();
  drawPaper();  
  for(int i=0;i<400;i+=100) {
    int currsize = -50;
    while(currsize<500) {
      int off=(int)random(random(0,20),random(50,150));
      int size=(int)random(50+i/10,150+i/5);
      int h=(int)random(5,100);
      bl.add(new Block(currsize+off,i+h,size,500-i-h,i/100));
      currsize += off + size;
    }
  }
  currblock = 0;
}

void draw() {
  if(currblock<bl.size()) {
    Block b = bl.get(currblock);
    fill(20,50+40*b.layer);
    b.draw();
    currblock++;
  }
}

void mouseClicked() {
  drawMe();
}

void drawPaper() {
  background(177,165,135);
  for(int i=0;i<500;i+=(int)random(1,3))
    for(int j=0;j<500; j+=(int)random(1,3)) {
      if(random(0,1)<0.01)
          fill(147+randomGaussian()*7,125+randomGaussian()*5,105+randomGaussian()*5,150);
        else
          if(random(0,1)<0.01)
            fill(200+randomGaussian()*7,180+randomGaussian()*5,160+randomGaussian()*5,150);
          else
            fill(177+randomGaussian()*10,165+randomGaussian()*7,135+randomGaussian()*7,200);  
      ellipse(i,j,3+randomGaussian()*2,3+randomGaussian()*2);
    }
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

