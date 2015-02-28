
float fps = 2;
int counter=0;

void setup() {
  size(250, 250);
  background(255);
  smooth();
  textFont(createFont("Arial", 32));
  frameRate(fps);
}

void draw() {
  //wonky counter timer thing that isn't working...
  int s=second();
  float t=0*s, d=map(millis()%1000, 50, 200, 200, 100);



  // random multicolored transparent circles 

  fill(random(255), random(255), random(255), 50);
  noStroke();
  pushMatrix();
  ellipse(random(width), random(height), 100, 100);
  popMatrix();


  fill(0);
  noStroke();
  text(counter, random(200),random(200));

  counter++;
}

// reset ellipses 
void keyPressed() {
  if (key==' ') {
    background(255);
    counter=0;
     
  }
}


