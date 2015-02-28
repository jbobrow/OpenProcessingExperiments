
// matrix_02 - 03/06/13
// mel tearle
//
// make changes here

int set_width  = 400;
int set_height = 400;
float set_type = 15;  // set size of type

char[] ltrs = {
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'
};

int pad  = int(set_type)+3;  //screen size to use for rows and columns positioning 
int xoff = -pad;              // x-offset_ from left of display
int num_rows = int(set_height/pad+1);   // one more for looks
int num_cols = int(set_width/pad+1);

int[] yoff = new int[num_cols];   // save y-offset in an array to stagger column heights

void setup() { 
  size(400, 400);  // size(set_width, set_height);  doesn't work in javascript
  addmore_chars();
  shuffle_yoff();
  frameRate(7);
}  // setup()

void draw() {
  background(#154B0A);  
  textSize(random(set_type-.65, set_type+1.0)); // works better here

  for (int y = num_rows; y > 0; y--) {      // going from bottom to top  

    for (int x = num_cols; x > 0; x-- ) {   // going from right to left      
      fill(#F6FA2D, int(random(4, 10))*25); 
      char c = ltrs[int(random(ltrs.length))]; 
      text(c, x*pad+xoff, y*pad+yoff[x-1]);      
      if ( int(c) > 150 || int(random(1, 8)) > 7) {   // hit it again
        fill(#F6FA2D, 255); 
        text(c, x*pad+xoff, y*pad+yoff[x-1]);   // arrays start at 0, else outof bounds err
      }  // again
    }  // for x

    //  reshuffle yoff_set array - whatever works
    if ( frameCount % 19 == 3 ) {
      shuffle_yoff();
    } 
    else if
      ( frameCount % 31 == int(random(2, 7))) {
      for (int i = 0; i < num_cols; i++ ) {   // set some columns back to zero
        if ( int(random(1,4)) > 2 ) yoff[i] = 0;
      }  // for
    }  // shuffle
  }  // for y
}  // draw()

void shuffle_yoff() {
  for (int i = 0; i < num_cols; i++) {  // save y-offset amounts
    yoff[i] = int(random(0, 7))*-2;
  }
}   // shuffle

void addmore_chars() {  // add some graphic chars
  for ( int i = 162; i < 170; i++ ) {  
    ltrs = splice(ltrs, char(i), i-161 );  // loads at front of array
  }
}  // add



