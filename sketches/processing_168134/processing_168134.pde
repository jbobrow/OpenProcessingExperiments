
float theta, tTheta;
float Q;
float krT, r, R;
float h;
int gridX=20;
int gridY=20;
float nX=0, nY=0, nZ=1;  
float x, y, z;
float xR=radians(270);



void setup()
{
  size(1000, 1000, P3D);
  frameRate(5);
  noCursor();
}

float dotProduct(float x1, float y1, float z1, float x2, float y2, float z2)
{
  return x1*x2+ y1*y2+ z1*z2;
}

void draw()
{ 
  background(0);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  rotateX(xR);
  translate(width/2, height/2, 200);

 

//CENTER CYLIDER
  beginShape((keyPressed)?QUADS:QUAD_STRIP);
  for (z=0; z<=600; z+=60) {
    if (keyPressed) {
      background(303,10,94,100 );
      krT=random(20, 200);
      fill(random(60), 50, 100, 50);
    } else {
      krT=0;
      fill(255, random(50));
    }
    R=random(100, 150)+krT;
    tTheta=random(1,2)*15;
    for (theta=0; theta<=360; theta+=tTheta) {
      Q= radians(theta);
      x=R*cos(Q);
      y=R*sin(Q);
      vertex(x, y, z);
      vertex(x, y, z+60);
    }
    vertex(R, 0, z);
    vertex(R, 0, z+60);

    endShape( );
  }

//LIGHT GRID AND LINE
  if (keyPressed) {
    for (h=0; h<=600; h+=0.85) {
      theta+=1;
      r=280;
      Q=radians(theta);
      x=r*cos(Q);
      y=r*sin(Q);
      z=h;
      stroke(0,0,100,100);
      strokeWeight(10);
      point(x, y, z);
    }
    if (theta>360) {
      theta=0;
    }
  } else if(mouseX<900){



    for (y=-height; y<3*height; y+=gridY) {
      for (x=-width; x<2*width; x+= gridX) {

        float lx=mouseX-x;
        float ly=mouseY-y;
        float lz=100;

        float lMag=sqrt(lx*lx+ly*ly+lz*lz);
        lx/=lMag;
        ly/=lMag;
        lz/=lMag;

        float cosine = dotProduct(nX, nY, nZ, lx, ly, lz);

        fill(300, 25, 100*cosine,120);

        beginShape(QUAD);
        vertex(x-400, -y, 600);
        vertex(x-400, -y+20, 600);
        vertex(x-380, -y+20, 600);
        vertex(x-380, -y, 600);
        endShape( );
      }
    }
  }
}



