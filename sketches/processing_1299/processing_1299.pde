
/** 
press any key to reset, drag-release mouse to distribute points 
*

// Nov 19th, 2008
 
void setup() { 
  size(400,300); 
  reset(); 
} 
 
int num=69; 
Ball[] b=new Ball[num]; 
boolean moving=false; // if balls are moving to the line 
int d=0; // current recorded mouse point 
int[] recx=new int[num]; 
int[] recy=new int[num]; 
int dSS; 
 
void draw(){ 
  background(10,20,30); 
  for (int i=0;i<num;i++){ 
 
    if (!moving){ 
 b[i].move(); 
    }  
    else { 
 //repeat(); 
 stroke(255,255,0); 
 if (i>0){ 
   line(recx[i],recy[i],recx[i-1],recy[i-1]); 
 } 
 b[i].x+=(recx[i]-b[i].x)*.05; 
 b[i].y+=(recy[i]-b[i].y)*.05; 
    } 
    b[i].show(); 
  } 
} 
 
void mouseDragged(){ 
  moving=false; 
  if (d==0){ 
    for (int i=0;i<num;i++){ 
 recx[i]=mouseX; // reset previous draw; 
 recy[i]=mouseY; 
    } 
  } 
  if (mousePressed==true){ 
    for (int i=1;i<d;i++){ 
 stroke(255); 
 line(recx[i],recy[i],recx[i-1],recy[i-1]); 
    } 
  } 
  if (d<num){    
    recx[d]=mouseX; 
    recy[d]=mouseY; 
    d++; 
  }  
} 
 
void mouseReleased(){ 
  if (d<num){ //i use it  when mouse records number (recx, recy) is smaller than particle number (num)   
    dSS=-1; 
    for (int i=d;i<num;i++){ 
 if (d>0){  
   dSS+=2; 
   //println(i+"="+dSS); 
   if(i>dSS){ 
     recx[i]=recx[i-dSS]; //so empty mouse records are filled with previous mouse records  
     recy[i]=recy[i-dSS]; // not elegant.... i know... any better ideas? 
   } 
 } 
    } 
 
  } 
  moving=true; 
  d=0; 
} 
 
void reset(){ 
  for (int i=0;i<num;i++){ 
    b[i]=new Ball(random(-2,2),width/2,random(height)); 
  } 
} 
 
void keyReleased(){ 
  reset(); 
  moving=false; 
} 
 
class Ball{ 
  float speed; 
  float x; 
  float y; 
  Ball (float _speed, float _x, float _y) { 
    speed=_speed; 
    x=_x; 
    y=_y; 
  } 
 
  void move(){ 
    x+=speed; 
    borders(); 
  } 
 
  void show(){ 
    noFill(); 
    stroke(255,0,0); 
    ellipse(x,y,5,5); 
  } 
   
  void borders(){ 
  if (x<0){ 
    x=width; 
  } 
  if (x>width){ 
    x=0; 
  } 
  } 
} 
 
void setup() { 
  size(400,300); 
  reset(); 
} 
 
int num=69; 
Ball[] b=new Ball[num]; 
boolean moving=false; // if balls are moving to the line 
int d=0; // current recorded mouse point 
int[] recx=new int[num]; 
int[] recy=new int[num]; 
int dSS; 
 
void draw(){ 
  background(10,20,30); 
  for (int i=0;i<num;i++){ 
 
    if (!moving){ 
 b[i].move(); 
    }  
    else { 
 //repeat(); 
 stroke(255,255,0); 
 if (i>0){ 
   line(recx[i],recy[i],recx[i-1],recy[i-1]); 
 } 
 b[i].x+=(recx[i]-b[i].x)*.05; 
 b[i].y+=(recy[i]-b[i].y)*.05; 
    } 
    b[i].show(); 
  } 
} 
 
void mouseDragged(){ 
  moving=false; 
  if (d==0){ 
    for (int i=0;i<num;i++){ 
 recx[i]=mouseX; // reset previous draw; 
 recy[i]=mouseY; 
    } 
  } 
  if (mousePressed==true){ 
    for (int i=1;i<d;i++){ 
 stroke(255); 
 line(recx[i],recy[i],recx[i-1],recy[i-1]); 
    } 
  } 
  if (d<num){    
    recx[d]=mouseX; 
    recy[d]=mouseY; 
    d++; 
  }  
} 
 
void mouseReleased(){ 
  if (d<num){ //i use it  when mouse records number (recx, recy) is smaller than particle number (num)   
    dSS=-1; 
    for (int i=d;i<num;i++){ 
 if (d>0){  
   dSS+=2; 
   //println(i+"="+dSS); 
   if(i>dSS){ 
     recx[i]=recx[i-dSS]; //so empty mouse records are filled with previous mouse records  
     recy[i]=recy[i-dSS]; // not elegant.... i know... any better ideas? 
   } 
 } 
    } 
 
  } 
  moving=true; 
  d=0; 
} 
 
void reset(){ 
  for (int i=0;i<num;i++){ 
    b[i]=new Ball(random(-2,2),width/2,random(height)); 
  } 
} 
 
void keyReleased(){ 
  reset(); 
  moving=false; 
} 
 
class Ball{ 
  float speed; 
  float x; 
  float y; 
  Ball (float _speed, float _x, float _y) { 
    speed=_speed; 
    x=_x; 
    y=_y; 
  } 
 
  void move(){ 
    x+=speed; 
    borders(); 
  } 
 
  void show(){ 
    noFill(); 
    stroke(255,0,0); 
    ellipse(x,y,5,5); 
  } 
   
  void borders(){ 
  if (x<0){ 
    x=width; 
  } 
  if (x>width){ 
    x=0; 
  } 
  } 
} 

