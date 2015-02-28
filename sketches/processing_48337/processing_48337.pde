
Cell[][] cells = new Cell[400][400];

int count;
int beforetime;
int fps;

// Vars for resource
PFont bf;

// thread
CalcThread ct0,ct1,ct2,ct3;


void setup()
{
  size(400,400);
  ellipseMode(CENTER);
  bf = loadFont("Univers45.vlw.gz");
    
  for ( int y=0; y<400; y++ ) {
    for ( int x=0; x<400;x++ ) {
      cells[x][y] = new Cell();
    }
  }

  ct0 = new CalcThread(0,0,200,200);
  ct1 = new CalcThread(200,0,400,200);
  ct2 = new CalcThread(0,200,200,400);
  ct3 = new CalcThread(200,200,400,400);
  
    reset();
}
void reset() {
    background(0);
}


class CalcThread  extends Thread {
  int nActiveCount_;
  int l_,t_,r_,b_;
  CalcThread(int l,int t ,int r, int b ) {
    l_ = l;
    t_ = t;
    r_ = r;
    b_ = b;
  }
  void run() {
    nActiveCount_ = 0;
    for ( int y=t_; y<b_; y++ ) {
      for ( int x=l_; x<r_;x++ ) {
        if ( cells[x][y].IsBeforeActive() ) {
          nActiveCount_ ++ ;
          for ( float r=1.0; r>0.1; r-=.2 ) {
            AddVect( (float)x + cells[x][y].bxv_*r ,
                     (float)y + cells[x][y].byv_*r ,
                     cells[x][y].bxv_ * 0.2 ,
                     cells[x][y].byv_ * 0.2  );
          }
            pixels[y*400+x] = cells[x][y].GetBeforeColor();// 画面描画
        }
      }
    }  
  }
}  

void draw()
{
  count++;

  // Action
  for ( int y=0; y<400; y++ ) {
    for ( int x=0; x<400;x++ ) {
      cells[x][y].CopyBefore();
      cells[x][y].Reset();
    }
  }  
  
//    background(0); // 画面描画
//    loadPixels();// 画面描画


  int nActiveCount = 0;
/*  
  for ( int y=0; y<400; y++ ) {
    for ( int x=0; x<400;x++ ) {
      if ( cells[x][y].IsBeforeActive() ) {
        nActiveCount ++ ;
        for ( float r=1.0; r>0.1; r-=.2 ) {
          AddVect( (float)x + cells[x][y].bxv_*r ,
                   (float)y + cells[x][y].byv_*r ,
                   cells[x][y].bxv_ * 0.2 ,
                   cells[x][y].byv_ * 0.2  );

          //pixels[y*400+x] = cells[x][y].GetBeforeColor();// 画面描画

        }
      }
    }
  }  
*/

    ct0 = new CalcThread(0,0,200,200);
  ct1 = new CalcThread(200,0,400,200);
  ct2 = new CalcThread(0,200,200,400);
  ct3 = new CalcThread(200,200,400,400);
  ct0.start();
  ct1.start();
  ct2.start();
  ct3.start();

  try {
    ct0.join();  
    nActiveCount += ct0.nActiveCount_;
    
    ct1.join();  
    nActiveCount += ct1.nActiveCount_;
    ct2.join();  
    nActiveCount += ct2.nActiveCount_;
    ct3.join();  
    nActiveCount += ct3.nActiveCount_;
  } catch(Exception ex) {
    ex.printStackTrace();
  }

  
//    updatePixels();// 画面描画
  
  
  // 画面描画
  background(0); 
  loadPixels();
  int i = 0;
  for ( int y=0; y<400; y++ ) {
    for ( int x=0; x<400;x++ ) {
      pixels[i] = cells[x][y].GetColor();
      i++;
    }
  }
  updatePixels();
  
  // FPS
  if ( (count % 10) == 0 ) {
    fps = 100000/(millis()-beforetime);
    beforetime = millis();
  }
      
  // ステータス  
  textFont(bf, 16);  
  fill(200);
  textAlign(LEFT);
  text( "ACTIVE CELL:" + nActiveCount ,5,395);
  if ( fps>0 ) text("FPS:" + (float)fps/10  ,330,395);
  
}

void mouseDragged() {
  if ( true  ) {
    int sz = 9;
    for ( int x=-sz; x<=sz; x++ ) {
      for ( int y=-sz; y<=sz; y++ ) {
         AddVect(mouseX+x,mouseY+y,mouseX-pmouseX,mouseY-pmouseY);
      }
    }
  }
}


void AddVect(float x,float y,float vx,float vy) {
    float rR = x - floor(x);
    float rL = 1 - rR;
    float rD = y - floor(y);
    float rU = 1 - rD;
    AddVect( (int)x  ,(int)y   , vx * rL*rU , vy * rL*rU );
    AddVect( (int)x+1,(int)y   , vx * rR*rU , vy * rR*rU );
    AddVect( (int)x  ,(int)y+1 , vx * rL*rD , vy * rL*rD );
    AddVect( (int)x+1,(int)y+1 , vx * rR*rD , vy * rR*rD );
}

void AddVect(int  x,int  y,float vx,float vy) {
  if ( x>=0 && x<400 && y>=0 && y<400 ) {
    cells[x][y].AddVect(vx,vy);
  }
}


class Cell {
  float xv_;
  float yv_;
  float bxv_;
  float byv_;
  
  Cell() {
    Reset();
  }
  void Reset() {
    xv_ = yv_ = 0;
  }  
  void CopyBefore() {
    bxv_ = xv_;
    byv_ = yv_;
  }

  
  void SetVect( float xv,float yv) {
    xv_ = xv;
    yv_ = yv;
  }
  synchronized void AddVect( float xv,float yv) {
    xv_ += xv;
    yv_ += yv;
  }
  
  color GetColor() {
    return color( min( abs(xv_)*15,255) , min( abs(yv_)*15,255) , 0 );
  }
  color GetBeforeColor() {
    return color( min( abs(bxv_)*15,255) , min( abs(byv_)*15,255) , 0 );
  }
 
   boolean IsBeforeActive() {
     return  ( (bxv_*bxv_ + byv_*byv_)>1.0 ) ;
   } 
}
  

