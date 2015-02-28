
void setup(){
  size(500,500);
  rectMode(CENTER);
  smooth();
  
  stroke(30,40);
  fill(255,100,50);
  
 stroke(255);
  rect(250,250,150,150);
}

void draw() {
  background(255);
  
  if(mousePressed){
     translate(width/2,height/2);
  for(int s=200; s>0; s=s-10) {
    fill(255,255-s,255-s);
    rotate((mouseX+mouseY)/300.0);
    rect(0,0,s,s);
  }
  
  }else{
    translate(width/2,height/2);
    for(int s=200; s>0; s=s-10) {
    stroke(0);
    fill(34,100,168);
    rotate((mouseX+mouseY)/300);
    quad(30,40,20,0,s,s,s,s);
  }
  }
}

