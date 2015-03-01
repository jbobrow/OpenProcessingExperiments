
float circleX, circleY;
float diam = 100;
float easing = 0.5;

int forLoop = 0;

void setup(){
  size(800, 800);
}

void draw(){
  background(72, 129, 242);
  float targetX = mouseX;
  float targetY = mouseY;
  
  circleX = (targetX-circleX)*easing + circleX;
  circleY = (targetY-circleY)*easing + circleX;
  
  noStroke();
  frameRate(4);
  fill(random(19, 242), random(82, 216), random(82, 114));
  ellipse(circleX, circleY, diam, diam);
  
  for(int x = 0; x < width; x++){
    float scale = 0.01;
    float noiseVal = noise((mouseX+x)*scale, frameCount*0.01);
    stroke(noiseVal*42, noiseVal*232, noiseVal*86);
    line(x, map(noiseVal, 0, 1, 0, height), x, height);
  }
}

void mousePressed(){
  if(dist(mouseX, mouseY, circleX, circleY)<diam/2){
    forLoop=1;
  }
}


