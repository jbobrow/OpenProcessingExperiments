
int duration=10;
int percent=0;

void setup(){
  size(300,300);
  background(0);
  smooth();
  stroke(255);
  text("LOADING", width/2-100, height/2-25);
  noFill();
  rect(width/2-100, height/2-20, 200,20);
  noStroke();
}

void draw(){
  fill(0);
  rect(width/2-45, height/2-38,100,15);
  fill(255);
  text(percent+"%", width/2-40, height/2-25);
  rect(width/2-99, height/2-19, percent*2,19);
  if(frameCount%duration/2==0 && percent<100){
    percent++;
  }
  if(mousePressed==true){
   percent=0;
   fill(0);
   rect(width/2-99, height/2-19, 198,19);
  }
  println(percent);
}
