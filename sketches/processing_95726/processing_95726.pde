
//hw11
//sahana kumar
//copyright 2013

float xTran, yTran, zTran, xRot, yRot, zRot;
int p;
color d,q;

int [ ] arrayX;
int [ ] arrayY;
int [ ] s;


final int MAX=50;
void setup ()
{size(400,400,P3D);
background(0);
xTran=width;
yTran=height;
zTran=height;
xRot=p;
yRot=p;
zRot=p;


arrayX = new int [MAX];
arrayY = new int [MAX];
s= new int [MAX];

d= color(232, 91, 176);
q= color(106, 199, 206);
}

void draw()
{
  rect(0,0,width, height);
  fill(0);
  drawStuff();
  moveStuff();
  drawThing(xTran, yTran, xRot, yRot, zRot, d);
  xRot++;
  yRot++;
  zRot++;
  
  initialize( arrayX, 0, width );
  initialize( arrayY, 0, height );
  initialize( s, 10, 80 );
   

}

void drawStuff()
{
  for ( int i=0;i<arrayX.length;i++)
  {
    pushMatrix();
    stroke(0);
    fill(d);
    
    translate(arrayX[i], arrayY[i], arrayX[i]);
    rotateX(radians(xRot));
    rotateY(radians(yRot));
    box(s[i]/4, s[i]/3, s[i]/10);
  popMatrix();
  }
}


void moveStuff()
{
  for( int i =0; i<arrayX.length;i++)
  {
    arrayY[i]++;
    
    if(arrayY[i] >width+s[i])
    {
      arrayY[i]=s[i];
    }
    
   else if(arrayY [i] <  -s[i])
   {
     arrayY[i] = width + s[i];
   }
  }
}

void drawThing(float xTran, float yTran, float xRot, float yRot, float zRot, color s)
{
  directionalLight(126,126,126,0,0,-1);
  ambientLight(150,150,150);
  
//sphere
  pushMatrix();
  translate(xTran/2, yTran/2, zTran/2);
  rotateY(radians(xRot*2));
  rotateX(radians(yRot));
  
  fill(s);
 
  noStroke();
  sphereDetail(4);
  sphere(xTran/20);
  
  popMatrix();
  

  //box middle
  pushMatrix();
  translate(xTran*.5, yTran*.5, zTran/2);
  rotateY(radians(xRot*2));
  rotateX(radians(yRot));
  
  fill(s);
 
  noStroke();
  sphereDetail(4);
  box(xTran/10, xTran/10, yTran/40);
  
  
  fill(q);
  popMatrix();
  

  translate(xTran/2.7, yTran/2.7, zTran/2);
  rotateY(radians(xRot*2));
  rotateX(radians(yRot));
  
  fill(q);
 
  noStroke();
  
  box(xTran*.7, xTran*.7, yTran*.7);
 
 
}

void initialize( int [ ] initial, int  min, int max ) {
   
  for ( int i = 0; i < initial.length; i++ ) {
     
    initial[i] = int( random( min, max ));
     
  }
   
}





