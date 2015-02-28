
// A study on double siral.
// by Alessandro Capozzo 
// 27th August 2003.
// EDITED and UPDATED by Kevin Gutowski
// 1st April 2014.

float rotation;
float coef;
float step,ang,r,x,y,l;
int xx,yy,zz;
star[] galaxy;
int index;
void setup() {
  size(400,400,P3D);
  background(255);
  
  coef=0;
  galaxy=new star[9501];
  rotation=PI/600;
  index=1;
   for(int s=0;s<2;s++){
    for (int step=0;step<600;step++){
      r=step*0.4f;
      ang=step*0.025f+(0.0001f/random(20))+PI*s;
      x = cos(ang)*r;
      y = sin(ang)*r;
      l=18-(step/25)+1;
      //l=10;
      for (int p=0;p<l;p++){
      xx =(int)( x + (random((l*2))-(l*2)));
      zz =(int)(y + (random(l*2)-(l*2)));
        yy =0+(int)(random(l*2)-(l));
        int rr=(int)(l*5+random(30));
        int gg=(int)(l*5-random(5));
        int bb=(int)(l*5-random(5));
        galaxy [index] = new star(xx,yy,zz,150+rr,200+gg,200+bb);
        index=index+1;
         }
      }
      
 
 }
 
 
}

void draw() {
    background(0);
    rotateZ(PI/5);
     rotateX(PI/-6);
// 
    coef=coef+rotation;
    if (coef>PI){
        coef=0;
       }
   pushMatrix();
    translate(280,20);

     pushMatrix();
      rotateY(rotation);
         rotation=PI*(mouseX)/40;
         int count=galaxy.length;
          for (int i=1;i<count;i++){
          galaxy[i].update();
          }
      popMatrix();
      
       
   popMatrix();
 }
 
 
class star {
   int _x,_y,_z,_r,_g,_b;
   star(int x,int y, int z, int r,int g, int b){
    _x=x;
    _y=y;
    _z=z;
    _r=r;
    _g=g;
    _b=b;
   }
   void update () {
   stroke(_r,_g,_b);
    point(_x,_y,_z);
   }
}

