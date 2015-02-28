
void setup(){
  size(350,350);
  background(255);
  smooth();
}

int t;

void draw(){
  for(int i = 0;i <= 150;i++){
    if(i % 2 == 0){
      noFill();
    }
    else{
      fill(0);
    }
    stroke(0,200,255);
    ellipse(width/2+i*cos(t),height/2+i*sin(t),t,t);
    t++;
    if(t > 50){
      t = 0;
    }
  }
}

