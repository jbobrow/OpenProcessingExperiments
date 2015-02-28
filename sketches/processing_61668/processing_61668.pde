
PVector position, accel, velo;
float x1,y1;
int w1,h1;
int radius = 20;
boolean loop = true;
void setup(){
  size(600,600);
  position = new PVector((int)(width/2),(int)(height/2));
  velo = new PVector(0,0);
  accel = new PVector(0,.15);
 
}
void draw(){
   background(0);
   fill(255);
   ellipseMode(CENTER);
   ellipse(position.x,position.y, radius, radius);
   velo.add(accel);
   position.add(velo);
   if ( position.x + radius >= width ) {
     velo.x = -velo.x;
   }
   if ( position.x - radius <= 0 ) {
    velo.x = -velo.x;
   }
   if ( position.y - radius <= 0) {
     velo.y = velo.y;
   }
   rect(width/2 - 50, 590, 100, 15);
   if(position.x < 0 || position.x > width)
     velo.x = -velo.x;
   
   if(position.y > height)
     velo.y = -velo.y;
   else
     velo.y += .5;
}
