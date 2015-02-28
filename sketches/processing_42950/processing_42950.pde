
void setup() {
  size(300, 300);
  background(0);
  fill(255);
  strokeWeight(1);
  stroke(255);
}
int saveMe = 0;
boolean reset = false; 
void mouseClicked(){
   saveMe = frameCount/3; 
}
void draw() {
  background(0);
  //int bar = frameCount
  int loaded = frameCount/3 - saveMe;
  if (loaded <= 100) {
    boolean barscreen = true;
    String loading= "LOADING " + loaded + "%";
    text(loading, 50, 100);
    noFill();
    rect(50, 120, 200, 20);
    fill(255);
    rect(50, 120, loaded*2, 20);
  }
    if (loaded > 100) {
      fill(0);
      rect(-3,-3, 303,303);
      fill(255);
      text("DONE! CLICK TO RESET", 80, 150);
  }
}



