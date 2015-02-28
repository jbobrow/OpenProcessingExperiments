
void setup(){
  size(500,200);
  background(255);
}

int i;

void draw(){
  for(i = 0; i < 10; i++){
    ellipse(50*i + 20,100,30,30);
  }
}

