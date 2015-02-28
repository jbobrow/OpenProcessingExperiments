

float[] middle;
float [] compound; // array
float volume = 0.02; // The volume will be connected with "noise" and this will determine the vibration
int units = 19; // amount
float inc = 0; // going to be addded in the noise formula in order to create movement

void setup () {
  size(500,500);
  noStroke();
  smooth();
  fill(0);
  compound = new float [500]; //500 arrays // I tried different numbers but 500 units fill the whole screen diagonally

  }
  
  void draw () {
    background (35,100,100);
    for (int j=0; j < units; j++) { // loop to create more units (lines)
      
      for (int lin = 0; lin < compound.length; lin++) { // created lin loop which will be seen/explained shortly
      
       
        inc= inc - 0.9; // adding -0.9 to inc in order to animate lines to move when attached to the forumale below// the increment is added to the (lin loop) and multiplied by the volume which is (0.02)
        compound[lin] = noise((inc+lin)*volume);  // forumale //  inc(0)-0.9(being added) + line whichi is essentially (500) x 0.02 (volume) =  vibrational effect we just need to plug it into the rect, took me a while of guessing and looking over the code//examining different codes till i finally got it and fully understood how it works, interesting challenge
        //noise is a new function I learnt, it allows the line to vibrate allowing background noise to accure
        // distorts the lines and allowes them to animate and vibrate in a rought pattern
        fill(200,100,200); // color of rect
        ellipse (lin, height + (compound[lin]*mouseY) -lin, j, j);
        // animated it on the Y axis, when the mouse moves on the Length the line gets distorted, 
        // this works because, the height is added to the (compound) formula explained above, and multiplied by MOUSEY (length) and subtracted by lin which brings the line in the center of screen b/c it reverses lin which is -500 across the screen
     
       }
    }
}

