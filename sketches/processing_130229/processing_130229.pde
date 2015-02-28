
int _woodnum = 1;
woodman[] _woodArr = {};
colorSelect[] _colorArr = {};
barSelect[] _barArr = {};
int _dianum = 2;
diaSelect[] _diaArr = {};
boolean _check=false;
float _eggW,_eyeY,_miken,_eyeradius;

void setup() {
  size(850, 700);
  frameRate(10);
  getwood();
  colorMode(HSB);
  frameRate(30);
  translate(width/2, height/2);
  rectMode(CENTER);
  textSize(40);
  textAlign(CENTER);
  strokeWeight(5);
  drawCircle();
  getBar();
  getDia();
}

void draw() {
  background(255);
  noStroke();
    fill(180,50);
  ellipse(width/2,270,540,540);
  fill(255);
  ellipse(width/2,270,250,250);
  triangle(width/2,270,width/2+240,540,width/2-240,540);
      if(_woodnum != 0){
      _woodArr[_woodnum-1].R=_colorArr[0].H;
      _woodArr[_woodnum-1].eyecolorR=_colorArr[1].H;
      _woodArr[_woodnum-1].stR=_colorArr[2].H;
      _woodArr[_woodnum-1].eyeradius=_diaArr[0].diaY/5 +30;
      _woodArr[_woodnum-1].hitomiRadius=_diaArr[1].diaY/2;
      _woodArr[_woodnum-1].miken=_barArr[0].tempBar/4+50;
      _woodArr[_woodnum-1].eyeY=_barArr[1].tempBar/3;
      if(_woodArr[_woodnum-1].hitomiRadius>_woodArr[_woodnum-1].eyeradius){
        _woodArr[_woodnum-1].hitomiRadius=_woodArr[_woodnum-1].eyeradius;
      }
      if(_woodArr[_woodnum-1].check00==1){
        _check=true;
      }
      else{
        _check=false;
      }
      
      _eggW=_woodArr[_woodnum-1].eggW;
      _miken=_woodArr[_woodnum-1].miken;
      _eyeY=_woodArr[_woodnum-1].eyeY;
      _eyeradius=_woodArr[_woodnum-1].eyeradius;;
      }

  _colorArr[0].drawH(width/2+200*cos(radians(90)),260-200*(sin(radians(90))));
  _colorArr[1].drawH(width/2+200*cos(radians(50)),260-200*(sin(radians(50))));
  _colorArr[2].drawH(width/2+200*cos(radians(130)),260-200*(sin(radians(130))));
  _diaArr[0].drawDia2(width/2+200*cos(radians(-30)),260-200*(sin(radians(-30))),_colorArr[1].H);
  _diaArr[1].drawDia(width/2+200*cos(radians(210)),260-200*(sin(radians(210))),_colorArr[1].H);
  _barArr[0].drawBar(width/2+200*cos(radians(180)),260-200*(sin(radians(180))));
  _barArr[1].drawBar(width/2+200*cos(radians(10)),260-200*(sin(radians(10))));
  
    for (int i = 0; i < _woodnum; i++) {
    _woodArr[i].drawAll();
  }
  
      stroke(_colorArr[0].H,255,255);
      line(width/2,130,width/2,230);
      stroke(_colorArr[1].H,255,255);
      line(width/2+200*cos(radians(50)),260-100*(sin(radians(50))),width/2+_miken/2+_eyeradius/3,280-_eyeY);
      stroke(_colorArr[2].H,255,200);
      line(width/2+200*cos(radians(130)),260-100*(sin(radians(130))),width/2-_eggW*cos(radians(15)),280+_eggW*sin(radians(15)));
      stroke(0,50);
      line(width/2+200*cos(radians(-30))-50,260-100*(sin(radians(-30)))+50,width/2+_miken/2+_eyeradius/2,280-_eyeY);
      stroke(0);
      line(width/2+200*cos(radians(210))+50,260-100*(sin(radians(210)))+50,width/2-_miken/2-_eyeradius/2,280-_eyeY);
      stroke(0,50);
      line(width/2+200*cos(radians(10)),260-100*(sin(radians(10)))+16*_barArr[0].barlength/30-7,width/2+_miken/2+_eyeradius/2,280-_eyeY);
      line(width/2+200*cos(radians(180))+50+15,260-100*(sin(radians(180))),width/2-_miken/2-_eyeradius/2,280-_eyeY);
}

