
//Nytt i v1.2:
//Separerar beräkningen av radie så att man inte repeterar massa beräkningar

int N = 50;    //Antal bollar i sidled, totalt antal bollar = N^2 
//N = 50, P3D, 80 - 90 fps
float rt = 0;

float g = -10;
float gamma = 0;

float m = 10; //massa
float L = 5;
float k = 500;

Point attachedPoint;
Point[][] points = new Point[N][N];

void setup() {
  frameRate(200);
  size(600,600, P3D);
  //100 fps med N = 40 och P2D
  setupPoints();
    
}

void draw() {
  
  background(127);
  
  calcAccAll(points);
  updateAll(points);

  text(frameRate, 10, 10);
  
  drawPoints(points);
  
}

void keyPressed() {
  
  if(key == 'r') {
    
    int startX = (int)(width-N*L)/2;
    int startY = (int)(height-N*L)/2;
    
    for(int i = 0; i < N; i++) {
      for(int j = 0; j < N; j++) {
        points[i][j].x = i*L + startX;
        points[i][j].y = j*L + startY;
        
        points[i][j].vx = 0.0f;
        points[i][j].vy = 0.0f;
              
      }
    }
    
  }
  else if(key == 'e') {
    
    println(points[N-1][N-1].vx);
    println(points[N-1][N-1].vy);
     
  }
  
  
  
}


void mousePressed() {
  float r1 = 100000.0f;
  float r2;
  int indX = 0;
  int indY = 0;
  
  for(int i = 0; i < N; i++) {
    for(int j = 0; j < N; j++) {
      r2 = sqrt((mouseY - points[i][j].y)*(mouseY - points[i][j].y) + (mouseX - points[i][j].x)*(mouseX - points[i][j].x));
      if(r2 < r1) {
        indX = i;
        indY = j;
        r1 = r2;
      }
    }
  }

  points[indX][indY].attached = true;
  attachedPoint = points[indX][indY];
  
}

void mouseReleased() {
  
  attachedPoint.attached = false;
  
  
}

float h = 0.1;

void updateAll(Point[][] ps) {
  
  for(int i = 0; i < ps.length; i++) {
    for(int j = 1; j < ps[0].length; j++) {
      
      ps[i][j].update();
      
    }
  }
    
    
}

void calcAccAll(Point[][] ps) {
  
  for(int i = 0; i < N; i++) {
      for(int j = 0; j < N; j++) {
        ps[j][i].calcAcc();
      }
  }
  
  
  
}

final int UP_ = 0;
final int DOWN_ = 1;
final int LEFT_ = 2;
final int RIGHT_ = 3;
final int CENTER_ = 4;
final int TOPLEFT_ = 5;
final int TOPRIGHT_ = 6;
final int BOTTOMLEFT_ = 7;
final int BOTTOMRIGHT_ = 8;

float r1 = 2;

float sinFor(Point p1, Point p2, float r) {
  
  return (p2.y-p1.y)/r;  //sqrt((p2.y - p1.y)*(p2.y - p1.y) + (p2.x - p1.x)*(p2.x - p1.x));
  
}

float cosFor(Point p1, Point p2, float r) {
  
  return (p2.x-p1.x)/r;  //sqrt((p2.y - p1.y)*(p2.y - p1.y) + (p2.x - p1.x)*(p2.x - p1.x));
  
}

float calcRad(Point p1, Point p2) {
  
  return sqrt((p2.y - p1.y)*(p2.y - p1.y) + (p2.x - p1.x)*(p2.x - p1.x));
  
}

float calcForce(float r, float L, float k) {
  
  float x = (r-L);
  if(x > 0.0f)
    return x*k;
  else
    return 0.0f;
  
}

void drawPoints(Point[][] ps) {
    
  stroke(0);
  beginShape(LINES);
  for(int i = 0; i < ps.length-1; i++) {
    for(int j = 0; j < ps[0].length-1; j++) {
      
      vertex(ps[i][j].x, ps[i][j].y);
      vertex(ps[i+1][j].x, ps[i+1][j].y);
      vertex(ps[i][j].x, ps[i][j].y);
      vertex(ps[i][j+1].x, ps[i][j+1].y);
    }
  }
  endShape();
  
  
}
//float vmax = 30.0f;

class Point {
  
  public float x;
  public float y;
  
  public float lx;
  public float ly;
  
