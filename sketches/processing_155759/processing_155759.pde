
float mouseColor;
void setup(){
  size(500,300);
  frameRate(30);
}
  
  void draw(){
    mouseColor=map(mouseX,0,width,0,255);
    background(mouseColor,0,0);
     stroke(255);
    fill(frameCount/2);
    rectMode(CENTER);
    rect(width/2,height/2,mouseX,mouseY);
    println(mouseX);
    println(mouseColor);
    
    if((keyPressed)&&(key=='s')){
      saveFrame();
    }
    
}

