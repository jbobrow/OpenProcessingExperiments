
float m = 12;


void setup(){
  size(400,400,P3D);
  background(255);
  smooth();
}

void draw(){
  background(255);
  
  translate(width/2,height/2,-50);
  
  for (int i = 0; i<60; i ++){
    stroke(i*2);
    line(-30+i,0,-30+i,300);
  }
  stroke(0);
  translate(0,0,50);
  rotateY(PI*mouseX/width);
  rotateZ(-PI*mouseY/height);
  fill(255);
  box(100);
  fill(0);
  
  pushMatrix();
  translate(20,-55,20);
  box(10);
  translate(0,0,-40);
  box(10);
  rotateX(PI/2);
  translate(-40,20,0);
  ellipse(0,0,m,12);
  popMatrix();
  
  if (mousePressed == true){
    m = 23;
  }else{
    m = 12;
  }
  
  
  
}

