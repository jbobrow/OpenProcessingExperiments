
Circle[] circles;
int numCircles = 45;
int maxDistance;
float dia = 400;
float angle = 0;
float move = 0;
float counter;
float moveDist;
float expandSpeed = 0.008;


void setup() {
  size(600, 600);
  smooth();
  
  // create an array and fill it with circles
  circles = new Circle[numCircles];
  
}

void draw() {
  // clear background
  background(120);
  
  counter++;
  if(moveDist > 0.3 && expandSpeed > 0){
    expandSpeed=expandSpeed*(-1);
  }
  else if(moveDist < 0.01&& expandSpeed < 0){
    expandSpeed=expandSpeed*(-1);
  }
  moveDist=moveDist+expandSpeed;
  //println( moveDist + "  " + expandSpeed );
  
  for (int i=0; i< numCircles; i++) {
    
    float waveAngle = map(i,0,numCircles,0,TWO_PI*39);
    float angle = map(i,0,numCircles,0,TWO_PI);
    float waveOffset = moveDist*sin(waveAngle)*numCircles;
    float circleOffx = cos(angle+counter)*((dia/2)+waveOffset);
    float circleOffy = sin(angle+counter)*((dia/2)+waveOffset);

    
    for(int j=0; j<6; j++)
    {
    circles[i] = new Circle(300+circleOffx,300+circleOffy, 50); 
  }}
  
  // update and display the circles
  for (int i=0; i< numCircles; i++) {
    circles[i].update(); 
    circles[i].display();
    
    if(move>0 && move<100){
    move = move+.3;
    }
    else {
      move = move-.3;
    }
    
  }

  // define maximum distance
  maxDistance = mouseX;
  
  // look of the lines
  stroke(255, 100);
  strokeWeight(0.5);

  for (int i=0; i< numCircles; i++) {
    // compare circle to other circles
    for (int j=i+1; j< numCircles; j++) {
      // draw line if distance is below 'maxDistance'
      
        line(circles[i].x, circles[i].y, circles[j].x, circles[j].y);
      
    }
  }
}

class Circle {
  float x, y, dia;

  Circle(float x, float y, float dia) {
    this.x =x;
    this.y =y;
    this.dia = dia;
  }

  void update() {
    // code for movement here
    // this is just some random displacement
    x = x;
    y = y;
    //move = move +1;
  }

  void display() {
    // code for drawing the circles
   point(x, y);
  }
}