void getwood() {
  for (int i = 0; i < _woodnum; i++) {
    woodman thiswood = new woodman(random(width), random(height/3, height-50));
    _woodArr = (woodman[])append(_woodArr, thiswood);
  }
  
  
}

class woodman {
  float X, Y;
  float eyeradius, eyeY, miken, hitomiRadius, matugelength;
  float R, G, B, eyecolorR, eyecolorG, eyecolorB, stR, stG, stB;
  float mouthPattern, mouthRadiusX, mouthRadiusY, mouthY, _Y;
  int count=0;
  float mabSpeed, rectX, rectY;
  float eggX, eggY, eggW;
  float eyeDist1=0;
  float eyeDist2=0;
  float rotegg = 0;
  float rotplus = 3;
  float rot1 = 0;
  float rot2 = 0;
  float eyeIdou1=0;
  float eyeIdou2=0;
  float fpointX;
  float fpointY;
  int check00=0;
  int check01=0;
  float cos0=0;
  float temprot=0;

  woodman(float x, float y) {
    eggX=0;
    eggY=0;
    eggW=random(35, 80);
    X=width-eggW;
    Y=height-eggW;
    eyeradius = 30;
    eyeY = 0;
    miken = 50;
    hitomiRadius = 10;
    matugelength = 5;
    R=255;
    G=255;
    B=255;
    eyecolorR = 255;
    eyecolorG = 255;
    eyecolorB = 255;
    stR=255;
    stG=255;
    stB=200;
    mouthPattern=floor(random(4));
    mouthRadiusX=50;
    mouthRadiusY=20;
    mouthY=20;
    mabSpeed=random(10, 20);
    rectMode(CENTER);
    fpointX=width/2;
    fpointY=280;
  }


  void eyeDraw() {
    fill(255, 0, 256);
    stroke(0, 0, 0);
    strokeWeight(4);  
    ellipse(-miken/2, -eyeY, eyeradius, eyeradius);//left eye
    ellipse(miken/2, -eyeY, eyeradius, eyeradius);   

    eyeDist1=dist(mouseX-X, mouseY-Y, -miken/2, -eyeY);
    eyeDist2=dist(mouseX-X, mouseY-Y, miken/2, -eyeY);
    rot1 = atan2(-mouseY-eyeY+Y, -mouseX-miken/2+X);
    rot2 = atan2(-mouseY-eyeY+Y, -mouseX+miken/2+X);

    if (eyeDist1 < 300) {
      eyeIdou1=map(eyeDist1, 0, 300, 0, eyeradius/2-hitomiRadius/2);
    }
    else {
      eyeIdou1= eyeradius/2-hitomiRadius/2;
    }

    if (eyeDist2 < 300) {
      eyeIdou2=map(eyeDist2, 0, 300, 0, eyeradius/2-hitomiRadius/2);
    }
    else {
      eyeIdou2= eyeradius/2-hitomiRadius/2;
    }
    fill(eyecolorR, eyecolorG, eyecolorB);
    pushMatrix();
    translate(-miken/2, -eyeY);
    rotate(rot1-rotegg);
    ellipse(-eyeIdou1, 0, hitomiRadius, hitomiRadius);
    popMatrix();
    pushMatrix();
    translate(miken/2, -eyeY);
    rotate(rot2-rotegg);
    ellipse(-eyeIdou2, 0, hitomiRadius, hitomiRadius);
    popMatrix();

    drawMabataki();
  }

  void drawMabataki() {
    count += mabSpeed;
    if (count%1000>950) {
      fill(R, G, B);
      ellipse(-miken/2, -eyeY, eyeradius, eyeradius);//left eye
      ellipse(miken/2, -eyeY, eyeradius, eyeradius);
      drawMatuge(-miken/2, -eyeY, 1);
      drawMatuge(miken/2, -eyeY, 1);
    }
    else {
      drawMatuge(-miken/2, -eyeY, 0);
      drawMatuge(miken/2, -eyeY, 0);
    }
  }

  void drawMatuge(float matuX, float matuY, int up) {
    pushMatrix();
    translate(matuX, matuY);
    if (up==1) {
      rotate(radians(180));
    }
    line(0, -eyeradius/2, 0, -eyeradius/2-matugelength);
    rotate(radians(30));
    line(0, -eyeradius/2, 0, -eyeradius/2-matugelength);
    rotate(radians(-60));
    line(0, -eyeradius/2, 0, -eyeradius/2-matugelength);
    popMatrix();
  }

