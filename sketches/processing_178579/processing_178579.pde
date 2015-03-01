
float delta = 5;

float X1, Y1=10;
int MAX = 648; 


float deltaT = 0.2;
float gravity = 1.5;
float damping = 0.7;
float yff=-900;
float vyf;

float Rr=200;
float force;
float Rrr;
  



leg rleg; 
leg lleg; 
arm rarm;
arm larm;
head Head;
eye reye;
eye leye;
mouth m;

boolean kp=false;


void setup() {

  size(1000, 1200, P3D);
  frameRate(60);
  rleg = new leg (120, 100, 0, 120, 11, 1.5, 20);
  lleg = new leg (-120, 100, 0, 120, 11, 1.5, -20);
  rarm = new arm ( 170, -90, 0, 120, 11, 2.5);
  larm = new arm ( -170, -90, 0, 120, 11, 2.5);
  Head = new head();
  reye = new eye(-40);
  leye = new eye(40);
  m = new mouth();
  noCursor();
}


void draw() {

  float force=0;
  smooth();
  background(255);
  noStroke();
  lights();
  translate(width/2, height-300, -200);
  rotateY(radians(mouseX));

  pushMatrix();
  popMatrix();
  Head.render();
  rleg.render();
  lleg.render();
  rarm.render(1);
  larm.render(-1);
  reye.render();
  leye.render();
  m.render();


  if (mousePressed) {

    rleg.move(true);
    lleg.move(false);
    rarm.move(true);
    larm.move(true);
    m.move(true);
    reye.move(true);
    leye.move(true);
  }



  if (keyPressed) {
    switch(keyCode)
    {
    case DOWN:
      Head.eMove(true);
      rarm.eMove(true);
      larm.eMove(true);
      m.eMove(true);
      reye.eMove(true);
      leye.eMove(true);
      break;
    case UP:
      force=-4;               
    }   
  }
 
  Head.fly(force);
  reye.fly(force);
  leye.fly(force);
  m.fly(force);
  rleg.fly(force);
  lleg.fly(force);
  rarm.fly(force);
  larm.fly(force);
}

class head
{
  float degY = 0;
  float t=1;
  float pr=0;
  
  head()
  {
  }

