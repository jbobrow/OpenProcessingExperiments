
void setup(){
  size(300,300);
  background(0);
}

void draw(){
  background(0,0,175-mouseY);
  
  //candle
  fill(255,255,255);
  rect(137.5,150,25,50-mouseY);
  
  //table
  fill(150,100,0);
  stroke(0,0,0);
  rect(0,200-mouseY,300,50-mouseY);
  
  //flame
  fill(255-mouseY,231-mouseY,44-mouseY);
  noStroke();
  triangle(150,130,145,148,155,148);
  
  //wick
  stroke(255,255,255);
  line(150,145,150,150);
  
  //inverse flame
  fill(255,255,255);
  triangle(145,152,155,152,150,170);
}