  void drawMauth() {
    noStroke();
    fill(0);
    if (mouthPattern == 0) {
      ellipse(0, mouthY, mouthRadiusX, mouthRadiusY);
    }
    if (mouthPattern == 1) {
      rect(0, mouthY+eggW/10, mouthRadiusX, mouthRadiusY+eggW/10);
    }
    if (mouthPattern == 2) {
      triangle(0, mouthY+mouthRadiusY, mouthRadiusX/2, mouthY, -mouthRadiusX/2, mouthY);
    }
    if (mouthPattern == 3) {
      triangle(0, mouthY-mouthRadiusY/2, mouthRadiusX/2, mouthY+mouthRadiusY/2, -mouthRadiusX/2, mouthY+mouthRadiusY/2);
    }
  }

  void wood() {
    stroke(stR, stG, stB); 
    strokeWeight(4);
    fill(R, G, B);
    beginShape();
    vertex(eggX-eggW, eggY);
    bezierVertex(eggX-eggW*5/7, -eggW*2+eggY, eggX+eggW*5/7, -eggW*2+eggY, eggX+eggW, eggY);
    bezierVertex(eggX+eggW, eggW*10/7+eggY, eggX-eggW, eggW*10/7+eggY, eggX-eggW, eggY);
    endShape();
  }

  void drawAll() {
    pushMatrix();
    
    if (mousePressed) {
      if(check00==0){
      if(dist(mouseX, mouseY, fpointX,fpointY)<eggW || (  mouseY-fpointY > 0.027*50/eggW * (mouseX-fpointX) * (mouseX-fpointX) -3*eggW/2 && mouseY-fpointY<0 )){
        check00=1;
      }
      }
      if(check00==1){
       X=mouseX;
      Y=mouseY;
      }
    }
     else{
     if(check00==1 && dist(width/2,270,mouseX,mouseY)>125){
      check00=2;
      X=mouseX;
      Y=height-eggW;
      woodman thiswood = new woodman(random(width), random(height/3, height-50));
    _woodArr = (woodman[])append(_woodArr, thiswood);
    _woodnum++;
     }
     if(check00!=2){
       check00=0;
       X=fpointX;
       Y=fpointY;
     }
     }
     if (mousePressed) {
      if(check00==2){
      if (dist(mouseX, mouseY, X, Y)<eggW || (  mouseY-Y > 0.027*50/eggW * (mouseX-X) * (mouseX-X) -3*eggW/2 && mouseY-Y<0 )) {
        check01=1;
        cos0=0;
      }
      }
    }
    if(check00==0){
      translate(fpointX, Y);
    }
    else{
    translate(X, Y);
    }
    if(check01==1){
    if (mousePressed) {
      rotegg=atan2(-mouseY+Y, -mouseX+X)-PI/2;
      if(rotegg>-PI/2){
      translate(eggW*rotegg, 0);
      rotate(rotegg);
      }
      else if( rotegg<-PI){
      translate(eggW*PI/2, 0);
      rotate(PI/2);
      rotegg=PI/2;
      }
      else{
      translate(-eggW*PI/2, 0);
      rotate(-PI/2);
      rotegg=-PI/2;
      }
    }
    else{
     check01=2;
     temprot=rotegg; 
    }
    }
    if(check01==2){
     temprot *= 0.95;
     cos0 += 0.1;
     rotegg=temprot*cos(cos0);
           
        if(rotegg>-PI/2){
      translate(eggW*rotegg, 0);
      rotate(rotegg);
      }
     if(abs(temprot)<radians(2)){
      check01=0;
      rotegg=0;
      temprot=0;
     }
    }
    wood();
    drawMauth();
    eyeDraw();
    popMatrix();
  }
}

void drawCircle() {
    noStroke();
    colorSelect thiscolor = new colorSelect(50,255);
    _colorArr = (colorSelect[])append(_colorArr, thiscolor);
    colorSelect thiscolor2 = new colorSelect(50,255);
    _colorArr = (colorSelect[])append(_colorArr, thiscolor2);
    colorSelect thiscolor3 = new colorSelect(50,200);
    _colorArr = (colorSelect[])append(_colorArr, thiscolor3);
}

