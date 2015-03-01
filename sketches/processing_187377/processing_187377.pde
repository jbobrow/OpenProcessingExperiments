
//declare variable
float r,g,b,rd;

void setup() {//executed only once
  //size(displayWidth,displayHeight);//window size
  size(460,480);
  frameRate(30);
}

void draw(){ //repeated forever
  background(255);
  strokeWeight(0.2);
  stroke(0);
  line(width/3,0, width/3, height);
  line(width/3*2,0, width/3*2, height);
  noStroke();
  if(mouseX < width/3){
   fill(147,255,243);
  rect(0,0,width/3,height);
  }else if(mouseX < width/3*2){
    fill(211,255,250);
    rect(width/3,0,width/3,height);
  }else{
     fill(6,255,227);
    rect(width/3 *2,0,width/3,height);
  }
}
