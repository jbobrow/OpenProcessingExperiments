

/*
Hackpact Arte Generativo 2011
Dia 3

Martin Zumaya Hernandez
*/

Wheel[] wheel;
int N = 40;
int T = 0;
float dt = 0;

void setup(){
  smooth();
  colorMode(HSB);
  size(700,500);
  background(20);
  wheel = new Wheel[N];
  for( int i = 0; i <N; i++){
    wheel[i] = new Wheel();
  }
}

void draw(){
  
  fill(20,50);
  rect(0,0,width,height);
 
  if( T % 50 == 0){
  stroke(random(80,140),180,180);
  for( int i = 0; i < N; i++){
    wheel[i].start();
    dt = 0;
  }
  }
  
  for( int i = 0; i < N; i++){
    wheel[i].mmove(dt);
  }
  
  T += 1;
  dt += 0.1;
  
}

void keyPressed() {

  if ( key == ' ') {
    saveFrame("  #### imagen.png");
  }
}


