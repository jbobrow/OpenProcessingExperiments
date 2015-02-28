
/* @pjs preload="itunes.png"; */

FallingObject[] objects;
void setup(){
   size(800,600); 
   PImage img = loadImage("itunes.png");
   objects = new FallingObject[60];
   for(int i = 0; i < objects.length; i++){
    objects[i] = new FallingObject(800, 600, img);
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
   PImage img;
  
   FallingObject(int maxx, int maxy, PImage img){
     this.x = random(maxx);
     this.y = random(maxy);
     vel = random(6);
     this.img = img;
   }

   void move(){
      y+=vel;
   }
   
   void draw(){
     image(img, x%800, y%600, 60, 60);
   }
}


