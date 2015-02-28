
void setup(){
size(500,500);
background( 255);
}

void draw(){

float run1 = random(1,4);
float ran1 = random(255);
float frameran = random(10);

for( int i = 0; i < frameran; i++ ) {
  background(250);
  strokeWeight(run1);
  stroke(ran1);
  line( random( 500 ), 0, random( 500 ), 500 ); 
  }
}
