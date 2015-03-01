
void setup(){
  size(400, 600);
  background(0, 255, 0);
}
    
    void draw(){
      //background(0, 0, 255);
      fill(0, 0, 0);
      strokeWeight(2);
      if(mousePressed){
        line( pmouseX, pmouseY, mouseX, mouseY);
        stroke(29,242,242);
        rect(mouseX, mouseY, 30, 30);
        fill(185,242,29);
        //fill(252,76,211);
        rect(mouseX+random(50), mouseY+random(50),30,30);

      }
      }
