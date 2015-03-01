
// AP Spinnning tops using arrays

float x[],y[];  //ball position
float distInc[] ;   //distance increment
float ballRadius;
float angle[];


int num;  //number of balls


void setup() {
  size(800,800);
  ellipseMode(CENTER);
  background(0);
  
  num=100;
  ballRadius=5;
  
  x=new float[num];
  y=new float[num];
  distInc=new float[num];
  angle = new float[num];

  
   for (int i=0; i < num-1; i++) {
    x[i] = random(0,width);
    y[i] = random(0,height);
   
    angle[i] = random(-2,2);
     
   // pickRandomColours();
     
    distInc[i] = random(0.1,0.4);
  }
}
  
  
  void draw() {
 
  //background(0);
  fill(0,5);
  rect(0,0,width,height);
  noStroke();
  strokeWeight(0.5);
   
  for (int i=0; i < num-1; i++) {

    fill(255,5,5);
     ellipse(x[i],y[i],ballRadius*sin(frameCount),ballRadius*sin(frameCount));

    
     // Move ball to next location
    x[i] += (distInc[i] * TWO_PI * sin(angle[i]));
    y[i] += (distInc[i] * TWO_PI * cos(angle[i]));

       // draw line between pairs of blobs
    if (i < num-2 && (int) random(50) == 0) {
      stroke (5,200,100);
      line (x[i],y[i],x[i+1],y[i+1]);
    }

    
    
    
    
     // Reverse direction on hitting horizontal screen edge
    if (x[i] <= ballRadius/2 ||
        x[i] >= width - ballRadius/2) {
      angle[i] = - angle[i];
    }
   
    // Reverse direction on hitting vertical screen edge
    if (y[i] <= ballRadius/2 ||
      y[i] >= height - ballRadius/2) {
      angle[i] = PI - angle[i];
    }

    
    
    
  }
  
  }
  
