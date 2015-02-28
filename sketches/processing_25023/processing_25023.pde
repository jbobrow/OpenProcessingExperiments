

int N = 20;

PVector[] points = new PVector[N];

void setup(){
  size(200,200);
  background(0);
  
  for(int i=0; i<N; i++){
    points[i] = new PVector(width/2,height/2);
  }
  
  colorMode(HSB,255);
}

void draw(){
  if(r(100)>95){
    noStroke();
    fill(0,0,0,4);
    rect(0,0,width,height);
  }
  
  stroke(abs(sin(frameCount/200.)*255),255,sin(frameCount/20.)*255,8);
  noFill();
  
  beginShape();
  for(int i=0; i<N; i++){
    vertex(points[i].x, points[i].y);
    
    points[i].x += r(11)-5;
    points[i].y += r(11)-5;
  }
  endShape();
}

int r(int n){
  return int(random(n));
}

