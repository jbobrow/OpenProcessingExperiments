
/*

 AB
 CD
 */
String [] locs = {
  "a","b","c","d"};
PVector A;
PVector C;
PVector iswhere(PVector A,PVector C){
  String retval = "a"; 
  if(A.x< C.x && A.y<C.y)retval="a";
  if(A.x> C.x && A.y<C.y)retval="b";
  if(A.x> C.x && A.y>C.y)retval="c";
  if(A.x< C.x && A.y>C.y)retval="d";
  int _x=0;
  int _y=0;
  if(retval=="a"){
    _x=-1;
    _y=-1; 
  }

  if(retval=="b"){
    _x=1;
    _y=-1; 
  }
  if(retval=="c"){
    _x=1;
    _y=1; 
  }

  if(retval=="d"){
    _x=-1;
    _y=1; 
  }



  PVector retvalv = new PVector (_x,_y,0); 
  return retvalv;

}
int w = 255;
int h = 255;
void setup(){
  C= new PVector(random(w),random(h),0);
  size(255,255,P2D);
  smooth();
  ellipseMode(CENTER);
  A= new PVector(mouseY,mouseY,0);
  tex.filter(INVERT);
}
PImage tex=new PImage(w,h);
void draw(){
  image(tex,0,0);
  A= new PVector(mouseX,mouseY,0);
ellipse(A.x,A.y,40,40);
  float dis = dist(A.x,A.y,C.x,C.y);
  if(dis<40){
     PVector getem = iswhere(A,C);
     if(C.x<w-25 && C.x>25 && C.y<h-25 && C.y>25){
     C.x+=getem.x;
     C.y+=getem.y;
     }
     else{
      C.x-=getem.x;
     C.y-=getem.y; 
     }
  }
  ellipse(C.x,C.y,40,40);
  tex.set(int(C.x),int(C.y),1);
   tex.set(int(C.x)+1,int(C.y),1);
    tex.set(int(C.x)+1,int(C.y)+1,1);
     tex.set(int(C.x),int(C.y)+1,1);
     tex.updatePixels();
  line(C.x,C.y-20,C.x,C.y+20);
  line(C.x-20,C.y,C.x+20,C.y);
}


                
