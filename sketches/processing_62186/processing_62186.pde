
int x;
int angle;

void setup(){
  
  colorMode(HSB,360);
  rectMode(CENTER);
  size(400,400,P3D);
  noStroke();
  fill(360);
  x = 4;
  angle=18;
}

void draw(){
  
  background(360); 
  translate(200,200);
  rotateZ(radians(mouseY));
 
  for(int i=0; i<360; i++){
    fill(i*6,360,360);
   
   rotate(radians(mouseX)); 

  pushMatrix();
    rotate(radians(i*angle));
    translate(i*x,i);
    rotateX(radians(mouseY));
    box(10);
  popMatrix();  
  }
}

