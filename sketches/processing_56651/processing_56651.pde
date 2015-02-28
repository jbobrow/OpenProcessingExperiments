
//Max Perim
//copyright 2012

int MAX = 150;

float [ ] x;
float [ ] y;
float [ ] ht;
float [ ] wd;
float [ ] speedX;
float [ ] speedY;
color [ ] col;

void setup( )

{

  size ( 600, 600 );
  noStroke();
  x = new float [ MAX ];
  initFloatArray( x, 50, width-50 );
  y = new float [ MAX ];
  initFloatArray( y, 50, height-50  );
  ht = new float [ MAX ];
  initFloatArray( ht, 0, height*.1);
  wd = new float [ MAX ];
  initFloatArray( wd, 0, width*.1 );
  speedX = new float [ MAX ];
  initFloatArray( speedX, 5, 15  ); 
  speedY = new float [ MAX ];
  initFloatArray( speedY, 5, 15  ); 
  col = new color [ MAX ];
  initColorArray( );
}

void draw() {
  prep();
  moveElements();
  drawElements();
}

void initFloatArray( float [] xArray, float low, float high) {
  for (int i=0; i < xArray.length; i++)
  {
    xArray[i] = int(random(low, high));
  }
}

void initColorArray() {
  for (int i=0; i < col.length; i++)
  {
    col[i] = color(#cdcdcd, random(20, 200));
  }
}

void moveElements() {

  for (int i = 0; i <x.length; i++) {
    x[i]+=speedX[i]/5;
    y[i]+=speedY[i]/5;
    if (x[i]>=width) {
      speedX[i]=-speedX[i];
    }
    if (x[i]<=0) {
      speedX[i]=-speedX[i];
    }
    if (y[i]>=height) {
      speedY[i]=-speedY[i];
    }
    if (y[i]<=0) {
      speedY[i]=-speedY[i];
    }
  }
}

void drawElements() {
  for (int i=0; i < MAX; i++)
  {
    fill(col[i]);
    translate(width/2, height/2);
    rotate(PI/5.0);
    rect(x[i], y[i], ht[i]-25, ht[i]-25);
  }
}

void prep( ) {

  fill( #5F4949, 10   );

  rect( 0, 0, width, height );
}

