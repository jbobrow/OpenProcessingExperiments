
void setup() {
  size(600, 600);
  fill(255);
  background(0);
  colorMode(HSB,100);
  //5 frames a second
  frameRate(5);
  noStroke();
  smooth();
}

//t this is the angle which we will change everytime one is dr
int t=0;
void draw() {
  
  ellipse(width/2, height/2, 10, 10);
  fill(random(40)+40,80,80);
  float x = 100 * cos(radians(t));
  float y = 100 * sin(radians(t));
  
  ellipse(width/2+x, height/2+y, 10, 10);
  t+=10;
  if(mousePressed){
     background(0);
    t=0; 
  }
}


