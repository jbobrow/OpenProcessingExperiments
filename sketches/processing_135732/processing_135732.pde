

Histogram h1,h2;
Distribution u;
Distribution n;
ParticleCloud p;
Demo myDemo;
color blue;
color red;
boolean uniform;

void setup() {
  size(800, 600);
  blue = color(0,0,255,100);
  red = color (255,0,0,20);
  h1 = new Histogram(100,600,600,150);
  h1.createBins(-3,3,50);
  h1.setColor(red);
  h2 = new Histogram(100,600,600,150);
  h2.createBins(-3,3,50);
  h2.setColor(blue);
  u = new Uniform(-2,2);
  n = new Normal();
  uniform = true;
  myDemo = new Demo(u,h1,h2,5);
  myDemo.setSampleColor(red);
  myDemo.setMeanColor(blue);
  
  
}

void draw() {
  background(140);
  myDemo.update();
  myDemo.draw();
}

void keyPressed() {
  if(key=='.') {
    myDemo.setSampleSize(myDemo.sampleSize+1);
  }
  if(key==',') {
    myDemo.setSampleSize(myDemo.sampleSize-1);
  }
  if(key == 'k' ) {
    myDemo.setRate(myDemo.rate+10);
  }
  if(key == 'm' ) {
    myDemo.setRate(myDemo.rate-10);
  }
  if(key == ' ' ) {
    if(uniform) {
      uniform = false;
      myDemo.setDist( n );
    }
    else {
      uniform = true;
      myDemo.setDist( u );
    }
  }
}  

class Ball {
  float xPos;
  float yPos;
  float xDest;
  float yDest;
  float xVel;
  float yVel;
  float xAcc;
  float yAcc;
  float size;
  float value;
  color myColor;
  boolean moving;
  
  Ball( float x, float y ,  float d , float v ) {
    xPos = x;
    yPos = y;
    xDest = xPos;
    yDest = d;
    xVel = 0;
    yVel = 0;
    xAcc = 0;
    yAcc = 0.1;
    size = 10;
    value = v;
    myColor = color(150);
    moving = true;
  }
  
  void setColor(color c) {
    myColor = c;
  }
  
  void setSize(float v) {
   size = v;
  } 
  
  float getValue() {
    return value;
  }
  
  void update() {
    if (moving) {
      xPos = xPos + xVel;
      yPos = yPos + yVel;
      xVel = xVel + xAcc;
      yVel = yVel + yAcc;
      if(yPos>=yDest-size) {
        yPos = yDest;
        moving = false;
      }
    }
  }
  
  boolean isDone() {
    if(moving) {
      return false;
    }
    else {
      return true;
    }
  }
    
  
  void draw() {
    fill(myColor);
    ellipse(xPos,yPos,size,size);
  }
}
class Bin {
  float binLeft;
  float binRight;
  int binCnt;
  boolean strictLeft;
  boolean strictRight;
  float xPos;
  float yPos;
  float binWidth;
  float binHeight;
  float binScale;
  color myColor;
  
  Bin( float x , float y , float w , float h , float l , float r ) {
    xPos = x;
    yPos = y;
    binWidth = w;
    binHeight = h;
    binLeft = l;
    binRight = r;
    binCnt = 0;
    binScale = 1;
    strictLeft = true;
    myColor = color(150);
    strictRight = false;
  }
  
  void setStrictLeft() {
    strictLeft = true;
  }
  
  void setStrictRight() {
    strictRight = true;
  }
  
  void setScale( float s ) {
    binScale = s;
  }
  
  void reZero() {
    binCnt = 0;
  }
  
  float midX() {
    return xPos+binWidth/2;
  }
  
  boolean contains( float v ) {
    boolean isIn = false;
    
    if( (v>binLeft) && (v<binRight) ) {
      isIn = true;
    }
  
    if( strictLeft && (v==binLeft) ) {
     isIn = true;
    }
   
    if( strictRight && (v==binRight) ) {
     isIn = true;
    }
   
    return isIn;
    
  }
  
  void increment() {
    binCnt++;
  }
  
  float get() {
    return binCnt/(binRight-binLeft);
  }
  
  void setColor(color c) {
    myColor = c;
  }
  
  void draw() {
    fill(myColor);
    rect(xPos,yPos,binWidth,-binCnt*binScale/(binRight-binLeft));
  }
}

class Demo {
  ParticleCloud p1;
  ParticleCloud p2;
  Histogram sampleHist;
  Histogram sampleMeanHist;
  Distribution dist;
  int sampleSize;
  int rate;
  int ctr;
  boolean moving;
  color sampleColor;
  color meanColor;
  
  Demo( Distribution d, Histogram h1 , Histogram h2 , int n ) {
    dist = d;
    sampleHist = h1;
    sampleMeanHist = h2;
    sampleSize = n;
    moving = false;
    rate = 20;
    ctr = 0;
    sampleColor = color(150);
    meanColor = color(150);
    p1 = new ParticleCloud(sampleHist);
    p2 = new ParticleCloud(sampleMeanHist);
    p2.setSize(20);
  }
  
  void setSampleColor(color c) {
    sampleColor = c;
    p1.setColor(c);
  }
  
  void setMeanColor(color c) {
     meanColor = c;
     p2.setColor(c);
  }
  
