
int x;
int angle;

void setup(){
  
  colorMode(HSB,360);
  size(400,400);
  noStroke();
  fill(360);
  x=4;
  angle=18;
}

void draw(){
  
   
  translate(200,200);
 
  for(int i=0; i<360; i++){
    fill(i*10,200,360);
   

  pushMatrix();
    rotate(radians(i*angle));
    translate(i*x,i);
     rotate(radians(mouseX));
    rect(0,0,10,10);
  popMatrix();  
  }
}

