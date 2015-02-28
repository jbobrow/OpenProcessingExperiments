

/*
Hackpact Arte Generativo 2011
Dia 7

Martin Zumaya Hernandez
*/

Wheel[] wheel;
int N = 2;
float ang = 0.1;
float R = 2;

void setup(){
  frameRate(30);
  smooth();
  colorMode(HSB);
  size(700,500);
  background(200);
  wheel = new Wheel[N];
  for( int i = 0; i <N; i++){
    wheel[i] = new Wheel();
    wheel[i].start();
  }
}

void draw(){
  
  fill(200,10);
  rect(0,0,width,height);
  
  translate(width/2,height/2);
  rotate(ang);
    
  for( int i = 0; i < N; i++){
    wheel[i].draws();
    wheel[i].w += R*sin(ang);
  }  
    
  ang += 0.1;
  
}

void keyPressed() {

  if ( key == ' ') {
    saveFrame("  #### imagen.png");
  }
}


