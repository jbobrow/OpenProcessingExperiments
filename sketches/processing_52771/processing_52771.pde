
float newTime=0;

void setup(){
  size(600,600);
  smooth();
  noFill();
}

void draw(){
  background(random(250));
  float currTime=millis()-newTime;
  textSize(100);
  text(currTime*1000,0,150);
  
  ellipse(mouseX,mouseY,20,20);
  fill(random(255),random(255),random(255));
  strokeWeight(5);
  
  if(mousePressed) {
    textSize(600);
    background(random(255),random(255),random(255),60);
    for(int i=0;i<10;i++){
      ellipse(mouseX,height/9,i*(width/20), 30);
       
  textSize(300);
  text(currTime,80085,40,150);
    }
  }
}

void mouseReleased(){
  newTime=millis();
}
