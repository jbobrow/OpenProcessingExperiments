

FallingObject[] objects;

void setup()
{
   size(800,600,P3D); 
   
   //PImage img = loadImage("itunes.png");
   
   objects = new FallingObject[10];
   
   for(int i = 0; i < objects.length; i++)
   {
     objects[i] = new FallingObject(800, 600); // <-- insted of img i replease it with size
   }
}

int frame = 0;

void draw()
{
  background(0,0,0);
  
  for(int i = 0; i < objects.length; i++)
  {
    objects[i].move();
    objects[i].draw();
  }
}



class FallingObject{
   float x;
   float y;
   float vel;
   //float size;
  
  // FallingObject(int maxx, int maxy, float size) // <--- changed
  FallingObject(int maxx, int maxy)
   { 
     this.x = random(maxx);
     this.y = random(maxy);
    
     vel = random(5);
     //this.size = size; // <---
   }

   void move()
   {
      y +=vel;
     //x -= vel;
     // <--- this will make the falloing objects 
     // rotating on the x axis 
   }
   
   void draw()
   {
     
     float xdir = x%800;
     float ydir = y%600;
     
     translate(xdir, ydir);
     rotateX(radians(x));
     
  // background(0);
    //image(img, x%800, y%600, 60, 60); // <---
    lights();
    stroke(20,99,60);
    fill(120,190,99);
    sphere(30);
    translate(-xdir, -ydir);
    //box(x, y, size);
   }
}



