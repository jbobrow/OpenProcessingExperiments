
void setup(){
  size(500, 500);
  noStroke();
}
void draw(){
  for(int x = 0; x <= 99; x++){
    for(int y = 0; y<= 99; y++){
      fill(int(random(0,255)));
      rect(x*5, y*5, 5,5);
    }
  } 
}

