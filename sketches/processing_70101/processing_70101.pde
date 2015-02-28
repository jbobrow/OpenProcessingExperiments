
void setup(){
  size(850,1000);
  noStroke();
}

void draw(){
  for(int i = 0; i < 20; i++){
    fill(noise(100,255),noise(100,255),noise(100,255),noise(100,250));
    if (random(10)%2==0){
      ellipse(random(width),random(height),noise(50),noise(50));
    } else {
      rect(random(width),random(height),noise(50),noise(50));
    }
  }
  for(int i = 0; i < 40; i++){
    stroke(0,0,0);
    line(i*200,0,0,i*200);
    line(0,i*200,i*150,0);
    rect(i*20,i*20,i*40,i*40);
  }
  for(int i = 0; i < 150; i++){
    ellipse(i*20,i*20,i*40,i*40);
  }
}
