
// Cibles (targets) : fun coding with my son Gabriel

void setup(){
  smooth();
  background(0); 
  noStroke();
  size(500,500);
  noFill();
  frameRate(100);
}

void draw(){
  for(int a=0;a<5;a++){
    for(int b=0;b<5;b++){ 
      stroke(0,100);
      float glapu = random(2,100);
      ellipse(a*100+50 ,b*100+50 ,glapu,glapu);
      stroke(random(200,255),random(255),0, 150);
      glapu = random(2,100);
      ellipse(a*100+50 ,b*100+50 ,glapu,glapu);
    }
  }
}




