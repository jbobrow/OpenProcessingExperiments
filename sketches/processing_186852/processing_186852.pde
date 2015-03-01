
//Nick Kreuter
//DMS 110
//2-19-15
//for function
//create single pattern line

void setup(){
  size(400,400);
}

void draw(){
  for(int i = 0; i<width/50; i = i + 1){ //initialize,condition,code,expression
  for(int j = 0; j<height/50; j = j + 1){
  noStroke();
  fill(i*50, j*50,0);
  ellipse(i*75,j*75,25,25);
  fill(255-i*50);

  }
}
}

