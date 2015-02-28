
//ICE14
//Kevin Kan Copyright 2014

String [] foo = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"};
float dx;

void setup(){
  size(400,400);
  textSize(18);
  fill(255);
  textAlign(CENTER);
  dx=0;
}

void draw(){
  background(0,0,0);
  printArray(foo);
  movement();
}

void printArray(String [] anyArray){
  for (int i = 0; i < anyArray.length; i++){
    text( anyArray[i], dx, 20+i*40);
  }
  //noLoop();
}

void movement(){
  if (dx<width){
  dx+=2;
  }
  if (dx==width){
    dx=0;
  }
}

  




