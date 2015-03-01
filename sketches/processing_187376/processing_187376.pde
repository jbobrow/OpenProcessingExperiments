
//declare variable
float r,g,b,rd;

void setup() {//executed only once
  //size(displayWidth,displayHeight);//window size
  size(460,480);
  frameRate(30);
}

void draw() {//repeated forever
  background(255);
  strokeWeight(0.2);
  stroke(0);
  line(width/2,0,width/2,height);
  fill(r,g,b);
  noStroke();
 
  ellipse(mouseX,mouseY,rd,rd);
 if(mousePressed){
  background(128,10);
  }
  if(mouseX > width/2){
    fill(147,255,243);
    rect(0,0,width/2,height);
  }else{
    fill(211,255,250);
    rect(width/2,0,width/2,height);
  }
}

void keyPressed(){//event function
  r = random(255);
  g = random(255);
  b = random(255);
  println(keyCode);
}
