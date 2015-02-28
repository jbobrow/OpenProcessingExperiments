
FallingObject[] objects;
void setup(){
   size(800,600,P3D);
   objects = new FallingObject[8];
   for(int i = 0; i < objects.length; i++){
    objects[i] = new FallingObject(800, 600);
   }
}
 
int frame = 0;
 
void draw(){
  background(0);
  for(int i = 0; i < objects.length; i++){
    objects[i].move();
    objects[i].draw();
  }
}
 
 
 
class FallingObject{
   float x;
   float y;
   float vel;
   
   FallingObject(int maxx, int maxy){
     this.x = random(maxx);
     this.y = random(maxy);
     vel = random(6);

   }
 
   void move(){
      y+=vel;
   }
    
   void draw(){
     float xkoko=x%800;
     float ykoko=y%600;
       translate(xkoko,ykoko);
       rotateX(radians(x));
       box(50);
       translate(-xkoko,-ykoko);
   }
}