  public float ax;
  public float ay;
  
  public float vx;
  public float vy;
  
  public float Fx;
  public float Fy;
    
  public float m;
  
  float invMass;
  
  public color c;
  
  public float k;
  public float L;
  
  public boolean attached = false;
  
  float c_ = 1;
  
  float ru, rd, rl, rr;
  
  public Point upPoint;
  public Point downPoint;
  
  public Point leftPoint;
  public Point rightPoint;
  
  public float cosForLeft;
  public float sinForLeft;
  
  public float cosForRight;
  public float sinForRight;
  
  public float cosForDown;
  public float sinForDown;
  
  public float cosForUp;
  public float sinForUp;
  
  
  Point(float x, float y, color c, float m, float k, float L) {
   
   this.c = c;
   this.x = x;
   this.y = y;
   this.m = m;
   this.L = L;
   this.k = k;
   this.invMass = 1/m;

      
  }
  
  
  void calcAcc() {
    
  }

  void update() {
      
      if(attached) {
        this.vx = 0.0f;
        this.vy = 0.0f;
        
        this.y = mouseY;
        this.x = mouseX;
      }
      else {
        
        this.vx = this.vx + h*this.ax;
        this.vy = this.vy + h*this.ay;
        
        /*if(this.vx > vmax)
          this.vx = vmax;
        else if(this.vx < -vmax)
          this.vx = -vmax;
        if(this.vy > vmax)
          this.vy = vmax;
        else if(this.vy < -vmax)
          this.vy = -vmax;*/
        
        this.y = this.y + h*this.vy;
        this.x = this.x + h*this.vx;
      }
    
  }  
}

//--------------------------------------------------------------------------------------------------



class CenterPoint extends Point {
  
  
  CenterPoint(float x, float y, color c, float m, float k, float L) {
   
    super(x, y, c, m, k, L);
        
  }
  
  
  @Override
  void calcAcc() {
    
    ru = calcRad(this, upPoint);
    rd = this.downPoint.ru;
    
    rl = this.leftPoint.rr; //calcRad(this, leftPoint);
    rr = calcRad(this, rightPoint);
        
    Fx = calcForce(ru, this.L, this.k)*cosFor(this, this.upPoint, ru) + 
         calcForce(rd, this.L, this.k)*cosFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*cosFor(this, this.leftPoint, rl) + 
         calcForce(rr, this.L, this.k)*cosFor(this, this.rightPoint, rr);
         
    Fy = calcForce(ru, this.L, this.k)*sinFor(this, this.upPoint, ru) + 
         calcForce(rd, this.L, this.k)*sinFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*sinFor(this, this.leftPoint, rl) + 
         calcForce(rr, this.L, this.k)*sinFor(this, this.rightPoint, rr);
    
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
    
  }

    
}

//------------------------------------------------------------------------------------

class UpPoint extends Point {
  
  UpPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {
    
    rd = this.downPoint.ru; //calcRad(this, downPoint);
  
    rl = calcRad(this, leftPoint);
    rr = calcRad(this, rightPoint);
    
    Fx = calcForce(rd, this.L, this.k)*cosFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*cosFor(this, this.leftPoint, rl) + 
         calcForce(rr, this.L, this.k)*cosFor(this, this.rightPoint, rr);
     
    Fy = calcForce(rd, this.L, this.k)*sinFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*sinFor(this, this.leftPoint, rl) + 
         calcForce(rr, this.L, this.k)*sinFor(this, this.rightPoint, rr);
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}

//------------------------------------------------------------------------------------

class DownPoint extends Point {
  
  
  
  DownPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {
    
    ru = calcRad(this, upPoint);
            
    rl = leftPoint.rr;
    rr = calcRad(this, rightPoint);
    
    this.cosForLeft = this.leftPoint.sinForRight;
    this.sinForLeft = this.leftPoint.cosForRight;
    
    this.cosForRight = cosFor(this, this.rightPoint, rr);
    this.sinForRight = sinFor(this, this.rightPoint, rr);
    
    this.cosForUp = cosFor(this, this.upPoint, ru);
    this.sinForUp = sinFor(this, this.upPoint, ru);
    
    Fx = calcForce(ru, this.L, this.k)*cosForUp + 
          
         calcForce(rl, this.L, this.k)*this.cosForLeft + 
         calcForce(rr, this.L, this.k)*this.cosForRight;
         
    Fy = calcForce(ru, this.L, this.k)*sinForUp + 
          
         calcForce(rl, this.L, this.k)*this.sinForLeft + 
         calcForce(rr, this.L, this.k)*sinForRight;
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}

//------------------------------------------------------------------------------------

class LeftPoint extends Point {
  
    
  LeftPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {

    ru = calcRad(this, this.upPoint);
    rd = this.downPoint.ru;
    
    rr = calcRad(this, rightPoint);
    
    this.cosForUp = cosFor(this, this.upPoint, ru);
    this.sinForUp = sinFor(this, this.upPoint, ru);
    
    cosForDown = this.downPoint.sinForUp;
    sinForDown = this.downPoint.cosForUp;
        
    Fx = calcForce(ru, this.L, this.k)*cosFor(this, this.upPoint, ru) + 
         calcForce(rd, this.L, this.k)*cosFor(this, this.downPoint, rd) + 
         calcForce(rr, this.L, this.k)*cosFor(this, this.rightPoint, rr);
         
    Fy = calcForce(ru, this.L, this.k)*sinFor(this, this.upPoint, ru) + 
         calcForce(rd, this.L, this.k)*sinFor(this, this.downPoint, rd) + 
         calcForce(rr, this.L, this.k)*sinFor(this, this.rightPoint, rr);
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}

//------------------------------------------------------------------------------------

class RightPoint extends Point {
  
  
  RightPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {
    
    ru = calcRad(this, upPoint);
    rd = this.downPoint.ru; //calcRad(this, downPoint);
    
    rl = this.leftPoint.rr; //calcRad(this, leftPoint);
    
        
    Fx = calcForce(ru, this.L, this.k)*cosFor(this, this.upPoint, ru) + 
         calcForce(rd, this.L, this.k)*cosFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*cosFor(this, this.leftPoint, rl);
         
         
    Fy = calcForce(ru, this.L, this.k)*sinFor(this, this.upPoint, ru) + 
         calcForce(rd, this.L, this.k)*sinFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*sinFor(this, this.leftPoint, rl);
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}

//------------------------------------------------------------------------------------

class TopLeftPoint extends Point {
  
  
  TopLeftPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {
    
    rd = this.downPoint.ru; //calcRad(this, downPoint);
        
    rr = calcRad(this, rightPoint);
        
    Fx = calcForce(rd, this.L, this.k)*cosFor(this, this.downPoint, rd) + 
         calcForce(rr, this.L, this.k)*cosFor(this, this.rightPoint, rr);
         
    Fy = calcForce(rd, this.L, this.k)*sinFor(this, this.downPoint, rd) + 
         calcForce(rr, this.L, this.k)*sinFor(this, this.rightPoint, rr);
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}

//------------------------------------------------------------------------------------

class BottomLeftPoint extends Point {
  
  
  
  BottomLeftPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {
    
    ru = calcRad(this, upPoint);
            
    rr = calcRad(this, rightPoint);
    
    cosForRight = cosFor(this, this.rightPoint, rr);
    sinForRight = sinFor(this, this.rightPoint, rr);
    
    cosForUp = cosFor(this, this.upPoint, ru);
    sinForUp = sinFor(this, this.upPoint, ru);
    
    Fx = calcForce(ru, this.L, this.k)*cosForUp + 
         calcForce(rr, this.L, this.k)*cosForRight;
         
    Fy = calcForce(ru, this.L, this.k)*sinForUp + 
         calcForce(rr, this.L, this.k)*sinForRight;
         
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}

//------------------------------------------------------------------------------------

class TopRightPoint extends Point {
  
  
  TopRightPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {
    
    rd = this.downPoint.ru; //calcRad(this, downPoint);
    
    rl = this.leftPoint.rr; //calcRad(this, leftPoint);
    
        
    Fx = calcForce(rd, this.L, this.k)*cosFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*cosFor(this, this.leftPoint, rl); 
         
         
    Fy = calcForce(rd, this.L, this.k)*sinFor(this, this.downPoint, rd) + 
         calcForce(rl, this.L, this.k)*sinFor(this, this.leftPoint, rl);
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}

//------------------------------------------------------------------------------------

class BottomRightPoint extends Point {
  
  
  BottomRightPoint(float x, float y, color c, float m, float k, float L) {
    super(x, y, c, m, k, L);    
  }
  
