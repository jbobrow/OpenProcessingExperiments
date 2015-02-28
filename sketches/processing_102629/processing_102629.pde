
float time = 0;
int elements = 50;

void setup(){
  size(512, 400);
  frameRate(25);
  colorMode(HSB, 255);  
  rectMode(CENTER);
  smooth();
  noStroke();
  background(255);
}

void draw(){
  background(0);
  translate(width*0.5, height*0.5);
  fill(255,20);
//  noFill();
  strokeWeight(2);
  time=time+0.003;
  for (int i = 0; i < elements; i++){
  stroke(i*2,255,255);
  rotate(time);
  translate(width*0.20,height*0.20);
  ellipse(0,0,2*i,2*i);
  rect(0,0,2.4*i,2*i);
  //  fill(255* noise(time*5),255,255,255);
  line(0,0,10*i,10*i);
 } 
  for (int i = 0; i > 25;){
      filter( BLUR, 10); 
  }
}


