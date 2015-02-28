
int counter;

void setup() {  //setup function called initially, only once
  size(500, 250);
 //set background whit
  noStroke();
  frameRate(30);
  noCursor();
  }

void draw() {  //draw function loops 
background(0); 
int s=millis();
int twopo=sin(s/1000)*250;
    fill(255);
  rect(20,mouseY,10,60);
    rect(480,twopo,10,60);
    println(twopo);
  }
