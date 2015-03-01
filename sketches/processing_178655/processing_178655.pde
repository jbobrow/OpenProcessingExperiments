
void setup(){
  size(640, 640);
  noStroke(); 
}

void draw(){
  fill(255, 50);
  rect(0, 0, width, height);
  fill(0);
  translate(width/2, height/2);
  for(int i = 0; i < 600; i+=3){
    float n = sin(radians(i));
    float x = sin(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*9));
    float y = cos(radians(i+frameCount*(n*2)))*(i/( noise(i/12)*9));
    ellipse(x, y, noise(i)*10, noise(i)*10);
  }
}


