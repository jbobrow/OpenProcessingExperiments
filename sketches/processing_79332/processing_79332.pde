
int rowSize = 2;
Wanderer [] wanderers = new Wanderer[rowSize * 1];
float t = 0;

PImage apple, worm;

void setup ()
{
size (480,480);
frameRate (40);
apple = loadImage ("apple.png");
worm = loadImage ("sml.png");
image (apple,0,0);
smooth();
 for(int i = 0; i < wanderers.length; i++)
  {
     wanderers[i] = new Wanderer(0.01, 800, i % rowSize, i / rowSize);
  }
}
void draw (){
   for(int i = 0; i < wanderers.length; i++)
  {
     wanderers[i].move(t);
     wanderers[i].display();
  }
  t = t + 0.009;
   
}

void mousePressed() {
  
apple = loadImage ("apple.png"); 
  float noiseOffset = random(100.);
  for(int i = 0; i < wanderers.length/3; i++)
  {
     wanderers[i] = new Wanderer(0.01, noiseOffset, i % rowSize, i / rowSize);
  }

}


class Wanderer{
  
  float noiseOffset;
  float noiseX, noiseY, transX, transY;
  float speed;
  float x, y;
  int  row, col;
  
   Wanderer(float _speed, float _noiseOffset, int _row, int _col) {
     
     speed = _speed;
     row = _row;
     col = _col;
     noiseOffset = _noiseOffset;
     //noiseX = random(200.);
     //noiseY = random(200.);
     noiseX = noiseOffset + row * 0.2;
     noiseY = noiseOffset + col * 0.2 + 1.;
     
     float interp = sin(3.);
     noiseX = noiseX + (interp * speed);
     noiseY = noiseY + (interp * speed);
     transX = noise(noiseX) * width / 2.;
     transY = noise(noiseY) * height / 2.;
   }
   
   void move(float t)
   {
       float interp = sin(t);
       noiseX += (interp * speed);
       noiseY += (interp * speed);
       x = map(noise(noiseX), 0., 1., 0, width / 2.)  - transX;
       y = map(noise(noiseY), 0., 1., 0, height / 2.) - transY;
   }
   
   void display() 
   { 
     float tx, ty;
     tx = map(row, 0, 3 , 0, width)  + 155; 
     ty = map(col, 0, 4, 0, height) + 255;
     pushMatrix();
     translate(tx, ty);
   image (worm,x,y,55,57);
     popMatrix();
     
   }
  
}



