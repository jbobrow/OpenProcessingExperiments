
Vector space = new Vector(); 
int speed=6;
int collor=int(random(100));
int ngen=4;
//space s= new space(1);
void setup(){
  size(1000, 700);
  background(0);
  shape k=new shape(ngen);
  space.addElement(k);   
}

void draw(){
  background(0);
  int size = space.size();
  for (int i = 0; i < size; i++) { 
    shape s=(shape) space.elementAt(i);
    s.show();
    s.checkForm();
    s.animateForm();
  }
// collor=size;
  if (0>random(1000)){
    shape k=new shape(ngen);
    space.addElement(k); 
  }  

}

class p { 
  float x,y;
  float velocity_x,velocity_y;
  p (float _x,float _y,float _velocity_x,float _velocity_y) {  
    x = _x ; 
    y = _y ;
    velocity_x=_velocity_x;
    velocity_y=_velocity_y;
  } 
  void animateForm(){
    x += velocity_x;
    y += velocity_y;
    if (x<0){velocity_x=-velocity_x;}
    if (y<0){velocity_y=-velocity_y;}
    if (x>width){velocity_x=-velocity_x;}
    if (y>height){velocity_y=-velocity_y;}
  }
}

class shape { 
  int pcount;
  int shapeColor;
  p[] pset;
  shape(int _pcount){ 
    shapeColor=int(random(100));
    pcount=_pcount;
    pset = new p[pcount];
    for (int k=0;k<pcount;k++){
      float r1 = random(2*speed+1)-(speed+1);
      float r2 = random(2*speed+1)-(speed+1);
      pset[k]=new p(random(width),random(height),r1,r2);
    }
  } 
  void show(){
    while (checkForm()){
    reForm();
    }
    colorMode(HSB, 100);
      if (100>random(1000)){ collor=(collor+1) % 100 ;}
    // println(collor);
    fill(collor,shapeColor,100,50);
    stroke(100,50);
    beginShape();
    for (int k=0;k<pcount;k++){
      vertex(pset[k].x,pset[k].y);
    }
    endShape(CLOSE);
    strokeWeight(10);
    for (int k=0;k<pcount;k++){
      point(pset[k].x,pset[k].y);
    }
    strokeWeight(1);
  }
  boolean checkForm(){
    boolean r=false;
    for (int x=0;x<pcount;x++){
      for (int y=0;y<pcount-3;y++){ //-3 cunku kendisi ve iki komsusu ile kiyaslamay gerek yok
        int k=(x+1) % pcount; 
        int m=(x+y+2) % pcount; // ilk nokta bu 
        int n=(m+1) % pcount ; // ikinci nokta bu
        // vertex(pset[k].x,pset[k].y);
        //println (x+"-"+k+"-"+m+"-"+n);
        int t=detectIntersection(pset[x],pset[k],pset[m],pset[n]);
        if (t==1) {r=true;}
      }
    }
//    if (r==true) {print(" "+"*");}
//    else {print(" "+"-----");}
    return r;
    }
  void animateForm(){
    for (int k=0;k<pcount;k++){pset[k].animateForm();}
  }
  void reForm(){
    int r1=0;
    int r2=0;
    while (r1==r2){
    r1=int(random(pcount));
    r2=int(random(pcount));
    }
    p Temp=pset[r1];
    pset[r1]=pset[r2];
    pset[r2]=Temp;    
  }
  
}  

int detectIntersection(p p1,p p2,p p3,p p4){
  /*
  x and y are used for line 1, u and v for line 2
  input x1,y1 input x2,y2 input u1,v1 input u2,v2
  b1 = (y2-y1)/(x2-x1) (A) 
  b2 = (v2-v1)/(u2-u1) (B)
  a1 = y1-b1*x1 
  a2 = v1-b2*u1
  xi = - (a1-a2)/(b1-b2) (C) 
  yi = a1+b1*xi 
  if (x1-xi)*(xi-x2)>=0 AND (u1-xi)*(xi-u2)>=0 AND (y1-yi)*(yi-y2)>=0 AND (v1-yi)*(yi-v2)>=0 then 
    print "lines cross at",xi,yi 
  else 
    print "lines do not cross" end if
  */
  int r=0;
  float x1=p1.x;
  float y1=p1.y;
  float x2=p2.x;
  float y2=p2.y;
  float u1=p3.x;
  float v1=p3.y;
  float u2=p4.x;
  float v2=p4.y;
  float b1 = (y2-y1)/(x2-x1);
  float b2 = (v2-v1)/(u2-u1);
  float a1 = y1-b1*x1;
  float a2 = v1-b2*u1;
  float xi = - (a1-a2)/(b1-b2);
  float yi = a1+b1*xi;
  if ( ((x1-xi)*(xi-x2)>=0) && ((u1-xi)*(xi-u2)>=0) && ((y1-yi)*(yi-y2)>=0) && ((v1-yi)*(yi-v2)>=0) ) {r=1;}


return r;
}

