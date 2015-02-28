
void setup(){
  size(300,300);
  background(255);
  frameRate(30);
}
  int x = 0;
  void draw(){
    
    if (x <= 100) {
  fill(255,0,0);
  ellipse(80,height/2,40,40);
x++;
}
  
if(x <= 151) {
 ellipse(80,height/2,40,40);
  fill(0,255,0);
  x++;
}

if(x >= 151) {
    noFill();
    rect(5,height/4,x,x);
    x++;
}

if(x>= 200) {
  stroke(1);
  line(150,height,x-100,x-100);
x++;
}

  if(x >= 300){
    fill(0);
    rect(0,0,300,300);
    rectMode(CENTER);
    rect(width/2,height/2,x-300,x-300);
    noLoop();
    x++;
}
  }




