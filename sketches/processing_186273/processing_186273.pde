

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
line(0,height/2,width,height/2);
//noStroke();
//&&:AND / ||:OR

if(mouseX<width/2&&mouseY<height/2){
  fill(255,90,100);
  rect(0,0,width/2,height/2);
}
  else if(mouseX<width/2&&mouseY>height/2){
  fill(90,100,255);
  rect(0,height/2,width/2,height/2);
} else if(mouseX>width/2&&mouseY<height/2){ 
  fill(100,255,90);
  rect(width/2,0,width/2,height/2 );}
else{fill(100,90,100);
rect(width/2,height/2,width/2,height/2);}

}
