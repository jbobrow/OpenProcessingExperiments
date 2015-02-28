
void setup() {
    background(0);
    smooth();
}

void draw() {

  // conditional that executes if any key is pressed down for as long as it's pressed down
  if (keyPressed) {
   // background(150);

    if (key == 'a') {
      println("you totally just pressed a");
    }
  }
}

//function that executes when any key is pressed
void keyPressed() {
  //this will execute any time you press a key—it will paint over anything else that's there
  background(150);

  //if press a, draw a circle (this will be painted over if you press another key)
  if (key == 'a') {
    println("you totally just pressed a");
    ellipse(width/2, height/2, 30, 30);
  }
  
  //press backspace (delete on a mac) to paint over the whole thing and start over
  if (keyCode == BACKSPACE) {
     background(0); 
  }
  
  
  
}


