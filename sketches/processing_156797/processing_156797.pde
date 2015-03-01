
int i;
int j;

void setup(){
  size(500,500);
}

void draw(){
  background(255);
  for(i=0; i<50; i++){
    for(j=0; j<50; j++){ 
    fill(random(0,255),random(0,255),random(0,255));
    rect(10+(i*10), 10+(j*10), 3, 3);
    }
  }
}
