
int numTimes = 1000;
float incSteps = 360;
float anginc = TWO_PI/incSteps;
float rad = 250;
float p = 0.5;
float q = -0.5;
float lastx=0;
float lasty=0;
float targetp = p;
float targetq = q;
float easing = 0.05;

void setup(){
  size(600, 600);
  smooth();
  stroke(250);
  //fill(200);
  noFill();
}

void draw(){
  background(0);
  noFill();
  
  p = p + (targetp-p)*easing;
  q = q + (targetq-q)*easing;
  
  drawShape();
  
//  p = map(mouseX, 0, width, -5, 5);
//  q = map(mouseY, 0, height, -5, 5);
  
  //
  fill(250);
  textAlign(LEFT);
  text("p: " + p, 10, 20);
  text("q: " + q, 10, 30);
  text("target p: " + targetp, 10, 40);
  text("target q: " + targetq, 10, 50);
  text("numTimes: " + numTimes, 10, 60);
  textAlign(CENTER);
  text("x = cos(angle) * sin(p*angle)", width/2, height-30);
  text("y = sin(angle) * cos(q*angle)", width/2, height-20);
}

void keyPressed(){
  if (key == 'q'){
    numTimes += 10;
    println(numTimes);
  } else if (key == 'z'){
    numTimes -= 10;
  }
  if (key == 'r'){
    targetp = random(-5, 5);
    targetq = random(-5, 5);
  }
  
  //drawShape();
}

void mouseMoved(){
  targetp = map(mouseX, 0, width, -5, 5);
  targetq = map(mouseY, 0, height, -5, 5);
}

void drawShape(){
  pushMatrix();
  translate(width/2, height/2);
  beginShape();
  for (int i=0; i<numTimes; i++){
    float xpos = (cos(i*anginc)) * (sin(p*i*anginc));
    float ypos = (sin(i*anginc)) * (cos(q*i*anginc));
    curveVertex(xpos*rad, ypos*rad);
    //ellipse(xpos*rad, ypos*rad, 1,1);
  }
  endShape();
  popMatrix();
}

