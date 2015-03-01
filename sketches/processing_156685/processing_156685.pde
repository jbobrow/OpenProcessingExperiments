
int i=0;
void setup(){
  size(500,500);

}

void draw(){
  background(0);
  fill(0,200,90);

  do {rect(i,i, 50, 50, 10);
  i++;
}
  while(i<10);
  do {rect(width-i,i, 50, 50, 10);
  i++;
}


  while(i<10);
    fill(0,0,100);
  for(int i=0; i<10; i=i+1) {
    for(int j=0; j<10;j=j+1){
      rect(i*50,j*50,50,50,10);
      
    }
  }
}
