
int x = 200;
int y = 100;
int xspeed = 3;
int yspeed = 3;
int l = 0;
int b = 300;
float z= 150;

void setup() {
  size(800, 600);

}

void draw() {
  background(mouseX, mouseY, 255);

    if (x > width - b|| x < 0) { // left and right walls
      xspeed = -xspeed; // go the other way
      if (z>0)
      {
        z=z-10;
      }
    }
    if (y > height || y < 0) { // top and bottom walls
      yspeed = -yspeed; // go the other way 
      if (z>0)
      {
        z=z-10;
  
   }
    }
    while (l < b)
    {
      ellipse(x + l, y, z, z);
      l = l + 80;
    }
    l = 0;
        x+=xspeed; // this effectively moves them
        y+=yspeed;
}
 

    //fill(#BCBABA);

    //ellipse(x-40, y, z, z);
    //ellipse(x, y, z, z);
 
    //ellipse (x+40, y, z, z);  

   //z=z-.01;
  
  
  //x+=xspeed; // this effectively moves them
  //y+=yspeed;
 


