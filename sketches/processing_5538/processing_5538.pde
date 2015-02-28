
class stella{

  float ax,ay;
  float kx,ky;
  float px,py;
  float dX,dY;
  float oldX,oldY;
  float posX,posY;
  float ak,valAk;
  float kk;
  float kDentro,kFuori;
  float oldax, olday;
  float oldkx, oldky;
  float a;
  float k;
  float count;
  float multB;
  float multA;
  float col;
  float kMultA;
  float kMultB;
  float A;
  float B;
  float stacco;
  float aDentro;
  float kOscFuori;
  float oscFuori;

  void init(){

    //center small circle
    posX = random (0,width);
    posY = random (0,height);
    ax=posX;
    ay=posY;
    oldax=ax;
    olday=ay;
    //center Bigger circle
    kx=posX;
    ky=posY;
    oldkx=kx;
    oldky=ky; 
    px=kx;
    py=ky;
    multB = 0;
    multA= 0;

  }
  void update(){

    if ( kMultA<0){
      multA= random (10,20);
    }
    if(kOscFuori<0){
      oscFuori= random(-4,4); 
    }
    if (count % stacco == 0){
      px=ax;
      py=ay;
      if ( kMultB<0){
        multB= random (0,20);

      }

    }
    kDentro=A + multA;
    kFuori =B + multB + oscFuori;
    count=frameCount;
    //dentro
    if (aDentro<0){
      a-= ak;

    }
    else{
      a+=ak; 

    }

    ax= (cos(a))*kDentro+posX;
    ay= (sin(a))*kDentro+posY;
    oldax=ax;
    olday=ay;
    //fuori
    k+= ak*kk;
    kx= (cos(k))*kFuori+posX;
    ky= (sin(k))*kFuori+posY;
    oldkx=kx;
    oldky=ky;  
    dX=((px-kx)/2)+kx;
    dY=((py-ky)/2)+ky;
    oldX=dX;
    oldY=dY;
  }

  void render(){

    strokeWeight(1);
    line(dX,dY,oldX,oldY);
    line (oldkx, oldky, kx, ky);
    stroke (0,40);
    smooth();
    strokeWeight(0.2);
    line (kx,ky,px,py);

  }
}

int nStella=20;

void keyPressed() {
  if (key==BACKSPACE){
    for (int i=0; i<nStella;i++){
      s[i].init();
      s[i] = new stella();
    }

    for (int i=0; i<nStella;i++){
      s[i].init();

      valori();
      background(230);

    }
  }
}

stella[]s = new stella[nStella];

void valori (){
  for (int i=0; i<nStella;i++){
    s[i] = new stella();
  }

  for (int i=0; i<nStella;i++){
    s[i].init();

    s[i].kMultA= random(-1,1);

    s[i].kMultB= random(-1,1);

    s[i].A = random(height/400,height/150);
    s[i].B = random(height/200,height/4);

    s[i]. stacco = round (random (2,100));
    s[i].aDentro = random (-1,1);
    s[i].kOscFuori= random (-1,1);
    s[i].valAk= random (-1,1);
    s[i].ak=random(0.001,0.1);

    if(s[i].valAk>0){
      s[i].kk=random(0,1); 
    }

    else{
      s[i].kk=1;
    }
  }
}

void setup(){
  size (900,800);
  background (230);
  valori();
}

void draw(){
  for (int i=0; i<nStella;i++){
    s[i].update();
    s[i].render();
  }
}






