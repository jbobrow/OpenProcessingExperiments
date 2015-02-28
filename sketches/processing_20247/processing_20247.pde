
void setup(){
  size(500,500);
  frameRate(20);
  background(0);
}

float e = 0;
int i;

void draw(){

  colorMode(HSB,360,100,100);
  noStroke();  
  for(i=0; i<30;i++){
    fill(10*i,100,100,50);  
    ellipse(250 + e *cos(e),250 + e *sin(e),30,30);
    e = e + 0.1;
  }
  if(mousePressed == true){
    background(0);
    e = 1;
  } 
}

