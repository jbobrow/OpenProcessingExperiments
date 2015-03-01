
int _rainNum = 10;
int _rainNumCount = 0;
rain[] _rainArr = {}; 


void setup(){
 size(500,500);
 smooth(); 
 rectMode(CENTER);
 colorMode(HSB);
 //getRain();
 frameRate(30);
 noStroke();
}

void draw(){
  background(0,255,0);

  for(int i = 0; i < _rainNumCount; i++){
    _rainArr[i].drawMe();
  }

}
  void mousePressed(){
  getRain();
  }

void getRain(){
  for(int i = 0; i < _rainNum; i++){
    rain thisRain = new rain();
    _rainArr = (rain[])append(_rainArr,thisRain);
  }
  _rainNumCount += _rainNum;
}



class rain{
  float X,Y,afterX,afterY,rainSize,theta,Xstart,Ystart,Xnoise,Ynoise,alph;
  rain(){
    X=random(0,width);
    Y=random(mouseY,height);
    rainSize=random(2,4);
    afterX=X;
    afterY=height/2;
  }
  
  void drawMe(){
    alph=(height/2+height/2*(rainSize-2)-Y)/2;
    fill(162,15,255,alph);
    pushMatrix();
    translate(X,Y);
    rect(0,0,rainSize/2,rainSize*5);
    rotate(radians(60));
    rect(0,0,rainSize/2,rainSize*5);
    rotate(radians(60));
    rect(0,0,rainSize/2,rainSize*5);
    popMatrix();
    Y += rainSize*2;
    if(Y > height/2+height/2*(rainSize-2)){
     Y = Y % (height/2+height/2*(rainSize-2));
    }
  }
}
