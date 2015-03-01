
//0 means attract loop, 1 means game, 2 means game over
int state = 0;

void setup() {  //setup function called initially, only once
  size(320, 240);
  background(255,0,200);  //set background white
}

void draw() {  //draw function loops 
    if(state == 0){
        //attract loop
        background(255,0,200);
        textSize(16);
        fill(100,255,100);
        textAlign(CENTER);
        text("Press spacebar to begin",width/2,height/2);
        //"Press spacebar to begin"
    } else if(state == 1){
    //main game
    background(255,0,200);
    } else {
    //game over
    }
}

void keyPressed() {
    if(state == 0){
    //If we are in the attract loop
      if(key == ' '){
      //if they pressed spacebar, change to state 1 (the main game)
        state = 1;
      }
    } else if (state == 1) {
    } else {
    }
}