  @Override
  void calcAcc() {
    
    ru = calcRad(this, upPoint);
                
    rl = calcRad(this, leftPoint);
                
    Fx = calcForce(ru, this.L, this.k)*cosFor(this, this.upPoint, ru) + 
         calcForce(rl, this.L, this.k)*cosFor(this, this.leftPoint, rl); 
         
         
    Fy = calcForce(ru, this.L, this.k)*sinFor(this, this.upPoint, ru) + 
         calcForce(rl, this.L, this.k)*sinFor(this, this.leftPoint, rl); 
    
    ax = (Fx - c_*this.vx)*this.invMass;
    ay = (Fy - c_*this.vy - g)*this.invMass;
  }
  
}





void setupPoints() {
  int startX = (int)(width-N*L)/2;
  int startY = (int)(height-N*L)/2;
  
  for(int x = 1; x < N-1; x++) {
    for(int y = 1; y < N-1; y++) {
      
      points[x][y] = new CenterPoint(x*L + startX, y*L + startY, 
                                   color(random(0, 255), random(0, 255), random(0, 255)),
                                   m, k, L);
    }
  }
  
  for(int i = 1; i < N-1; i++) {
    points[i][N-1] = new UpPoint(i*L + startX, startY + (N-1)*L, 
                                 color(random(0, 255), random(0, 255), random(0, 255)),
                                 m, k, L);
    
    points[i][0] = new DownPoint(i*L + startX, startY, 
                                 color(random(0, 255), random(0, 255), random(0, 255)),
                                 m, k, L);
    
    points[0][i] = new LeftPoint(startX, i*L + startY, 
                                 color(random(0, 255), random(0, 255), random(0, 255)),
                                 m, k, L);
    
    points[N-1][i] = new RightPoint((N-1)*L + startX, i*L + startY, 
                                 color(random(0, 255), random(0, 255), random(0, 255)),
                                 m, k, L);                             
    
  }
  
  
  points[0][0] = new BottomLeftPoint(startX,
                                     startY, 
                                     color(0),
                                     m, k, L);
                                   
  points[N-1][N-1] = new TopRightPoint((N-1)*L + startX,
                                       (N-1)*L + startY, 
                                       color(0),
                                       m, k, L);
                                   
  points[0][N-1] = new TopLeftPoint(startX,
                                    (N-1)*L + startY, 
                                    color(0),
                                    m, k, L);
                                   
  points[N-1][0] = new BottomRightPoint((N-1)*L + startX,
                                        startY, 
                                        color(0),
                                        m, k, L);
  
  
  for(int x = 1; x < N-1; x++) {
    for(int y = 1; y < N-1; y++) {
      points[x][y].upPoint = points[x][y+1];
      points[x][y].downPoint = points[x][y-1];
      points[x][y].leftPoint = points[x-1][y];
      points[x][y].rightPoint = points[x+1][y];
      
    }
  }
  
  for(int x = 1; x < N-1; x++) {
    
    points[x][0].leftPoint = points[x-1][0];  //NER
    points[x][0].rightPoint = points[x+1][0];
    points[x][0].upPoint = points[x][1];
    
    points[x][N-1].leftPoint = points[x-1][N-1];  //UPP
    points[x][N-1].rightPoint = points[x+1][N-1];
    points[x][N-1].downPoint = points[x][N-2];
    
    //----
    
    points[0][x].upPoint = points[0][x+1];    //VÄNSTER
    points[0][x].downPoint = points[0][x-1];
    points[0][x].rightPoint = points[1][x];
    
    points[N-1][x].upPoint = points[N-1][x+1];  //HÖGER
    points[N-1][x].downPoint = points[N-1][x-1];
    points[N-1][x].leftPoint = points[N-2][x];
    
  }
  
    
  points[0][0].rightPoint = points[1][0];  //BL
  points[0][0].upPoint = points[0][1];
  
  points[0][N-1].rightPoint = points[1][N-1];  //TL
  points[0][N-1].downPoint = points[0][N-2];
  
  points[N-1][0].leftPoint = points[N-2][0];  //BR
  points[N-1][0].upPoint = points[N-1][1];
  
  points[N-1][N-1].leftPoint = points[N-2][N-1];  //TR
  points[N-1][N-1].downPoint = points[N-1][N-2];
  
}


