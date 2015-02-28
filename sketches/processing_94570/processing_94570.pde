
// © Julia Shen
// yuans @ andrew.cmu.edu

float [ ] x = {
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  
};
float [ ] y = {
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
  random (0, 400),
};
float [ ] z = {
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
  random (0, 200),
};


color [ ] col = {
   
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
  color( random( 255 ), random( 255 ), random( 255 ) ),
   
};

float [] deltaX= {
  random(0,10), random(0,10),
  random(0,10), random(0,10),
  random(0,10), random(0,10),
  random(0,10), random(0,10),
  random(0,10), random(0,10),
};

float [] deltaY= {
  random(0,10), random(0,10),
  random(0,10), random(0,10),
  random(0,10), random(0,10),
  random(0,10), random(0,10),
  random(0,10), random(0,10),
};



void setup()
{
  size(400, 400);
  background(255);
}

void draw()
{
  background(255);
  drawEllipse();
  moveEllipse();
  
  
}

void drawEllipse()
{

  for (int i = 0; i < x.length; i++) {
    
   noStroke(); 
   ellipse(x[i], y[i], z[i], z[i]);
   fill(col[i]);
  
  }
  
  for ( int i = 0; i < width; i += 10 )
  {
        line( i, 0, width-i, height);
        stroke(255);
        strokeWeight(1);
  } 
}

void moveEllipse()
{
  for (int i =0; i<x. length; i++)
  {
    x[i]=x[i]+deltaX[i];
    y[i]=y[i]+deltaY[i];
    
     if(x[i] > width || y[i] > height || x[i] < 0 || y[i] < 0)
    {
      deltaX[i] = -deltaX[i];
      deltaY[i] = -deltaY[i];
    }
  }
}

   





