
size(250,250);
for(int j=0; j<5; j++){
  for(int i=0; i<5; i++){
    if((i+j)%2 == 0){
      noStroke();
      fill(0+(i*20)+(j*20));
    }
    else{
      noStroke();
      fill(255-(i*20)-(j*20));
    }
    rect (i*50, j*50, 50, 50);
  }
}
