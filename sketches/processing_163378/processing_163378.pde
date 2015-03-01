
void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(RGB);   //set colors to Primary Colours
  counter = 0;
}
void draw() {  
 if (keyPressed == true) {
    fill(0);
  } else {
    fill(255);
  }
  rect(25, 25, 50, 50);
}
  
