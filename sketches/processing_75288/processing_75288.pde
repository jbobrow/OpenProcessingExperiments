
boolean display;

void setup(){
  size(800,800);
  background(0);
  smooth();
  display = false;
}

void draw(){
  if(mousePressed){
    if(!display){
      display = true;
    }
  }
 
  if(display){
    fill(120,120,120);
    for(int i = 0; i <100; i++) {
    ellipse(width/2,height/2,5*i,100*i);
    fill(0);
    rect(100,100,200,300);
  }
  }
 
  fill(random(255), random(255), random(255));
  rect(random(width), random(height), random(10, 20), random(10, 20));
  fill(255);
  line(mouseX, mouseY, width/2, height/2);
}

void mouseReleased(){
 for(int i=0;i<600;i++){
   fill(random(255),random(255),random(255));
   strokeWeight(random(20));
    line(mouseX, mouseY, width/2, height/2);
   fill(123,45,57);
 } 
}
