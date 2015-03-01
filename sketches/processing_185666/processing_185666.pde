
float r,g,b,rd;
int displayWidth = 640;
int displayHeight = 640;

void setup(){
  size (displayWidth,displayHeight);
  frameRate(30);
}

void draw(){
  background(255);
  strokeWeight(.2);
  stroke(0);
  noStroke();
  if(mouseY < (height/2)-100) {
    fill(255,0,0);
    rect(0,0,width,height/2);
    fill(255);
    textSize(100);
    text("STOP",width/2,height/4);
  }
  else if (mouseY>(height/2)+100){
     fill(0,255,0);
    rect(0,height/2, width,height);
    fill(255);
    textSize(100);
    text("GO", width/2, (3*height)/4);    
  }
  else{
    fill(255,255,0);
    rect(0,0, width,height);
    fill(255);
    textSize(100);
    textAlign(CENTER,CENTER);
    text("YIELD",width/2, height/2);  
  }
}
