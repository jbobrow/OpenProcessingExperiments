
Face [] face= new Face[10];
void setup (){
size (800,800);

for (int i=0; i<face.length ; i++){
  face[i] = new Face (random (width), random (height), random (150));
}
}
void draw (){
  background (255);
 for (int i=0; i<face.length ; i++){
  face [i].mostrar();
 face [i]. moverse();
face [i].rebote();
 }
}
class Face {
  float x;
  float y;
  float a;
  float speed ;
  float speed2;
  
  Face (float x_, float y_, float a_){
    x=x_;
    y=y_;
    a=a_;
    
    speed=2;
    speed2=1;
  }
  void mostrar (){
      
    fill(255);
ellipse (x,y,a*4,a*4);
fill(0);
ellipse (x-a,y-(a/2),x/4-a/2,x/4-a/2);
ellipse(x+a,y-a/2,x/4-a/2,x/4-a/2);
rect (x-a,y+a/2,x-2*a, a/2);
}



void moverse(){
  
  x=x+speed;
  x=x+speed2;
}
  void rebote(){
  if((x>width)|| (x<0)){
    speed=speed*-1;
    speed2=speed2*-1;  
    
  }
}
}





