
//Sara Humel
//AndrewID shumel
//copyright @2012


//Change MAX to change number of circles on screen.
//Change DIAMAX to change the max size of the circles.
//Change DMAX to change the speed of the circles.

final int MAX = 500;
final int DIAMAX = 50;
final int DMAX = 10;


//Arrays

int [] x;
int [] y;
int [] dia;
int[] dx;
int [] dy;
color [] c;


void setup ( ) {
  size (400,400);
  smooth( );
  x = new int [MAX];
  y = new int [MAX];
  dia = new int [MAX];
  c = new color [MAX];
  dx = new int [MAX];
  dy = new int [MAX];
  initializeINTarray(x);
  initializeINTarray(y);
  initializeDiaArray(dia);
  initializeColorArray(c);
  initializeChangeArray(dx);
  initializeChangeArray(dy);
  }  
  
void draw ( ) {
 moveShape(x, y, dia, dx, dy, c); 
}

void initializeINTarray (int [] myArray) {
  for (int i = 0; i < myArray.length; i++) {
    myArray[i] = int(random(width)); 
  }
}

void initializeDiaArray (int [] myArray) {
  for (int i = 0; i < myArray.length; i++) {
    myArray[i] = int(random(DIAMAX)); 
  }
}

void initializeColorArray ( color [] myArray) {
  for( int i = 0; i < myArray.length; i++){
   myArray[i] = color( int(random(255)),
                       int(random(255)),
                       int(random(255)),
                       int(random(255)));
  } 
}

void initializeChangeArray (int [] myArray) {
  for (int i = 0; i < myArray.length; i++) {
    myArray[i] = int(random(1,DMAX));
  }  
}


void drawShape (int [] x, int [] y, int [] diam, color [] col) {
  for(int i = 0; i < x.length; i++){
    fill(col[i]);
    ellipse( x[i], y[i], diam[i], diam [i]);
    
  }
}


void moveShape (int [] x, int [] y, int [] diam, int [] dx, int [] dy, color [] col) {
   fill(255, 255, 255, 50);
   rect(0, 0, width, height);
   drawShape(x, y, dia, c);
   for (int i = 0; i < x.length; i++) {
     if (x[i] > width) {
         x[i] = -20;
     } else {
      x[i] = x[i] + dx[i]; 
     }
     
    if (y[i] > height) {
      y[i] = -20;
    } else {
      y[i] = y[i] + dy[i];
     }
   }
}
  
  
  

