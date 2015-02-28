
//creates the number of Drops
Drops[] myDrops = new Drops [50];

void setup()  {
  size(300, 300);
  colorMode(RGB);

 
  
  for (int i = 0; i < myDrops.length; i++)  {  //setup of array of Drops
    myDrops[i] = new Drops(random(width),random(height), random(10, 25), random(25, 50));
  }
}

void draw()  {
  background(200);
  for (int i = 0; i < myDrops.length; i++)  {
    
    myDrops[i].update();
    myDrops[i].display();
  }
}
  // creates class for Drops
class Drops  {
  // Drops variables
 float x;
 float y;
 float xsize;
 float ysize;
  //constructor defines how variables are used for Drops
 Drops(float x_, float y_, float xsize_, float ysize_)  {
   x = random (width);
   y = random (height);
   xsize =  random(10, 25);
   ysize =  random(25, 50);
 }

  void update()  {
   x = x + int(random (-1, 5));  //Drops move twice as much in y axis
   y = y + int(random (-1, 10));
   if (x > height) x = 0;     //returns Drops to drawing   
   if (y > width) y = 0;
  }

  void display()  {
   fill(153, 199, 216,random(100,255));
   ellipse (x, y, xsize, ysize);
  }
} 
  

