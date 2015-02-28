
void setup(){
  size(500,500);
  background(255);
}

int i;
int j;

void draw(){
  for(i = 0; i < 10; i++){
    ellipse(50*i + 20,150,30,30);
  }
  for(j = 5;j > 0;j--){
    ellipse(350,350,j*50,j*50);
  }  
}

