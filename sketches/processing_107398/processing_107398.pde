
//image is free.

float x, y;
float vx, vy;
PImage img;
int numSpots = 400;
 
Spot[] spots = new Spot[numSpots];

int MAX_ACT = 100;
Act[] act = new Act[MAX_ACT];
 

void setup() {
  size(400, 400);
  x = 200;
  y = 200;
  vx = 3;
  vy = 0;
  img = loadImage("4.jpg");
  size(400, 400);
   noStroke();
  smooth();
  frameRate(60);
  for (int i = 0; i < spots.length; i++) {
    spots[i] = new Spot(random(0,width), height/2, random(5,40), random(-4,4));
  }
  background(0);
  
 ellipseMode(CENTER);

  for ( int i=0; i<MAX_ACT; i++ ) {
    act[i] = new Act(i);
  }  
}

void draw(){
  background(200);
  image(img,0,0,400,400);
  
  fill(0,0,0,10);
  rect(0, 0, width, height);
  fill(255);
  for (int i = 0; i < spots.length; i++) {
    spots[i].move();
    spots[i].display();
  }
  
  for ( int i=0; i<MAX_ACT; i++ ) {
    act[i].Action();
  }
  
  for ( int i=0; i<MAX_ACT; i++ ) {
    act[i].Draw();
  }
 
  
 chara(int(x)-50,int(y)-50);


  x = x + vx ;
  y = y + vy ;
  
  vy = vy + 0.1 ;
  
  
  if(x > width - 25) vx = -vx ;
  if(x < 25) vx = -vx ;
  if(y > height - 30) vy = -vy*1.0 ;
  if(y < 25) vy = -vy*1.0 ;
  
  if(mousePressed){
    if((mouseX>x-25) && (mouseX<x+25) && (mouseY>y-25) && (mouseY<y+25)){
      x = mouseX ;
      y = mouseY ;
      vx = mouseX - pmouseX ;
      vy = mouseY - pmouseY ;
    }
  }
}

class Spot {
  float x, y; 
  float diameter;
  float speed;
 
  //コンストラクター
  Spot(float _x, float _y, float _diameter, float _speed) {
    x = _x;
    y = _y;
    diameter = _diameter;
    speed = _speed;
  }
 
  void move() {
    y += speed;
    if ((y > (height - diameter / 2)) || (y < diameter / 2)) {
      speed *= -1;
    }
  }
 
  void display() {
    fill(255,255,255,63);
    ellipse(x, y, diameter, diameter);
  }
}

//hueteku awa

void mousePressed() {
  int iAct;
  
  iAct =  SearchHitAct(mouseX,mouseY,0);
  if ( iAct>=0 ) {
    act[iAct].sz_ += 10;
    
  }else{
    iAct = SearchFreeAct();
    if ( iAct>=0 ) {
      act[iAct].Create(mouseX,mouseY);
    }
  }
}

int SearchFreeAct() {
  int iFind = -1;
  for ( int i=0; i<MAX_ACT; i++ ) {
    if ( act[i].exist_ == false ) {
      iFind = i;
      break;
    }
  }
  return iFind;
}


int SearchHitAct(float x , float y , float sz  ) {
  return SearchHitAct(x,y,sz,-1);
}

int SearchHitAct(float x , float y , float sz , int  iMe  ) {
  int iFind = -1;
  for ( int i=0; i<MAX_ACT; i++ ) {
    if ( iMe != i && act[i].exist_ && act[i].IsHit(x,y,sz) ) {
      iFind = i;
      break;
    }
  }
  return iFind;
}


class Act {
  int index_;
  boolean exist_;
  float x_;
  float y_;
  float sz_;
  float xs_;
  float ys_;
  float r_,g_,b_;
  Act(int index) {
    index_ = index;
    exist_ = false;
  }

  void Create(float x ,float y) {
    int index_;
    exist_ = true;
    x_ = x;
    y_ = y;
    xs_ = 0;
    ys_ = 0;
    sz_ = 25;
    r_ = random(255);
    g_ = random(255);
    b_ = random(255);
  }

  void Action() {
    ys_ += 0.02;
 
    x_ += xs_;
    y_ += ys_;
    
    if (y_>height ) { 
      y_ = height;
      ys_ = -ys_;
    }
    if (y_<0  ) { 
      y_ = 0;
      ys_ = 0;
    }
    if (x_>width ) { 
      x_ = width;
      xs_ = -0.1;
    }
    if (x_<0  ) { 
      x_ = 0;
      xs_ = 0.1;
    }
    
    int iAct = SearchHitAct(x_,y_,sz_ ,index_);
    if ( iAct>=0) {
      float dst = act[iAct].CalcDist(x_,y_);
      x_ = act[iAct].x_ + (  x_ - act[iAct].x_) / dst * (sz_ + act[iAct].sz_ );
      y_ = act[iAct].y_ + (  y_ - act[iAct].y_) / dst * (sz_ + act[iAct].sz_ );

      float speed = dist(xs_,ys_ ,0,0)+dist(act[iAct].xs_,act[iAct].ys_ ,0,0)+0.1;
      if ( speed>5 ) speed=5;
      xs_ =  (  x_ - act[iAct].x_) / dst * speed * 0.45;
      ys_ =  (  y_ - act[iAct].y_) / dst * speed * 0.45;
      act[iAct].xs_ = -xs_;
      act[iAct].ys_ = -ys_;
      
    }
    
    if ( sz_>150 ) exist_ = false;
  }

  void Draw() {
    fill(r_,g_,b_, 150-sz_);
    if ( sz_<140 ) {
      noStroke();
    }else{
      stroke(200);
    }
    ellipse(x_, y_, sz_*2,sz_*2);

  }

  float CalcDist(float x,float y) {
    return sqrt( (x_-x)*(x_-x) + (y_-y)*(y_-y));
  }

  boolean IsHit(float x,float y,float sz) {
    return CalcDist(x,y) < sz_ + sz ;
  }

};
  

void chara(int a,int b) {
  pushMatrix();
 translate(a,b);  
   fill(#FF7EFD);
  noStroke( );
  ellipse(50, 50, 70, 70);
  fill(207, 255, 0);
  noStroke( );
  ellipse(70, 50, 5, 5);
  fill(207, 255, 0);
  noStroke( );
  ellipse(50, 60, 5, 5);
  fill(207, 255, 0);
  noStroke( );
  ellipse(65, 70, 10, 10);
  fill(#FF7EFD);
  noStroke( );
  triangle(15, 50, 20, 10, 36, 40);
popMatrix();
}


