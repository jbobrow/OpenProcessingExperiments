
// dots fighters//
float radius = 10.0;
int X, Y;
int X1, Y1;
int delay = 20;     // jak szybko sie porusza
int Xa, Ya;

int black_x, black_y;
//boolean right=false;



void setup() {

  size( 600, 400 );

  X = width ;
  Y = width ;

  black_x=250;
  black_y=250;
}

void draw() {

  background(255);
  fill(250,0,0);
  ellipse(100,100,20,20);
  fill(0,0,0);
  ellipse(black_x,black_y,20,20);
  float v = brightness(get(mouseX,mouseY));
 

  float dx = X-black_x;
  float dy =Y-black_y;

  float dist= sqrt ((dx*dx) +(dy*dy));



  if(dist < 10) {

    X+=random(11,20);
  }

  else {
    X+=(X1-X)/delay;
    Y+=(Y1-Y)/delay;
  }


  //  dots figter destination //kurs kolka w nowym keirunku

  Xa+=(X1-Xa)/delay;
  Ya+=(Y1-Ya)/delay;

  fill(0,0,0);
  fill( 255, 0, 0,0 );   //kolor kropki w srodku -czerwony
  ellipse(X,Y,20,20);    //( X, Y, radius, radius );  radoius-kropka rosnie   
  ellipse(Xa,Ya,15,15);
}


// dots figter next destination
void mouseMoved() {
  X1 = mouseX;
  Y1 = mouseY;  
  Xa = mouseX;
  Ya = mouseY;
}




