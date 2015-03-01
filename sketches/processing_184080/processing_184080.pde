
// N lines
int num =12;
 
float step, spacing, offSet, theta, angle, startPosition;

float xsin,xcos;

void setup() {
  size(256, 256);
   
  // Linewidth
  strokeWeight(6);
  noFill();
  // Line color
  stroke(221,221,209);
  // Spacing
  step = 22;
  startPosition = -(PI/2);
}
 
void draw() {
  background(18,18,17);
  translate(width/2, height/2);
  
  for (int i=0; i<num; i++) {
  
    spacing = i*step;
    // ofset in radians
    float offSet = (PI/4/num)*i;

    angle = (theta+offSet) % PI;

    float arcEnd = sin(angle) * TWO_PI;
     
    
    startPosition = -(PI) * (i % 2 );

    if ( i % 2 == 0 ){
         arcEnd = TWO_PI - arcEnd;
     }
    
//    arc(xsin, xcos, spacing, spacing, 0+startPosition , arcEnd+startPosition );
    
    if(angle <= (PI/2)  ) {
        arc(xsin, xcos, spacing, spacing, 0+startPosition , arcEnd+startPosition );
    }
    else {
        arc(xsin, xcos, spacing, spacing, TWO_PI-arcEnd+startPosition , TWO_PI+startPosition );
    }
  }
  // Static for center dot
  arc(0, 0, 1, 1, 0, TWO_PI);
   
   
  //animation speed
  theta += .02;
   
}
