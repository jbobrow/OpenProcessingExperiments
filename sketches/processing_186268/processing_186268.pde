
float r,g,b,rd;
void setup(){
  size(680,480);
  frameRate(30);
}

void draw(){
  background(255);
  strokeWeight(1);
  stroke(2);
  line(width/2,0,width/2,height);
line(width/2,0,width/2,height);
noStroke();
if(mouseX<width/2){
  fill(255,90,100);
  rect(0,0,width/2,height);
}
  else{fill (80,40,100);
  rect(width/2,0,width/2,height);}

}
