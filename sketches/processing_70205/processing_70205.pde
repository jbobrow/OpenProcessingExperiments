
float inc;
int rad;
float x;
float y;
float x1;
float y1;
 
void setup() {
  size(500, 500);
  background(100);
  rad=120;
}
 
 
void draw() {
  translate(width/2, height/2);
  rotate(rad);
 
  for (int inc=0;inc<360;inc+=10) {//for loop to make something always happen
    float angle=radians(inc);
    x= cos(angle)*rad;
    y= sin(angle)*rad;
    x1=sin(angle)*rad;
    y1=cos(angle)*rad;
    strokeWeight(1);
    noFill();
    stroke(255,204,51,20);
    for (float ballSize=0; ballSize<120; ballSize+=50){    
    stroke(0,153,10,20);
    ellipse(x,y, y1,x1);
    }
    for (float ballSize=0; ballSize<200; ballSize+=50){
    stroke(0,51,51,20);
    ellipse(x, y, ballSize,ballSize);
    stroke(0,153,153,10);
    ellipse(x1,y1, x,y);
    
  }

}
    
  for (int inc=0; inc<360; inc+=20){
    float angle = radians(inc);
    x= cos(angle)*rad;
    y= sin(angle)*rad;
    strokeWeight(1);
    noFill();
    stroke(255,51,102,10);
    for (float ballSize=0; ballSize<250; ballSize+=60){
    stroke(0,204,204,10);
    ellipse(x,y, x1,y1);
    }
    for (float ballSize=0; ballSize<300; ballSize+=50){
    smooth();
    stroke(0,0,153,10);
    ellipse(y,x,ballSize,ballSize);
    }
    for (float ballSize=2; ballSize<280; ballSize+=20){
    stroke(0,255,255,10);
    ellipse(x,y,ballSize, ballSize);
  }
    
  }
}




