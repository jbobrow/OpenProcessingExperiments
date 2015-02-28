

int  q;  // Quant of time
int  k;  // copy of q

float y=0;
int nechto = 45;

void setup() {
  size(300, 600);
  colorMode(HSB, 360, 100, 100, 100);
  frameRate(20);
}

void draw() {
  draw_background ( );
  q=get_quantum ();
  wave( q );
  wave_white( q );
  // now produce the second Wave
  q=(q+25)%50;
  wave( q );
  wave_white( q );  
  
}

//////////// USER's //////////////////////

//----------wave------------
void wave( int q)            // Y = A1*Q+B1
{ int  i,w=10;  // w=10 - Number of sinuses
  float  x,dy;
  float  a1 = 6;            // amplifying coefficient
  float  b1 = height/4+a1;  // shift (bias) = constant part
  k = q;   
  // total time of living = 50 quantums, after 45 quantums the Wave turns back
  if ( q > nechto ) {  k = nechto - (q-nechto);  }

  for ( i= 1, a1=6; i< 10; i++, a1+=0.4 )
  { y = a1*k+b1;
    strokeWeight(1);
    stroke(int(random(180, 220)), 60, 55, 200);
    //line(0, y, width, y);
    for ( x=0; x<width; x+=0.1)
    {
      dy = sin(x/w)/20;
      y+=dy;
      line(x, y, x, y);
    }
    
  }
}
/////////////////////////////////////////////
void wave_white(int q)
{ int  i,w=10;
  float  x,dy;
  float  a1 = 6.3;
  float  b1 = height/4+5;
  if ( q>5)    // from step #5 wave became visible
  {  k = q;
     if ( q > nechto ) {  k = nechto - (q-nechto);  }

  for ( i= 1, a1=6.3; i< 10; i++, a1+=0.47 )
  { y = a1*k+b1-i*3;
    strokeWeight(1); // proportional to q but not little then 1
    stroke(0, 0, 255);  // brightness increases with time
  //  line(0, y, width, y);
    for ( x=0; x<width; x+=0.1)
    {
      dy = sin(x/w)/20;
      y+=dy;
      line(x, y, x, y);
    }
  }
  }
}
////////////////////////////////////////////
void draw_background ( )
{
  strokeWeight(1);

  //------------sky--------

  for (int y=0; y<height/2; y++) {
    float col= map(y, 0, height/2, 50, 0);
    stroke(191, col, 90);
    line(0, y, width, y);
  }
  //--------sand----------

  for (int y=height/2; y<height; y++) {
    float col= map(y, 400, height, 0, 50);
    stroke(47, col, 90);
    line(0, y, width, y);
  }
  //-------ocean-stable------
  for (int y=height/4; y<height/2; y++) {
    float col1= map(y, height/4, height/2, 20, 100);
    stroke(167, 37, 75, col1);
    line(0, y, width, y);
  }

  for (int y=height/2; y<height*3/4; y++) {
    float col1= map(y, height/2, height*3/4, 100, 20);
    stroke(167, 37, 75, col1);
    line(0, y, width, y);
  }
}
////////////////////////////////////////////
void delay_ms (int ms)
{ 
  int tmp=millis();
  while ( (millis ()-tmp)<ms) {
  }
}
////////////////////////////////////////////
int  get_quantum ( )
{ 
  int tmp=millis();
  tmp=tmp/150;  // get one tenth of second
  tmp=tmp%50;    // 5 seconds total time of living (TOL)
//  println (tmp);
  return tmp;
}


