
/*
Taller de Programacion
Tarea #2
Diseño Fibonachi
*/

/*
Manfred Bucher
*/

static float fib = .75;
int side = 600;
int count = 10;

void setup(){
  int h = side;
  int w = int( side + side * fib );
  size(w,h);
}

void draw(){
  background(0);
  rec_fibSquare(count);
}

void rec_fibSquare(int i){
  if( i==0){ return; } 
  noStroke();
  fill(255 - (255/count)*i);
  rect(0,0,side,side);
  noFill();
  stroke(random(255),random(255),random(255));
  arc(side,0,2*side,2*side,HALF_PI,PI);
  translate(side,0);
  rotate(-HALF_PI);
  translate(-side,0);
  scale( fib );
  rec_fibSquare(i-1);
}

