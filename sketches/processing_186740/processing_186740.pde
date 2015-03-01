
// Tyler OCwieja
// 2-19-15
// chess board with for function


void setup(){
 size(400,400);
  background(0); 
}

void draw(){
  for( int i = 0; i < width/50; i = i + 2){  // (initialize(only valid inside function); condition; expression)
    for(int j = 0; j < height/50; j = j + 2){
    noStroke();
    fill(255);
    rect(i*50, j*50, 50, 50);
  }
  }
  for( int i = 1; i < width/50; i = i + 2){  // (initialize(only valid inside function); condition; expression)
    for(int j = 1; j < height/50; j = j + 2){
    noStroke();
    fill(255);
    rect(i*50, j*50, 50, 50);
  }
  }
}