class colorSelect {
  float H,B;
  float diameter;
  colorSelect(float dia,float b) {
    H=0;
    B=b;
    diameter = dia;
  }
  void colorChange(float changeH) {
    H=changeH;
  }

  void drawH(float x, float y) {
    translate(x, y);
    float distance= dist(x, y, mouseX, mouseY);
    if(_check==false){
    if (mousePressed==true) {
      if (distance>diameter*0.425 && distance<diameter*1.2) {
        colorChange((180/PI*atan2( -mouseY + y, -mouseX+x )+180)/360*255);
      }
    }
    }
    stroke(H, 255, B);
    line(0, 0, 0, diameter*1.5);
    line(0, 0, diameter*cos(radians(H*360/255)), diameter*sin(radians(H*360/255)));
    fill(0, 0, 255);
    ellipse(0, 0, diameter*0.85, diameter*0.85);
    fill(0, 255, 0);
    textSize(diameter*0.4);
    text(int(H), 0, diameter*0.15);
    noStroke();
    for (int i=0; i<360; i++) {
      fill(255*i/360, 255, B);
      pushMatrix();
      rotate(radians(i));
      rect(diameter, 0, diameter/5, 3);
      popMatrix();
    }
    translate(-x, -y);
  }
}


void getBar() {
    barSelect thisbar = new barSelect(100, false);
    _barArr = (barSelect[])append(_barArr, thisbar);
    barSelect thisbar2 = new barSelect(100, true);
    _barArr = (barSelect[])append(_barArr, thisbar2);
}

class barSelect {
  float barlength;
  float barX=0;
  boolean tate;
  float tempBar;
  barSelect(float len, boolean Tate) {
    barlength = len;
    tate=Tate;
    tempBar= len/2;
  }

  void drawBar(float x, float y) {
    rectMode(CENTER);
    stroke(0);
    pushMatrix();
    translate(x, y);
    if (tate==true) {
      rotate(-PI/2);
    }
    strokeWeight(1);
    line(-barlength/3, -barlength/5, barlength/3, -barlength/5);
    fill(0);
    triangle(-barlength/3-barlength/20, -barlength/5, -barlength/3, -barlength/5-barlength/20, -barlength/3, -barlength/5+barlength/20);
    triangle(barlength/3+barlength/20, -barlength/5, barlength/3, -barlength/5-barlength/20, barlength/3, -barlength/5+barlength/20);
    strokeWeight(3);
    rect(-16*barlength/30, 0, barlength/15, barlength/4);
    rect(16*barlength/30, 0, barlength/15, barlength/4);
    fill(255);
    rect(0, 0, barlength, barlength/16);
    if(_check==false){
    if (tate==true) {
      if (abs(mouseY-y) < barlength/2 && abs(mouseX-x)<barlength/4) {
        if (mousePressed) {
          barX=-mouseY+y;
          tempBar=barX+barlength/2;
        }
      }
    }
    else {
      if (abs(mouseX-x) < barlength/2 && abs(mouseY-y)<barlength/4) {
        if (mousePressed) {
          barX=mouseX-x;
          tempBar=barX+barlength/2;
        }
      }
    }
    }
    rect(barX, 0, barlength/15, barlength/4);
        if (tate==true) {
          fill(0,50);
          ellipse(-16*barlength/30-10, 0,10,10);
      fill(255);
     ellipse(barX,-barlength/4-barlength/8,barlength/4,barlength/4); 
     ellipse(barX,+barlength/4+barlength/8,barlength/4,barlength/4);
    fill(0);
     ellipse(barX,-barlength/4-barlength/8,barlength/8,barlength/8); 
     ellipse(barX,barlength/4+barlength/8,barlength/8,barlength/8); 
    pushMatrix();
    translate(barX,-barlength/4-barlength/8);
    strokeWeight(4);
    rotate(radians(90));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(30));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(-60));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    popMatrix();
    pushMatrix();
    translate(barX,barlength/4+barlength/8);
    strokeWeight(4);
    rotate(radians(90));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(30));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(-60));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    popMatrix();
    }
    else{
      fill(0,50);
      ellipse(16*barlength/30+10, 0,10,10);
     fill(255);
     ellipse(barlength/3+barX/5,-barlength/4-barlength/8,barlength/4,barlength/4); 
     ellipse(-barlength/3-barX/5,-barlength/4-barlength/8,barlength/4,barlength/4);
    fill(0); 
     ellipse(barlength/3+barX/5,-barlength/4-barlength/8,barlength/8,barlength/8); 
     ellipse(-barlength/3-barX/5,-barlength/4-barlength/8,barlength/8,barlength/8); 
    pushMatrix();
    translate(barlength/3+barX/5,-barlength/4-barlength/8);
    strokeWeight(4);
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(30));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(-60));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    popMatrix();
    pushMatrix();
    translate(-barlength/3-barX/5,-barlength/4-barlength/8);
    strokeWeight(4);
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(30));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    rotate(radians(-60));
    line(0, -barlength/8, 0, -barlength/8-barlength/16);
    popMatrix();
    }
    popMatrix();
  }
}

