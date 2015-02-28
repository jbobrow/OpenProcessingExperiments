
void setup(){
  size (400,400);
  background(0);
  noStroke();
  rectMode(CENTER);
}
void draw(){

  if(pmouseX >0){
  if((mouseY<100)||(mouseY>300)){
    noStroke();
    fill(0,200,255);
    ellipse (mouseX,mouseY,50,50);
  }
  if((mouseY>100)&&(mouseY<300) && (dist(200,200,mouseX,mouseY)>100)){
    fill(255);
    noStroke();
    rect(mouseX,mouseY,50,50);
  }
  if(dist(200,200,mouseX,mouseY)<100){
    stroke(255,255,0);
    strokeWeight(8);
    line(pmouseX,pmouseY,mouseX,mouseY);
  }
  }
}
  void mousePressed(){
    background(255);
  }


