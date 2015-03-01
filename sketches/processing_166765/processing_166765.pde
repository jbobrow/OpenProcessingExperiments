
void setup(){
  size(600,600);
  background(0);
  frameRate(40);
  noLoop();
}

void draw(){
    float c = map(frameCount,0,255,0,225);
    float d= random(0,30);
    float y1= random(300,450);
    float y2= random(150,300);
    for(int x=0; x<600; x+=60){
    if(frameCount <255){
    noFill();
    stroke(c,30,225-c);
    beginShape();
    vertex(x,300);
    bezierVertex(x-d-d,y1,x+d,y1,x+d,300);
    bezierVertex(x,y2,x+d,y2,x+d+d,300);
    endShape();
    }else{
      background(0);
      stroke(255,0,0);
      line(0,300,600,300);
    }
    }
    }

void mousePressed(){
  loop();
}
