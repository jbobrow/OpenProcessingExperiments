
/*
Hackpact Arte Generativo 2011
Dia 9

Martin Zumaya Hernandez
*/

float tetha, phi;
float inc_t, inc_p;
float N = 300;
float n = 10;
float p = 2;
float ang = 0;
int T = 0;
float inc = 1;
boolean a = false;

void setup() {
  size(700, 600, P3D);
  colorMode(HSB); 
  tetha = 0;
  phi = 0;
}

void draw() {


  inc_t = N/(PI/p);
  inc_p = N/TWO_PI;   

  background(0); 
  lights();
  camera(20*cos(ang/n), 20*sin(ang/n), mouseY, 
  0.0, 0.0, 0.0, 
  0.0, 0.0, 1.0); 
  
  stroke(120+30*sin(ang), 200, 200+50*sin(ang));
  
  for ( int j = 1; j < 100; j+=5) {
    for ( int i = 0; i < N; i++) {
      float x = j*sin(tetha)*cos(phi);
      float y = j*sin(tetha)*sin(phi);
      float z = j*cos(tetha);
      draws(a,x,y,z);
      tetha += inc_t;
      phi += inc_p;
    }
  }

  tetha = 0;
  phi = 0;
  ang += 0.1;
  T += 1;
  
  if ( T % 300 == 0) {

    if( p == 4 || p == 1){
    inc *= -1;
  }

    p += inc;
    T = 0;
  }  
  
}

void draws(boolean a,float x,float y,float z){
  
  if( a == true){
   point(x, y, z);  
  }
  else{
   line(x,y,z,x-x/n,y-y/n,z-z/n);
  }
 
}

void keyPressed() {

  if ( key == ' ') {
    saveFrame("  #### imagen.png");
  }
   if ( key == 'p') {
    a = !a;
  }
}


