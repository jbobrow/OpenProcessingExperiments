
// MWPatternSketchOld.pde 
// Marius Watz - http://workshop.evolutionzone.com
//
// From the crypt: Old sketch from 2004 with some minor
// modifications. Draws simple angular line patterns
// 
// from http://processing.unlekker.net
//

Particle part[];
int num;
int colors[][],colNum,colBG;
boolean doSaveFrame=false,doSetBackground=true;
float rotMod;

void setup() {
  size(800,600);
  smooth();
  rectMode(CENTER_RADIUS);
  ellipseMode(CENTER_DIAMETER);
  
  colors=new int[100][3];
  colNum=0;
  for(int i=0; i<6; i++) addColor(i*40,i*40,i*40);
  addColor(255,255,255);

  // actual colors
  addColor(0,255,255);
  addColor(255,100,0);
  addColor(150,255,0);
  addColor(255,0,128);
  addColor(255,255,0);
    
  colBG=0;
  
  num=30;
  part=new Particle[num];
  for(int i=0; i<num; i++) {
    part[i]=new Particle();
    part[i].col=i%colNum;
  }
}

void draw() {
  if(doSetBackground) {
    background(colors[colBG][0],
      colors[colBG][1],
      colors[colBG][2]);
    doSetBackground=false;
  }
    
  noStroke();
  for(int i=0; i<num; i++) part[i].update();
  
    
  if(doSaveFrame) {
    saveFrame();
    doSaveFrame=false;
  }
}

void addColor(int r,int g, int b) {
  colors[colNum][0]=r;
  colors[colNum][1]=g;
  colors[colNum][2]=b;
  colNum++;
}

void mouseMoved() {
}

void mousePressed() {
  colBG=(colBG+2)%8;
//  colBG=0;
  doSetBackground=true;
    
  for(int i=0; i<num; i++) part[i].init();
}

void keyPressed() {
  if(key=='s') doSaveFrame=true;
}


class Particle {
  Vec2D v,vOld,dir;
  int col,age,num,cnt;
  int state,LINE=0,CIRCLE=1;
  float rad,rot,speed,px,py;
  
  Particle() {
    v=new Vec2D(0,0);
    vOld=new Vec2D(0,0);
    dir=new Vec2D(0,0);
    speed=random(2)+0.25;
    num=300;
    init();
    cnt=(int)random(300);
  }

  void initState(int _state) {
    if(_state==LINE) {
      state=CIRCLE;      
      if(random(100)>50) {
        rot=3;
        age=30;
        speed=1;
      }
      else {
        rot=-1;
        age=90;
        speed=0.5;
      }
      rot=radians(rot);
    }
    else {
      state=LINE;
      rot=0;
      speed=((float)(int)random(3))*0.5+1;
      age=(int)random(50)+20;
      if(random(100)>90) age+=50;
    }
  }
  
  void init() {
    rotMod=0.5+(float)((int)random(1,4))*0.166;
    
    v.set(random(width),random(height));
    dir.set(1,0);
    dir.rotate(radians(30));//random(PI*2));
            
    do {
      col=((int)random(10000))%colNum;
    } while(col==colBG); 
    col=((int)random(10000))%(colNum-1)+1;
    
    initState(CIRCLE);    
    if(random(100)<90) rad=2;
    else rad=(int)(8+random(5));
  }

  void update() {
    vOld.set(v);
    dir.rotate(rot*rotMod);
    v.add(dir.x*speed,dir.y*speed);
    
    age--;
    if(age==0) initState(state);

    if(v.x<0 || v.x>width || v.y<0 || v.y>height) {
      if(v.x<0) v.x=width;
      else if(v.x>width) v.x=0; 
      if(v.y<0) v.y=height;
      else if(v.y>height) v.y=0; 
      vOld.set(v);
    }
    noFill();
    fill(colors[col][0],colors[col][1],colors[col][2]);
    ellipse(v.x,v.y, rad*speed,rad*speed);//3,3);
//    line(vOld.x,vOld.y,v.x,v.y);//, 2,2);
    
    if(cnt%100==0) {
      noFill();
      fill(colors[col][0],colors[col][1],colors[col][2]);
      ellipse(v.x,v.y, rad,rad);
    }
    
    cnt++;
    if(cnt%2500<10) dir.rotate(radians(4.5f));  
//    for(int i=0; i<num-1; i++) rect(x[i],y[i], 1,1);
/*    noFill();
    stroke(colors[col][0],colors[col][1],colors[col][2]);
    for(int i=0; i<(num/4-1); i++) 
      line(x[num-1],y[num-1],x[i*4],y[i*4]);
*/
//      line(x[i*10],y[i*10], x[(i+1)*10],y[(i+1)*10]);
  }
    
}



