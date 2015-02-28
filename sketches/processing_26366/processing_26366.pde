
int s=30;
int s2=60;
int s3=90;

void setup(){
  size(500,500);
  background(0);
}

void draw(){
  rectMode(CENTER);
}

void keyPressed(){
  strokeWeight(2);
  fill(random(255),random(255),random(255),random(80,100));
  ellipse(mouseX,mouseY,random(s2,s3),random(s2,s3));
  rect(mouseX,mouseY,random(s,s2),random(s,s2));
  ellipse(mouseX,mouseY,random(s,s2),random(s,s2));
 
  if(key=='s'){
  saveFrame();
  }
  
}
