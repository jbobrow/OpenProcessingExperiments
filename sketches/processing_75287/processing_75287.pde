
int colorDir;
int myColor;

void setup(){
  size(1000, 700);
  smooth();
  colorMode (HSB,360,100,100,100);
  background(120, 200, 205,78);
  myColor=0;
  colorDir=myColor++;
}


void draw(){
  stroke(255,34,120);
  fill(234,230,12);
  rect(300, 300, 55, 72);
  
  fill(100,255,0);
  ellipse(mouseX,mouseY/2,80,90);
  
  if(mouseY>500){
    background(255);
  }
  for(int i = 0; i < 900; i++){
    rect(random(1000), random(700), i*5, i*random(10));
  }
}
