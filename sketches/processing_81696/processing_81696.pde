
//import ddf.minim.*; 
//Minim minim;
//AudioInput input;

ArrayList arr = new ArrayList();

PVector ppos;
PVector opos;
PVector pos;
PVector vcur;
PVector vvec;
PVector rec;
PVector rrec;
PVector apos;
PVector hor;
PVector test;
PVector mos;

int n;
int i;
int ren;
int cur;
int m = 11;

float lf = 0.8;
float off = 0.6;
float l = 400;
float rea;
float v;
float vp;
float a = PI/10;
float mx = 400;
float my = 640;
float Le;
float kraft = 3;
float sdiam;

float[] vin = new float[999999];
float[] px = new float[999999];
float[] py = new float[999999];

void setup(){  
  size(800,900);
  background(0);
  smooth();
  
  vin[0] = PI/2-a;
  pos = new PVector(width/2,0);
  arr.add(pos); 
};

void draw(){
  background(0);
  noStroke();
  smooth();
  
//  minim = new Minim(this);
 // minim.debugOn();
 // input = minim.getLineIn(Minim.STEREO, 512);
  
  hor = new PVector(1,0);
  px[0]=width/2;
  
  for(int s=0; s<m; s++){
    for(int t=0; t<pow(2,s); t++){
      fract gen = new fract(s, t);
     };
   };
    
  if(mousePressed == true){  
    sun su = new sun(mouseX, mouseY); 
  }else{
    sun su = new sun(mx, my); 
  };
};


class fract{
  fract(int n, int i){
    stroke(255);
    float mu=0.5;
   
    fill(180,240,210);
 
    Le = l*pow(lf,n+1)+Le*(mu/5);
 
    ren = int(pow(2,n-1)+i/2);                 //finds number of previous branch
    float ppx = px[ren];
    float ppy = py[ren];    
    ppos = new PVector(ppx,ppy);   
   
    vp = vin[ren];                             //angel from horisontal of previous branch
    rea = pow(-1,i);                           //pattern 1,(-1),1,(-1)... for i=0,1,2,3...
    v = vp+rea*a;                              //adds or subtracts "a" from previous angel
    vcur = new PVector(cos(v),sin(v));         //creates a direction vector for the current line
    vcur.mult(Le);                             //multiplies the direction vector with the length
    pos = new PVector();                       //introduces an empty vector pos
    pos.add(ppos);                             //end of previous branch to current branch 
    pos.add(vcur);                             //adds current vector to position
    
    rec = new PVector(mx,my);                  //introduces a new vetor from of center of the sun
    mos = new PVector(rec.x,rec.y);
    rec.sub(pos);                              //finds vector distance between current position and sun
    float dis = rec.mag();
    map(dis, 0, 800, 1, 3);
    rec.normalize();                           //normalizes vector distance
    rec.mult(dis*kraft/Le);                   //multiplies vector distance by "kraft"
    pos.add(rec);
    rec.normalize();                           
    rec.mult(Le);
    rec.sub(vcur);
    rec.mult(dis*kraft/(999999));
    pos.add(rec);
    
    //adds 10 in the direction of the sun
    
    vvec = new PVector(pos.x, pos.y);          //introduces new vector identical to pos
    vvec.sub(ppos);                            //finds dictance between current and previous position
    vvec.mult(0.5);                            //scales the distance to half
    vvec.add(ppos);                            //finds position vector for half of current vector
  
    strokeWeight(map(-n, -m, 0, 0, 0.8));
    stroke(255);
    line(ppos.x,ppos.y,pos.x,pos.y);           //draws a line from end of previous to end of current branch
 
    strokeWeight(0.5);
    stroke(map(n, 0, m, 100, 255));
    
    float mo = mos.mag();
    float sdiam = (Le/10)+Le*Le*mu/1000;
    
    ellipse(pos.x,pos.y,sdiam,sdiam);          //draws an ellipse on the end of the current line
  
   
    opos = new PVector(pos.x, pos.y);          //introduces new vector identical to pos
    opos.sub(ppos);                            //finds dictance between current and previous position
    opos.mult(off);                            //scales the distance by the variable "off"
    pos.sub(opos);                             //subtracts the distance from pos
 
    apos = new PVector(pos.x,pos.y);
    apos.sub(ppos);
    v = PVector.angleBetween(apos, hor);
    int cur = int(pow(2,n)+i);                 //finds the number of he current branch
    vin[cur] = v;                              //stores the current angel "v" in an array of floats  
    px[cur] = pos.x;
    py[cur] = pos.y;   
  };
};

class sun{
  sun(float xx, float yy){ 
    noStroke();
    float diam=50+0.8*sin(frameCount/2);
    fill(146,192,0);
    ellipse(xx,yy,diam,diam);
    mx = xx;
    my = yy;
  };
};

void keyPressed() {
  if (key == ' ') {
save("MyPicture.jpg");
  }
}

//void stop()
//{
 // input.close();
 // minim.stop();
//  super.stop();
//}



