
float Nnoise = random(10);
float Mnoise = random(10);
float angnoise = random(10);
int N = int(1000*noise(Nnoise));
int M = int(1000*noise(Mnoise));

void setup(){
  size(500,500);
  frameRate(5);
}

void draw(){
  background(0);
  translate(width/2,height/2);
  angnoise += 0.05;
  rotate(radians(360*noise(angnoise)));
  noFill();
  strokeWeight(10);
  stroke(100);
  ellipse(0,0,10,10);
  
  Nnoise += 0.02;
  Mnoise += 0.02;
  
  N = int(1000*noise(Nnoise));
  M = int(1000*noise(Mnoise));

  for(int i=0; i < 3000; i ++){
  fill(random(255),random(255),random(255));
  noStroke();
  ellipse(0.2*i*cos(PI*i/N),0.2*i*sin(PI*i/M),2,2);
  }
}


