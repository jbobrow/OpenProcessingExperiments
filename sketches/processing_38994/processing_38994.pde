
void setup() {
  size(400,400);
  noStroke();
  rectMode(CENTER);
}

int number = 5;

void draw() {
  background(0);
  for(int i = 0; i < number; i++) {
    randomColor();
    helper();
    float rectSize = random(80);
  for( int x=40; x<= width; x+=80){
for( int a=40; a<=width; a+=80){
rect(x,a,rectSize,rectSize);

}
}
  }
  noLoop();
}

void randomColor() {

  int randomNum = floor(random(1,4));

  if(randomNum == 1) {
    fill(255,0,0,75);
  }; 
  if(randomNum == 2) {
    fill(0,0,255,75);
  }; 
  if(randomNum == 3) {
    fill(255,250,0,75);
  };
}

void helper(){
  int helper = floor(random(1,4));
  if(helper==1){
    stroke(0,0,255);
    strokeWeight(1);
  }
  if(helper==2){
    stroke(255,250,0);
        strokeWeight(4);
  }
  if(helper==3){
    stroke(255,0,0);
        strokeWeight(2);
  }
}

