
void setup(){
  size(800,800);
  stroke(32,20,80);
  fill(0,255,0);
  strokeWeight(1);
  background(0);
  smooth();
}

void draw(){
  for(int j = 0; j < 10; j++){
    for(int i = 0; i < 10; i++){
      translate(i*80,j*80);
      figure();
      translate(-(i*80),-(j*80));
    }
 }
}

void figure(){
  if(mousePressed){
    stroke(255,random(100),100);
    fill(random(255),random(0),random(100));
    rect(10,10,55,55);
  }else{
    stroke(50,random(255),80);
    fill(random(255),random(255),random(255));
    rect(10,10,55,55);
  }
  
}
