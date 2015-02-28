
int repeat = 5;
boolean keypressed = false;
void setup(){
  size(400,400);
  background(240,180,180);
  stroke(32,20,80);
  fill(200,220,220);
  strokeWeight(2);
  smooth();
}
  
  void draw(){
    textSize(16);
    fill(0);
    text("press        any key", 30, 30); 
    fill(200,220,220);

  for(int r=0; r < 4; r++){
    pushMatrix();
    for(int i=0; i< repeat; i++){
       figure();
       translate(80,0);
    }
    popMatrix();
    translate(0,100);
  }  
  }
  void figure(){
    if(keypressed==false){
    triangle(10+mouseX,10+mouseY,50+mouseX,65+mouseY,30+mouseX,90+mouseY);
    }else{
      rotate(PI*1000/mouseX);
      triangle(10+mouseX,10+mouseY,50+mouseX,65+mouseY,30+mouseX,90+mouseY);
    }
  }
  
  
  void keyPressed() {
  keypressed = !keypressed;
}
