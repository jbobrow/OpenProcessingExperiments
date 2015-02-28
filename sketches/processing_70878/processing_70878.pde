
void setup(){
  size(500,500);
  background(0);
  noStroke();
  smooth();
  
  fill(255,255,255);
  
  for(int i = 0; i <= 1000; i+=10){
    for(int j = 0; j <= 1000; j += 10){
      triangle(i+round(random(1))*10,j+round(random(1))*10,i,j+round(random(1))*10,i+round(random(1))*10,j);
      triangle(i+round(random(1))*10,j+round(random(1))*10,i+10,j+round(random(1))*10,i+round(random(1))*10,j);
      triangle(i+round(random(1))*10,j+round(random(1))*10,i,j+round(random(1))*10,i+round(random(1))*10,j+10);
    }
  }
}

void draw(){
}
