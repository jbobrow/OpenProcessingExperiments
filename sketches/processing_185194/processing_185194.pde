
void setup(){
  size (500,500);
  background(255);}
  
void draw() {
  rectMode(CENTER);
  for(int x = 5; x<height; x= x+30) {
  for(int y = 5; y<width; y=y+30){
    fill(x,x,x)
    rect(x,y,15,15);
  }
  }
}



