
// Create Menu Screens using States

// state switches between screens
//=================================
int state;
color[] colors = { 
  color(255), color(0), color(128), color(255,255), color(0, 0)
};



//  SETUP
//====================================
void setup() {
  size(600, 600);
  state=0;
}

void draw() {
  
  // First state (start screen)
  //=========================================
  if ( state == 0 ) {
    background(colors[0]);
    ellipse(mouseX, mouseY, 10, 10);
  } 
  
  // Call screen1
  //==================
  if (state == 1) {
    background(colors[1]);
    ellipse(mouseX, mouseY, 10, 10);
  }
  
  //  Call screen2
  //====================
  if (state == 2) {
    background(colors[2]);
    ellipse(mouseX, mouseY, 10, 10);
  }
   if ( state > 4 ) {
    background(colors[state]);
  }
    
}


void keyPressed(){
  
  // call for screen1
  if (key == '1') {
    state =1;
  }
  // call screen2
  if (key == '2') {
    state = 2;
  }
}
  

