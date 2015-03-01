
int num = 75;
float theta, yStart;
float anglestep=0.0523;

void setup() {
  size(500, 500);
  noFill();
  strokeCap(SQUARE);
}

void draw() {
  background(#202020);
  translate(width/2, height/2);

  for (int i=0; i<5; i++)
   {
    pushMatrix();
    rotate( i* TWO_PI/5 );
   drawark();
    popMatrix();
   }

}

void drawark(){
  strokeWeight(2);
  stroke(#00ffff,200);
  //fill(#00ffff, 75);
  noStroke();
    
    float start = theta/2;
    float end = start + TWO_PI/5;

  for (int i=0; i<num; i++) {
    fill( 255* (sin(i)), 255* (cos(i)),  255* (sin(i)), 150);
    yStart = width/  (i);

    float offSet = TWO_PI/num*   (i);
    float sz=sin(theta+offSet*(num/10));
    float sy = cos(theta+offSet*(num/10));
     sz = map(sz,-1,1, width/num/2, width/ (i) );
     sy = map(sy,-1,1, width/num/2, width/ (i)*2 );

    pushMatrix();
    rotate(offSet);
    arc(0, yStart, sz, sy, start, end);
    popMatrix();

  }
      theta += anglestep;
}
