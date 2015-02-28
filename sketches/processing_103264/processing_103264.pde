
void setup() {
  size (200, 200);
}

void draw() {
  background(255, 255, 255); 

  if (keyPressed == true) {         //when you press a key...
    fill(13, 185, 14);
    textSize(14);
    text("Key Pressed!", 40, 100);  //this txt will appear on the screen
  }
  if (keyPressed == false){  //when you are not pressing a  key...
  fill(13, 185, 14);
    textSize(14);
    text("Key not pressed!", 40, 100);  //this message will appear
  }
}
