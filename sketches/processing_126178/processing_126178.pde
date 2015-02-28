
void setup(){
  size(640,400);
  background(255);
  smooth();
}
void draw(){
  if(mousePressed){
    fill(255);
    rect(0,0,displayWidth/2,displayHeight/2);
  }else{
    fill(random(255)-50,random(255)-50,random(255)-50);
    noStroke();
    PFont myFont = createFont ("Time",30);
    textFont(myFont);
    text("*",mouseX,mouseY);
  }
}


