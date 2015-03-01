
//Sunny Sharma
//DMS 110 for function

void setup(){
  size(600,400);
}

void draw(){
  for(int i = 0; i < 40; i = i+1){
    line(30, i, 80, i);
  }
  rect(30,30,50,50);
  fill(255,0,0);
  
  for(int i = 0; i < 80; i = i+5) {
    line(30, i, 2000, i);
  }
}