void getDia() {
  for (int i=0; i<_dianum; i++) {
    diaSelect thisdia = new diaSelect(100);
    _diaArr = (diaSelect[])append(_diaArr, thisdia);
  }
}

class diaSelect {
  float dialength,diaY,diamin;
  diaSelect(float len) {
    dialength=len;
    diaY=dialength/10;
    diamin=dialength/10;
  }

  void drawDia(float x, float y,float H) {
    rectMode(CENTER);
    pushMatrix();
    translate(x, y);
    float distdia =dist(mouseX,mouseY,x,y);
    fill(255);
    strokeWeight(3);
    stroke(0);
    ellipse(0,0,dialength,dialength);
    fill(H,255,255);
    if(_check==false){
      if (distdia < dialength/2) {
        if (mousePressed) {
          diaY=distdia;
          if(diaY<diamin){
           diaY=diamin; 
          }
        }
      }
    }
    ellipse(0,0,diaY*2,diaY*2);
    fill(0,50);
    noStroke();
    ellipse(0,0,diamin*2,diamin*2);
    strokeWeight(1);
    stroke(0);
    line(0,diamin,0,diaY);
    triangle(0,diamin+diaY-diamin,(diaY-diamin)/10,diaY-(diaY-diamin)/5,(-diaY+diamin)/10,diaY-(diaY-diamin)/5);
    triangle(0,diamin,(diaY-diamin)/10,diamin+(diaY-diamin)/5,(-diaY+diamin)/10,diamin+(diaY-diamin)/5);
    strokeWeight(4);
    line(0, -dialength/2, 0, -dialength/2-dialength/8);
    rotate(radians(30));
    line(0, -dialength/2, 0, -dialength/2-dialength/8);
    rotate(radians(-60));
    line(0, -dialength/2, 0, -dialength/2-dialength/8);
    popMatrix();
  }
  
    void drawDia2(float x, float y,float H) {
    rectMode(CENTER);
    pushMatrix();
    translate(x, y);
    float distdia =dist(mouseX,mouseY,x,y);
    fill(255);
    strokeWeight(3);
    stroke(0,50);
    ellipse(0,0,dialength,dialength);
    fill(255);
    if(_check==false){
      if (distdia < dialength/2) {
        if (mousePressed) {
          diaY=distdia;
          if(diaY<diamin){
           diaY=diamin; 
          }
        }
      }
    }
    stroke(0);
    ellipse(0,0,diaY*2,diaY*2);
    line(0,diamin,0,diaY);
    triangle(0,diamin+diaY-diamin,(diaY-diamin)/10,diaY-(diaY-diamin)/5,(-diaY+diamin)/10,diaY-(diaY-diamin)/5);
    triangle(0,diamin,(diaY-diamin)/10,diamin+(diaY-diamin)/5,(-diaY+diamin)/10,diamin+(diaY-diamin)/5);
    pushMatrix();
    strokeWeight(4);
    line(0, -diaY, 0, -diaY-diaY/4);
    rotate(radians(30));
    line(0, -diaY, 0, -diaY-diaY/4);
    rotate(radians(-60));
    line(0, -diaY, 0, -diaY-diaY/4);
    popMatrix();
    fill(H,255,255);
    ellipse(0,0,diamin*2,diamin*2);
    strokeWeight(1);
    stroke(0,50);
    strokeWeight(4);
    line(0, -dialength/2, 0, -dialength/2-dialength/8);
    rotate(radians(30));
    line(0, -dialength/2, 0, -dialength/2-dialength/8);
    rotate(radians(-60));
    line(0, -dialength/2, 0, -dialength/2-dialength/8);
    popMatrix();
  }
}
