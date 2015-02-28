
//Ashley Muller
//N0021149
//Assignment 2


float angle;
PGraphics pg;

 int[] side1, side2, side3, side4, side5; 
 int r, g, b;

void setup(){
  size(500,500, P2D);
  background(150, 0, 0);
  stroke(255);
 // noFill();
  
  //draw 3D cube
  pg = createGraphics (width, height, P3D);
 
  side1 = new int[width];
  side3 = new int[width];
  side4 = new int[width];
  side2 = new int[height];
  side5 = new int[height];
  
 
  
   for (int x = 0; x < width; x++) {
    side1[x] = x % width;
    side3[x] = (x - 1 + width) % width;
    side4[x] = (x + 1) % width;
  }
  
  for(int y = 0; y < height; y++) {
    side2[y] = (y + 1) % height;
    side5[y] = (y + 2) % height;
  }
}
  


void draw (){
  angle = angle + 0.05;

  // Rotating wireframe sphere
  pg.beginDraw();
  pg.translate(width >> 1, height >> 1);
  pg.rotateX(sin(angle/2));
  pg.rotateY(cos(angle/2));
  pg.background(0);
  pg.stroke(128);
  pg.scale(25);
  pg.noFill();
  pg.box(4);
  pg.endDraw();
}

void keyPressed(){
  
    switch(key){
      
      case '1':
        r = 255;
        g=0;
        b=0;
        
      case '2':
        r=0;
        g=255;
        b=0;
    }
}
    


