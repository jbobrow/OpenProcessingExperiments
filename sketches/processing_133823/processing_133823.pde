

void setup(){
  size(360,360);  
  background(0);
}

void draw(){

  colorMode(HSB);
  noStroke();
  for( int h = 0; h <=width; h+=1){
    for(int s = 0; s <= height; s += 1){
    fill(random(h), 255, 255);
    rect(s,h,1,1);
    }
  }
  
}


