
// Complex Flower Outline by Algirdas Rascius (http://mydigiverse.com).  
// Super Fast Blur v1.1 by Mario Klingemann <http://incubator.quasimondo.com>

ArrayList flowers; 
PImage b;

void setup() {
  size(500, 500, P2D);
  noFill();
  colorMode(HSB, TWO_PI, 1, 1, 1);
  initFlowers();
  background(0);
  b=new PImage(width, height);
}

void draw() {
  loadPixels();
  arraycopy(pixels,0,b.pixels,0,pixels.length);
  fastblur(b,1);
  b.updatePixels();
  image(b, 0, 0);
  for(Iterator i=flowers.iterator(); i.hasNext();) {
    Flower flower = (Flower)i.next();
    flower.drawFlower();
  }
}

void mousePressed() {
  initFlowers();
}

void keyPressed() {
  initFlowers();
}

void initFlowers() {
  flowers = new ArrayList();
  addConcentricFlowers(width/2, height/2, width/2, random(TWO_PI));
}

void addConcentricFlowers(float x, float y, float maxRadius, float colorHue) {
  int petalCount = (int)random(1, 8);
  int pointsPerPetal = (int)random(20, 200) / petalCount;
  for (int i=1; i<6; i++) {
    flowers.add(new Flower(x, y, maxRadius/8*(6-i), petalCount, pointsPerPetal, color(colorHue, 1, ((float)i)/5)));
  }
}

class RandomOscillator {
  float mean;
  float amplitude;
  float value;
  float angle;
  float multiplier;
  
  RandomOscillator(float mean, float amplitude, float startValue) {
    this.mean = mean;
    this.amplitude = amplitude; 
    this.angle = random(TWO_PI);
    this.multiplier = mean !=0 ? startValue / mean : 1;
    next();
  }
  
  float getValue() {
    return value;
  }
  
  void next(){
    angle = (angle+random(PI/50)) % TWO_PI;
    value = multiplier*(mean + amplitude*sin(angle));
    multiplier += (1-multiplier) * 0.03;
   }
}

class Flower {
  float x;
  float y;
  int petalCount;
  int pointsPerPetal;
  color clr;
  RandomOscillator radiusOscillators[];
  RandomOscillator angleOscillators[];
  
  Flower(float x, float y, float meanRadius, int petalCount, int pointsPerPetal, color clr) {
    this.x = x;
    this.y = y;
    this.petalCount = petalCount;  
    this.pointsPerPetal = pointsPerPetal;
    this.clr = clr;
    this.radiusOscillators =  new RandomOscillator[pointsPerPetal];
    this.angleOscillators = new RandomOscillator[pointsPerPetal];
    for (int i=0; i<pointsPerPetal; i++) {
      this.radiusOscillators[i] = new RandomOscillator(meanRadius, meanRadius*0.3, 0);
      this.angleOscillators[i] = new RandomOscillator(0, TWO_PI/petalCount/pointsPerPetal*3, 0);      
    }
  }
  
  void drawFlower() {
    stroke(clr);
    beginShape();
    float angle = TWO_PI / petalCount / pointsPerPetal;
    for (int i=0; i<petalCount*pointsPerPetal+3; i++) {
      float alfa = angle*i + angleOscillators[i%pointsPerPetal].getValue();
      float radius = radiusOscillators[i%pointsPerPetal].getValue();
      curveVertex(radius*sin(alfa)+x, radius*cos(alfa)+y); 
    }
    endShape();
    for(int i=0; i<pointsPerPetal; i++) {
      radiusOscillators[i].next();
      angleOscillators[i].next();
    }  
  }
  
}

void fastblur(PImage img,int radius){

  if (radius<1){
    return;
  }
  int w=img.width;
  int h=img.height;
  int wm=w-1;
  int hm=h-1;
  int wh=w*h;
  int div=radius+radius+1;
  int r[]=new int[wh];
  int g[]=new int[wh];
  int b[]=new int[wh];
  int rsum,gsum,bsum,x,y,i,p,p1,p2,yp,yi,yw;
  int vmin[] = new int[max(w,h)];
  int vmax[] = new int[max(w,h)];
  int[] pix=img.pixels;
  int dv[]=new int[256*div];
  for (i=0;i<256*div;i++){
     dv[i]=(i/div); 
  }
  
  yw=yi=0;
 
  for (y=0;y<h;y++){
    rsum=gsum=bsum=0;
    for(i=-radius;i<=radius;i++){
      p=pix[yi+min(wm,max(i,0))];
      rsum+=(p & 0xff0000)>>16;
      gsum+=(p & 0x00ff00)>>8;
      bsum+= p & 0x0000ff;
   }
    for (x=0;x<w;x++){
    
      r[yi]=dv[rsum];
      g[yi]=dv[gsum];
      b[yi]=dv[bsum];

      if(y==0){
        vmin[x]=min(x+radius+1,wm);
        vmax[x]=max(x-radius,0);
       } 
       p1=pix[yw+vmin[x]];
       p2=pix[yw+vmax[x]];

      rsum+=((p1 & 0xff0000)-(p2 & 0xff0000))>>16;
      gsum+=((p1 & 0x00ff00)-(p2 & 0x00ff00))>>8;
      bsum+= (p1 & 0x0000ff)-(p2 & 0x0000ff);
      yi++;
    }
    yw+=w;
  }
  
  for (x=0;x<w;x++){
    rsum=gsum=bsum=0;
    yp=-radius*w;
    for(i=-radius;i<=radius;i++){
      yi=max(0,yp)+x;
      rsum+=r[yi];
      gsum+=g[yi];
      bsum+=b[yi];
      yp+=w;
    }
    yi=x;
    for (y=0;y<h;y++){
      pix[yi]=0xff000000 | (dv[rsum]<<16) | (dv[gsum]<<8) | dv[bsum];
      if(x==0){
        vmin[y]=min(y+radius+1,hm)*w;
        vmax[y]=max(y-radius,0)*w;
      } 
      p1=x+vmin[y];
      p2=x+vmax[y];

      rsum+=r[p1]-r[p2];
      gsum+=g[p1]-g[p2];
      bsum+=b[p1]-b[p2];

      yi+=w;
    }
  }

}

