
//Eden Weingart
// CMU Processing 2013
// HW 9
// October 24, 2013

final int NUMA = 20;
final int NUMB = 10;

float [ ] carArrayX = new float [ NUMA ];
float [ ] carArrayY = new float [ NUMA ];
float [ ] carArrayZ = new float [ NUMA ];

float [ ] truckArrayX = new float [ NUMB ];
float [ ] truckArrayY = new float [ NUMB ];
float [ ] truckArrayZ = new float [ NUMB ];


float dx, dy, camX, camY, camZ;
float ddx, ddy;

color blue, red;


void setup ()
{
  size (displayWidth, displayHeight, P3D);
  
  background (200);
  dx = width/2;
  dy = height/2;
  ddx = 0; 
  ddy = 0;
  blue = color(0, 0, 255);
  red = color(234,43,71);
  
  initArrays ( carArrayX, carArrayY, carArrayZ);
  initArrays ( truckArrayX, truckArrayY, truckArrayZ);
  
  camX = 10.0;
  camY = 10.0;
}

void draw ()
{
  rect (width/2, height/2, width, height);
  background ( 255 );  
  directionalLight(51, 102, 126, -1, 0, 0);
  drawFigs( truckArrayX, truckArrayY, truckArrayZ, blue);
  drawFigs2 ( carArrayX, carArrayY, carArrayZ, red);
  movFigs( truckArrayX, truckArrayY, truckArrayZ);
  movFigs ( carArrayX, carArrayY, carArrayZ);

}

void initArrays ( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ)
{
  for (int i = 0; i < arrayX.length; i++)
  {
    float x = floor((random(-3500, width+800))/600)*600;
    for (int j=0; j < i; j++)
    {
      if ( x == arrayX[j]) 
      {
        x = floor((random(-3500, width+800))/600)*600;
        j=0;
      }
    }
  }
    
  for (int i = 0; i < arrayY.length; i++)
   {
     float y = floor((random(height-500, height-550))/140)*140;
     for (int j=0; j < i; j++)
     {
       if ( y == arrayY[j])
       {
         y = floor((random(height-500, height-550))/100)*100;
         j=0;
     }
    }
   } 
   for (int i =0; i < arrayZ.length; i++)
   {
     float z = floor((random (-2000, 100))/100)*100;
     for (int j=0; j < i; j++)
     {
       if ( z == arrayZ[j])
       {
         z = floor((random (-2000, 100))/100)*100;
         j=0;
       }
     } 
   
   
    
    arrayX [ i ] = floor((random(-3500, width+800))/600)*600;
    arrayY [ i ] = floor((random(height-500, height-550))/140)*140;
    arrayZ [ i ] = floor((random (-2000, 100))/100)*100;
  }
}



void drawFigs ( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ, color col )
{
  fill(col);
  stroke (255);
  strokeWeight(2);
  fill ( 75, 96, 116);
  pushMatrix();
  translate (0, 600, 0);
  box ( 40000, 2, 10000);
  popMatrix();
  stroke (39);
  fill (0, 255, 0);
  
  for( int i = 0; i < arrayX.length; i++)
  {
    camera(camX, camY, 120, 50.0, 50.0, 0.0, 
       0.0, 1.0, 0.0);
    fill (36);
    stroke(230);
    pushMatrix();
      translate ( arrayX [ i ]-width*.05, arrayY [ i ]+width*.035, arrayZ[ i ]+width*.035);
      rotate ( radians (frameCount*5) );
      sphereDetail(4);
      sphere ( 20);
    popMatrix();
    pushMatrix();
      translate ( arrayX [ i ]-width*.01, arrayY [ i ]+width*.035, arrayZ[ i ]+width*.035);
      rotate ( radians (frameCount*5) );
      sphereDetail(4);
      sphere ( 20);
    popMatrix();
    pushMatrix();
      translate ( arrayX [ i ]-width*.09, arrayY [ i ]+width*.035, arrayZ[ i ]+width*.035);
      rotate ( radians (frameCount*5) );
      sphereDetail(4);
      sphere ( 20);
    popMatrix();
    pushMatrix();
      translate ( arrayX [ i ]+width*.1, arrayY [ i ]+width*.035, arrayZ[ i ]+width*.035);
      rotate ( radians (frameCount*5) );
      sphereDetail(4);
      sphere ( 20);
    popMatrix();
    fill (234, 191, 45);
    pushMatrix();
      translate (arrayX [i], arrayY [i], arrayZ[ i ]);
      box (300, 100, 105);
    popMatrix();
    fill (36);
     pushMatrix();
      translate (arrayX [i]+width*.115, arrayY [i]+width*.016, arrayZ[ i ]);
      box (60);
    popMatrix();
  
  
  }

}

void drawFigs2 ( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ, color col )
{
  lights();
  stroke (255);
  strokeWeight(2);
  for( int i = 0; i < arrayX.length; i++)
  {
    fill(234, 43, 71);
    pushMatrix();
      translate (arrayX [i], arrayY [i]+width*.015, arrayZ[ i ]);
      box (160, 50, 100);
    popMatrix();
    pushMatrix();
      translate (arrayX [i], arrayY [i]-width*.010, arrayZ[ i ]);
      box (70, 20, 100);
    popMatrix();
    fill(36);
    pushMatrix();
      translate ( arrayX [ i ]+width*.03, arrayY [ i ]+width*.035, arrayZ[ i ]+width*.035);
      rotate ( radians (frameCount*5) );
      sphereDetail(4);
      sphere ( 20);
    popMatrix();
    pushMatrix();
      translate ( arrayX [ i ]-width*.03, arrayY [ i ]+width*.035, arrayZ[ i ]+width*.035);
      rotate ( radians (frameCount*5) );
      sphereDetail(4);
      sphere ( 20);
    popMatrix();
  
  
  }

}


void movFigs ( float [ ] arrayX, float [ ] arrayY, float [ ] arrayZ )
{
  for (int i = 0; i < arrayX.length; i++)
  {
    arrayX[ i ] += 5 +1;
    if ( arrayX [ i ] > width+800 )
    {
      arrayX [ i ] = arrayZ [i];
    }
  
  
  }

}

void keyPressed()
{
  if (keyCode == UP) camY+=3;
 
  if (keyCode == DOWN) camY-=3; 
  
  else if (keyCode == RIGHT) camX-=3;
  
  else if (keyCode == LEFT) camX+=3;

}
 


