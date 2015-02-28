
int N = 6; // number of chords
float speedown = 30;

float Angles[] = new float[N];

void setup(){
  size(200,200);
  background( 255);
  frameRate(25);
  smooth();
}

void draw() {
  state( makeL());
  /* Save frames for gif animation */
//  if( (float)frameCount < 1 + TWO_PI * speedown) {
//    saveFrame( "gifani/fr-####.png");
//  } else {
//    exit();
//  }
}

float makeL(){
  return map( pow( sin( (float)frameCount/speedown), 3), -1, 1., .05, .380);
}

void state( float L) {
  /*
    Virtual circle has a Diameter == 1
    Chords length is always less that 1
    Fill in the Array of angles, starting at 0
    Each angle determines a joint.
  */
  float a = 0; // current Angle
  for( int i=0; i<N; i++){
    a += 2*asin(L * fibo(i));
    Angles[i] = a;
  }
  plot();
}

void plot(){ // draws that stuff on a particular circle sized to nicely fit the canvas
  PVector Curr, Prev;
  float a;
  background(255, 0);
  pushMatrix();
  translate( width/2, height/2);
  stroke(230); noFill(); strokeWeight(1);
  float D = .9*min(width, height);
  ellipse( 0, 0, D, D);
  line(-D/2, 0, D/2, 0);
  line(0, -D/2, 0, D/2);
  
  stroke(30,30,50); strokeWeight(2);
  Prev = new PVector(0,0);
  for( int i=0; i<N; i++){
    a = Angles[i];
    Curr = new PVector( .5*D*cos( a), -.5*D*sin( a) );
    if( i>0) line( Curr.x, Curr.y, Prev.x, Prev.y);
    Prev = Curr;
  }
  /* And now the joints circles */
  fill(255); strokeWeight(1);
  for( int i=0; i<N; i++){
    a = Angles[i];
    Curr = new PVector( .5*D*cos( a), -.5*D*sin( a) );
    ellipse( Curr.x, Curr.y, 6, 6);
  }
  popMatrix();
}

int fibo( int M){ // return Fibonacci number: 0,1,1,2,3,5,8.. Next is a sum o two previous.
  int Prev=0, Curr=1, Next=1;
  if( M<=0) return 0;
  if( M==1) return 1;
  for( int i=1; i<M; i++) {
    Next = Curr + Prev;
    Prev = Curr;
    Curr = Next;
  }
  return Next;  
}