  void setSampleSize(int n) {
    if(n>0) {
      sampleSize = n;
      p1.clear();
      p2.clear();
      sampleHist.reZero();
      sampleMeanHist.reZero();
    }
  }
  
  void setDist(Distribution d) {
      dist = d;
      p1.clear();
      p2.clear();
      sampleHist.reZero();
      sampleMeanHist.reZero();
  }
  
  void setRate(int n) {
    if(n>0) {
      rate = n;
    }
  }
  void update() {
    if(moving) {
      p1.update();
      p2.update();
      if((p1.isDone())&&(p2.isDone())) {
        moving = false;
      }
    }
    
    if(ctr==0) {
      float sum = 0;
      float v;
      for(int i = 0 ; i<sampleSize ; i++) {
        v = dist.get();
        p1.add(v);
        sum = sum + v;
      }
      p2.add(sum/sampleSize);
      moving = true;

    }
    ctr++;
    if(ctr>rate) {
      ctr = 0;
    }
  }
  
  void draw() {
    p1.draw();
    p2.draw();
  }
}

  
  
    
class Distribution {
  Distribution() {
  }
  
  float get() {
    return 0;
  }
}

class Histogram {
  float xPos;
  float yPos;
  float histWidth;
  float histHeight;
  float histMin;
  float histMax;
  ArrayList<Bin> bins;
  color myColor;
  
  Histogram( float x , float y , float w , float h ) {
    xPos = x;
    yPos = y;
    histWidth = w;
    histHeight = h;
    bins = new ArrayList<Bin>();
    myColor = color(150);
  }
  
  void setColor(color c) {
    myColor = c;
    for(Bin b: bins) {
      b.setColor(c);
    }
  }
  
  void createBins( float l , float r , int n ) {
    histMin = l;
    histMax = r;
    Bin b;
    float binWidth = (r - l) / n;
    float rectWidth = histWidth / n;
    for( int i = 0 ; i<n ; i++) {
      b =new Bin( xPos + i * rectWidth , yPos , rectWidth , histHeight , l + i*binWidth , l+(i+1) * binWidth );
      b.setColor(myColor);
      bins.add(b);
    }
    bins.get(n-1).setStrictRight();
    
  }
  
  void reZero() {
    for(Bin b: bins) {
      b.reZero();
    }
  }
  
  
  float min() {
    return histMin;
  }
  
  float max() {
    return histMax;
  }
  
  
  void findScale() {
    float m = 1;
    float n;
    for(Bin b: bins) {
      n = b.get();
      if(n>m) {
        m = n;
      }
    }
    float s = histHeight / m;
    for(Bin b: bins) {
      b.setScale(s);
    }
    
    
    }

  float getX(float v) {
    return xPos + histWidth * ( v - histMin ) / ( histMax - histMin );
  }
  
    
  void draw() {
    findScale();
    fill(myColor);
    for(Bin b: bins) {
      b.draw();
    }
  }
  
  void add( float v ) {
    for(Bin b: bins) {
      if(b.contains(v)) {
        b.increment();
      }
    }
  }
}
class Normal extends Distribution {
  float mu;
  float sigma;
  
  Normal( float m , float s ) {
    mu = m;
    sigma = s;
  }
  
  Normal() {
    this(0,1);
  }
  
  float get() {
    return randomGaussian()*sigma+mu;
  }
}

class ParticleCloud {
  ArrayList<Ball> balls;
  float startHeight;
  Histogram destHist;
  boolean moving;
  float ballSize;
  color myColor;
  
  ParticleCloud(Histogram h) {
    startHeight = 0;
    destHist = h;
    balls = new ArrayList<Ball>();
    ballSize = 10;
    moving = false;
    myColor = color(150);
  }
  
  void setSize(float v) {
    ballSize = v;
    for(Ball b : balls) {
      b.setSize(v);
    }
  }
    
  void setColor(color c) {
    myColor = c;
    for(Ball b : balls) {
      b.setColor(c);
    }
  }
  
  void update() {
    boolean m = false;
    Ball b;
    for(int j = balls.size() -1; j>=0 ; j--) {
      b = balls.get(j);
      b.update();
      if(b.isDone()) {
        destHist.add(b.getValue());
        balls.remove(j);
      }
      else {
        m = true;
      }
      
      
    }
    moving = m;
    
  }
  
  boolean isDone() {
    if(moving) {
      return false;
    }
    else {
      return true;
    }
  }
  
  void draw() {
    destHist.draw();
    for(Ball b: balls) {
      b.draw();
    }
    
  }
  
  void clear() {
    moving = false;
    balls = new ArrayList<Ball>();
  }
  
  void add(float v) {
    if ( (v>destHist.min()) && (v<destHist.max())) {
    Ball b = new Ball(destHist.getX(v),startHeight,destHist.yPos,v);
    b.setSize(ballSize);
    b.setColor(myColor);
    balls.add(b);
    moving = true;
    }
  }
  
}

class Uniform extends Distribution {
  float uniLeft;
  float uniRight;
  
  Uniform( float l , float r ) {
    uniLeft = l;
    uniRight = r;
  }
  
  Uniform() {
    this(0,1);
  }
  
  float get() {
    return random(uniLeft,uniRight);
  }
}


