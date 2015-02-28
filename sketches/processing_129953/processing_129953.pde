
int _num = 5000;
rain[] _rainArr = {}; 

void setup(){
 size(300,300);
 smooth(); 
 rectMode(CENTER);
 colorMode(HSB);
 getRain();
 frameRate(30);
 noStroke();
}

void draw(){
  background(0,0,255);
  for(int i = 0; i < _num; i++){
    _rainArr[i].drawMe();
  }
}

void getRain(){
  for(int i = 0; i < _num; i++){
    rain thisRain = new rain();
    _rainArr = (rain[])append(_rainArr,thisRain);
  }
}

class rain{
  float H,X,Y,afterX,afterY,rainSize,theta,Xstart,Ystart,Xnoise,Ynoise;
  rain(){
    H=random(120,160);
    X=random(width);
    Y=random(height);
    rainSize=random(2,5);
    afterX=X;
    afterY=height/2.0f;
  /*  theta=atan(height/(X-width/2));
    println(atan((X-width/2)/height));
    println(sin(theta));
     println(cos(theta));*/
     Xstart=random(10);
     Ystart=random(10);
  }
  
  void drawMe(){
    fill(H,105,255,40);
    rect(X,Y,rainSize/2.0f,rainSize*10);
    Y += rainSize*3;
    if(Y > height/2.0f-20.0){
     Y = Y % (height/2.0f-20.0);
    }
    Xnoise=noise(Xstart)*rainSize*4;
    Ynoise=noise(Ystart)*rainSize*4;
    fill(H,105,255,40*rainSize);
    rect(X+Xnoise,(rainSize-2.0f)*height/4+height/2+Ynoise,rainSize*10,rainSize/2.0f);
    Xstart += 0.1;
    Ystart += 0.05;
    /*pushMatrix();
    translate(afterX,afterY);
    rotate(theta);
    rect(0,0,rainSize/2,rainSize*10);
    popMatrix();
    afterX += rainSize*3*cos(theta);
    afterY += rainSize*3*sin(theta);*/
  }
  
}


