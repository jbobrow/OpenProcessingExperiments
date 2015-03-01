
  int centXt=250;
  float centYt=0;
  int r = 5;
  float speed = 4;
  float vel = .5;
  float rate = speed * vel;
  
void setup(){
  size(1200,500);
  background(255);
  smooth();
}

void draw(){
 
  fill(255,25);
  //rect(0,0,width,height);
  int centX = width/2;
  int centY = height/2;
  int clr = int(random(255));
  centXt = floor(centXt+random(-4,5));

  fill(255);
  stroke(0);
  ellipse(centX, centY, r*2, r*2);
  ellipse(centXt, centYt, r*2, r*2);
  stroke(30, clr, clr);
  line(centX, centY, centXt, centYt);
  centYt += rate;
  clr = int(random(255));
  
  if (centYt > height || centYt < 0){
  
    rate *= -1;
    
  }
}