  void render()
  {
    pushMatrix();
    rotateY(degY);

    noStroke();
    fill(#FF9BBF);
    beginShape(TRIANGLE_STRIP);
    for (float deg2 =0; deg2 < 180; deg2 += delta) {
      float phi = radians(deg2);
      for (float deg = 0; deg <= 360; deg +=delta) {


        float theta = radians(deg);
        float x = Rr * sin(phi)*cos(theta);
        float z = Rr * sin(phi)*sin(theta);
        float y = Rr * cos(phi);
        vertex(x, y+yff, z+pr);                               

        float phi2 = radians(deg2+delta);
        x = Rr * sin(phi2)*cos(theta);
        z = Rr * sin(phi2)*sin(theta);
        y = Rr * cos(phi2);
        vertex(x, y+yff, z+pr);
      }
    }
    endShape(CLOSE);

    popMatrix();

    cheek(22);
    cheek(-22);
  }

  void fly(float force)
  { 
    if(vyf>0) Rr=200;
    else Rr++;
   
    vyf += deltaT * (1 +force/3);
    yff += deltaT * vyf;

    if (yff> 0) {
     yff = 0;
    vyf = -damping*vyf;
    }
  }




  void cheek(float cr)
  {

    pushMatrix();
    translate(0, yff, 0);
    rotateX(radians(20));
    rotateY(radians(cr+degY/10));
    translate(0, 0, Rr);
    scale(5, 2, 0.5);
    fill(#FF03B4);
    sphere(5);
    popMatrix();
  }

  void move()
  { 
    degY=0;
  }

  void eMove(boolean goUp)
  { 
    if (goUp) {
      if ( degY==30 || degY==-30) {
        t*=-1;
      } 
      degY+=2.5*t;
    }
  }
}


class eye
{
  float x, y, z;
  float degz=0;
  float t = -1;
  

  eye(float xp)
  {
    x=xp;
  }

  void render()
  {
    pushMatrix();
    fill(33, 25, 116);
    translate(0, yff, 0);
    rotateX( radians(30) );
    rotateZ(radians(degz));
    translate(x, 0, Rr-5); 
    scale(0.7, 2.2, 0.5);
    sphere(20);
    fill(255);
    translate(0, -7, 14);
    scale(2.5, 1.5, 2.5);
    sphere(5);
    popMatrix();
  }

  void fly(float force)
  { 
    if(vyf>0) Rr=200;
    else Rr++;

    vyf += deltaT * (1 +force/3);
    yff += deltaT * vyf;

    if (yff> 0) {
      yff = 0;
      vyf = -damping*vyf;
    }
  }

  void move(boolean goUp)
  {
    degz=0;
  }


  void eMove(boolean goUp)
  {

    if (goUp) {
      t*=1;
      if ( degz>5 || degz<-5) {
        t*=-1;
      } 
      degz+=2.5/3*t;
    }
  }
}


class mouth
{
  float x, y, z;
  float t=-1;
  float ms=1.2;
  float degy=0;
  float degx=0;
  float mx=0.5;
  

  mouth()
  {
  }

  void render()
  {
    pushMatrix();
    fill(#FF6531);
    noLights();
    translate(0, yff, 0);
    rotateX( radians(15+degx) );
    translate(0, 0, Rr-5);
    rotateY( radians( degy));
    scale(1.2*ms, 1*ms, mx*ms);
    sphere(15);

    popMatrix();
  }

  void fly(float force)
  { 
    if(vyf>0) Rr=200;
    else Rr++;
    
    vyf += deltaT * (1 +force/3);
    yff += deltaT * vyf;

    if (yff> 0) {
      yff = 0;
      vyf = -damping*vyf;
    }
  }

  void move(boolean goUp)
  {
    degy=0;
    ms=1.2;
    mx=0.5;
    degx=0;
  }

  void eMove(boolean goUp)
  {
    degx=-15;
    ms=4;
    mx=0.1;
    if (goUp) {
      t*=1;
      if ( degy>2 || degy<-2) {
        t*=-1;
      } 
      degy+=0.5*t;
    }
  }
}

class leg
{
  float x, y, z;
  float xf, yf, zf;
  float r, rz;
  float hmd;
  float sl;
  int i;
  float lay;
  float degX=0;
  float degy;
  float t1=1;
  float t2=-1;


  leg(float xp, float yp, float zp, float zSize, float layer, float sSize, float degY)
  {
    xf=xp;
    yf=yp;
    zf=zp;
    lay=layer;
    rz=zSize;    
    hmd=rz/lay;
    degy=degY;

    sl=sSize;
  }

  void render()
  {
    noStroke();
    fill(173, 5, 5);
    pushMatrix();
    translate(0,yff,0);
    rotateX(radians(degX));
    rotateY(radians(degy));
    for (i=0; i< lay; i++) {
      beginShape(TRIANGLE_STRIP);
      for (float deg = 0; deg <= 360; deg +=30) {
        float theta = radians(deg);
        r= (-(i-lay+3)*(i-lay+3)+64)*sl;
        x = xf+ r *cos(theta);
        z = zf+r*1.5*sin(theta);  
        y = yf+hmd*i;   
        vertex(x, y+Rrr, z);

        r= (-(i-lay+4)*(i-lay+4)+64)*sl;
        x = xf+r *cos(theta);
        z = zf+r*1.5*sin(theta);
        y = yf+hmd*(i+1); 
        if (i<lay-1)
        { 
          vertex(x, y+Rrr, z);
        } else vertex(xf, y+Rrr, zf) ;
      }   
      endShape();
    }

    popMatrix();
  }

  
  void move(boolean goUp)
  {  
       
    if (goUp) {      
      if ( degX==50 || degX==-40) {
        t1*=-1;
      } 
      degX+=10*t1;
    } else {
      if ( degX==50 || degX==-40) {
        t1*=-1;
      } 
      degX+=10*t1;
    
  }
  }
  void fly(float force)
  { 
    if(vyf>1){ 
      degX=30;  
      Rrr=0;
    } else if(vyf<-1){
      degX=-30; 
      Rrr++;
    }
 
    
    
    vyf += deltaT * (1 +force/3);
    yff += deltaT * vyf;
    if (yff> 0) {
      yff = 0;
      vyf = -damping*vyf;
    }
    
  }

}




class arm
{
  float x, y, z;
  float xf, yf, zf;
  float r, rz;
  float hmd;
  float sl;
  int i;
 
  int lay;
  float degY=0;
  float degYs=0;
  float t=-1;


  arm(float xp, float yp, float zp, float zSize, int layer, float sSize)
  {
    xf=xp;
    yf=yp;
    zf=zp;
    lay=layer;
    rz=zSize;    
    hmd=rz/lay;

    sl=sSize;
  }

  void render(float go)
  {

    noStroke();
    fill(#FF9BBF);

    pushMatrix();
    rotateY(radians(degY));
    rotateY(radians(degYs));

    for (i=0; i< lay; i++) {
      beginShape(TRIANGLE_STRIP);
      for (float deg = 0; deg <= 360; deg +=30) {
        float theta = radians(deg);
        r= (-((i-5)*(i-5))+25)*sl;
        x = xf+ r*1.5 *cos(theta);
        z = zf+r*sin(theta);  
        y = yf+hmd*i*1.5;   
        vertex(x+Rrr*go, y+yff, z);

        r= (-((i-4)*(i-4))+25)*sl;
        x = xf+r*1.5*cos(theta);
        z = zf+r*sin(theta);
        y = yf+hmd*(i+1)*1.5; 
        if (i<lay-1)
        {
          vertex(x+Rrr*go, y+yff, z);
        } else vertex(xf+Rrr*go, y+yff, zf) ;
      }   
      endShape();
    }
    popMatrix();
  }

  

  void move(boolean goUp)
  {
    //degYs=0;

    if (goUp) {
      if ( degY>15 || degY<-15) {
        t*=-1;
      } 
      degY+=2.5*t;
    }
  }


  void eMove(boolean goUp)
  { 
    degY=0;

    if (goUp) {
      if (degYs>15|| degYs<-15) {
        t*=-1;
      } 
      degYs+=3*t;
    }
  }
  void fly(float force)
  { 
     if(vyf>1){ 
      Rrr=0;
     
    } else if(vyf<-1){
      Rrr++;
      move(true);
      
    }
    
    vyf += deltaT * (1 +force/3);
    yff += deltaT * vyf;
    if (yf> 0) {
      yff = 0;
      vyf = -damping*vyf;
    }
    
  }
}



 
  


