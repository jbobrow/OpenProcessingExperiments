
//I wanted to play with colour a bit, so I made 4 different colour palettes with fading colours.
//I used these to draw a number of ellipses with fading colour to the centre, which are randomly
//sized and placed to look a bit like bubbles.
//To make things more interesting I then overlayed a jigsaw puzzle with some pieces missing.
//Each time the background and number of pieces/filling/shape of the pieces changes to make  a different
//but related picture.

//Define Color Palettes - 4 different colour sets with different shades in each
//Also define variables for number of palettes and colours to make things easier later on
int npalettes = 4;
int ncolours = 12;
color[] green = {#00FF1F, #29FF43, #3BFF53, #4DFF63, #62FF75, #71FF83, #9BFFA7, #AFFFB9, #C4FFCB, #D6FFDB, #EAFFED, #FFFFFF};
color[] purple = {#9C00FF, #A71CFF, #B33BFF, #BF5AFF, #C974FF, #D28BFF, #DDA7FF, #E4B9FF, #ECCEFF, #F2DEFF, #F9F0FF, #FFFFFF};
color[] blue = {#0343FF, #1C56FF, #396BFF, #5581FF, #7498FF, #8BA9FF, #A2BAFF, #B7C9FF, #CBD9FF, #E0E8FF, #F2F5FF, #FFFFFF};
color[] red = {#FF0000, #FF1F1F, #FF3636, #FF4D4D, #FF6262, #FF7E7E, #FF9090, #FFA7A7, #FFBFBF, #FFCECE, #FFEAEA, #FFFFFF};

//Create setup code block
void setup() {
  size(800,600);
  //set the background to green
  background(green[0]);
  //comment this to watch the pictures change
  //noLoop();
}

//draw function
void draw() {   
  //make randomly located circles of random but decreasing size with colour fading from edge to centre
  //make sure circle is no bigger than width of canvas
  int maxrad = width;
  //stop when circle is too small to fit all the shades of each colour
  while (maxrad > ncolours/2){
    //define center which must be somewhere on canvas
    float x = int(random(0, width));
    float y = int(random(0, height));
    //randomly define size of ellipse to be big enough to fit all colours but less than some maximum
    float rad = random(ncolours/2, maxrad);
    //decrease the maximum radius each time
    maxrad -= 3;
    //pick a random colour palette
    float r=random(0,npalettes);
    for (int i=1; i<ncolours; i++) {
      //pick next shade from colour palette depending on choice above
      if (r<1){
        fill(green[i]);
        stroke(green[i]);
      }
      else if (r<2){
        fill(purple[i]);
        stroke(purple[i]);
      }
      else if (r<3){
        fill(blue[i]);
        stroke(blue[i]);
      }
      else{
        fill(red[i]);
        stroke(red[i]);
      }
      //ellipse shrinks each time around the loop (and gets paler)
      float cur_rad = rad - i * rad / ncolours;
      ellipse(x, y, cur_rad, cur_rad);
    }
  }
  
  //make random number of jigsaw pieces - pick the number of pieces in the x direction and fix them to be square
  int npx = int(random(3,25));
  float len = width / npx;
  int npy = int(height / len);
  
  //decide whether piece should point in or out - response depends on adjacent pieces
  //so use an array to store value
  boolean[][] left = new boolean[npx+1][npy+1];
  boolean[][] right = new boolean[npx+1][npy+1];
  boolean[][] up = new boolean[npx+1][npy+1];
  boolean[][] down = new boolean[npx+1][npy+1];
  float r;
  for (int i=0;i<=npx;i++){
    for (int j=0;j<=npy;j++){
      //for first column/row we can decide, after that it depends on previous piece for left and up
      //down and right are always selected randomly
      if (i==0){
        r = random(0,1);
        if (r < 0.5){
          left[i][j]=true;}
        else{
          left[i][j]=false;}
      }
      else{
        if (right[i-1][j]){
          left[i][j]=false;}
        else{
          left[i][j]=true;}
      }
      r = random(0,1);
      if (r < 0.5){
        right[i][j]=true;}
      else{
        right[i][j]=false;}
      if (j==0){
        r = random(0,1);
        if (r < 0.5){
          up[i][j]=true;}
        else{
          up[i][j]=false;}
      }
      else{
        if (down[i][j-1]){
          up[i][j]=false;}
        else{
          up[i][j]=true;} 
      }
      r = random(0,1);
      if (r < 0.5){
        down[i][j]=true;}
      else{
        down[i][j]=false;}
    }
  }
  
  //draw jigsaw pieces across a grid with random probability of being filled
  float prob_filled=0.3;
  //always use a black outline
  stroke(#000000);
  strokeWeight(2);
  for (int i=0;i<=npx;i++){
    for (int j=0;j<=npy;j++){
      r = random(0,1);
      if (r < prob_filled){
        fill(#000000);}
      else{
        noFill();}
      //call jigsaw function shown below with shifting positions
      jigsaw_piece(i*len,j*len,len,left[i][j],right[i][j],up[i][j],down[i][j]);
    } 
  }

  
}

//draw jigsaw piece starting at x, y with size len x len
//and logicals defining whether circle pieces point in or out - if true point outwards
void jigsaw_piece(float x, float y, float len, boolean left, boolean right, boolean up, boolean down){
  
  //some variables to define shape
  float xs=0.28*len;
  float l=len/5;
  float fl=2*len/5;
  float fac=1.9;
  
  //for changing whether the pieces point outwards or inwards
  float facup, facdown, facleft, facright;
  if (up){
    facup=-fac;}
  else{
    facup=fac;}
  if (down){
    facdown=fac;}
  else{
    facdown=-fac;}
  if (left){
    facleft=-fac;}
  else{
    facleft=fac;}
  if (right){
    facright=fac;}
  else{
    facright=-fac;}

  //use the shape tool so we can fill the piece
  beginShape();
  vertex(x,y);
  vertex(x+fl,y);
  bezierVertex(x+fl-xs,y+l*facup,x+fl+xs+l,y+l*facup,x+fl+l,y);
  vertex(x+l+2*fl,y);
  vertex(x+l+2*fl,y+fl);
  bezierVertex(x+l+fl+fl+l*facright,y+fl-xs,x+l+fl+fl+l*facright,y+fl+xs+l,x+l+fl+fl,y+fl+l);
  vertex(x+l+2*fl,y+fl+l+fl);
  vertex(x+l+fl,y+fl+l+fl);
  bezierVertex(x+xs+l+fl,y+l*facdown+fl+l+fl,x-xs+fl,y+l*facdown+fl+l+fl,x+fl,y+fl+l+fl);
  vertex(x,y+l+fl+fl);
  vertex(x,y+l+fl);
  bezierVertex(x+l*facleft,y+fl+xs+l,x+l*facleft,y+fl-xs,x,y+fl);
  vertex(x,y);
  endShape();
}


