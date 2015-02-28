
float warp1y = 0;
float warp2y = 0;
float weft1x = 0;
float weft2x = 0;
float warp3y = 0;
float warp4y = 0;
float weft3x = 0;
float weft4x = 0;
float weft5x = 0;

void setup() {
  size(800, 800);
  frameRate(40);
  background(100);
}

void draw() {

//****MAIN GRID****

  //warp1 

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(width/3, warp1y, 40, 40);
  if (warp1y < height/3 ) {
    warp1y= warp1y+5;
  }
  else if (warp1y < (2 * height/3)) {
    warp1y = warp1y+15;
  }
  else {
    warp1y = warp1y+ 5;
  }
  //println(y);

  //Warp 2

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(2 * width/3, warp2y, 40, 40);
  if (warp2y < height/3 ) {
    warp2y= warp2y+15;
  }
  else if (warp2y < (2 * height/3)) {
    warp2y = warp2y+1;
  }
  else {
    warp2y = warp2y+ 5;
  }

  //Weft 1

  noStroke();
  fill (255);
  ellipse(weft1x, height/3, 40, 40);
  if (weft1x < width/3 ) {
    weft1x= weft1x +15;
  }
  else if (weft1x < (2 * width/3)) {
    weft1x = weft1x + 5;
  }
  else {
    weft1x = weft1x+ 15;
  }
  
//Weft 2  
  
  noStroke();
  fill (255);
  ellipse(weft2x, 2* height/3, 40, 40);
  if (weft2x < width/3 ) {
    weft2x= weft2x +2;
  }
  else if (weft2x < (2 * width/3)) {
    weft2x = weft2x + 10;
  }
  else {
    weft2x = weft2x+ 5;
  }  
  


//**** UPPER LEFT GRID****
 fill(255);
  noStroke();
  fill (45,149,44);
  ellipse((width/3)/3, warp1y, 20, 20);
  if (warp1y < (height/3) ) {
    warp1y= warp1y+5;
  }
  else if (warp1y < (2 * (height/3))) {
    warp1y = warp1y+15;
  }
  else {
    warp1y = warp1y+ 5;
  }

  

  //println(y);

  //Warp 2

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse((2 * width/3)/3, warp2y, 20, 20);
  if (warp2y < (height/3) ) {
    warp2y= warp2y+15;
  }
  else if (warp2y < ((2 * height/3))) {
    warp2y = warp2y+1;
  }
  else {
    warp2y = warp2y+ 5;
  }

  //Weft 1

  noStroke();
  fill (255);
  ellipse(weft1x, (height/3)/3, 20, 20);
  if (weft1x < (width/3)) {
    weft1x= weft1x +15;
  }
  else if (weft1x < ((2 * width/3))) {
    weft1x = weft1x + 5;
  }
  else {
    weft1x = weft1x+ 15;
  }
  
//Weft 2  
  
  noStroke();
  fill (255);
  ellipse(weft2x, (2* height/3)/3, 20, 20);
  if (weft2x < (width/3)) {
    weft2x= weft2x +2;
  }
  else if (weft2x < ((2 * width/3))) {
    weft2x = weft2x + 10;
  }
  else {
    weft2x = weft2x+ 5;
  }  
  


//****UPPER MIDDLE GRID****

  //warp1 

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(width/3+width/4.5, warp1y, 20, 20);
  if (warp1y < height/3 ) {
    warp1y= warp1y+5;
  }
  else if (warp1y < (2 * height/3)) {
    warp1y = warp1y+15;
  }
  else {
    warp1y = warp1y+ 5;
  }
  //println(y);

  //Warp 2

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(width/3 + width/8, warp2y, 20, 20);
 if (warp2y < height/3 ) {
    warp2y= warp2y+15;
  }
  else if (warp2y < (2 * height/3)) {
    warp2y = warp2y+1;
  }
  else {
    warp2y = warp2y+ 5;
  }
  
  //Weft 1

  noStroke();
  fill (255);
  ellipse(weft5x, height/3 + height/4, 20, 20);
  if (weft5x < width/3 + height ) {
    weft5x= weft5x +15;
  }
  else if (weft5x < (2 * width/3)) {
    weft5x = weft5x + 5;
  }
  else {
    weft5x = weft5x+ 15;
  }
  
//Weft 2  
  
  noStroke();
  fill (255);
  ellipse(weft2x, 2* height/3 + width/4, 40, 40);
  if (weft2x < width/3 ) {
    weft2x= weft2x +2;
  }
  else if (weft2x < (2 * width/3)) {
    weft2x = weft2x + 10;
  }
  else {
    weft2x = weft2x+ 5;
  }  
  
  //****UPPER RIGHT GRID****

  //warp1 

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(2*width/3 + width/9, warp1y, 20, 20);
  if (warp1y < height/3 ) {
    warp1y= warp1y+5;
  }
  else if (warp1y < (2 * height/3)) {
    warp1y = warp1y+15;
  }
  else {
    warp1y = warp1y+ 5;
  }
  //println(y);

  //Warp 2

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(2*width/3 + width/4, warp2y, 20, 20);
  if (warp2y < height/3 ) {
    warp2y= warp2y+15;
  }
  else if (warp2y < (2 * height/3)) {
    warp2y = warp2y+1;
  }
  else {
    warp2y = warp2y+ 5;
  }

  //Weft 1

  noStroke();
  fill (255);
  ellipse(weft1x, 2*height/3 + height/8, 20, 20);
  if (weft1x < width/3 + height ) {
    weft1x= weft1x +15;
  }
  else if (weft1x < (2 * width/3)) {
    weft1x = weft1x + 5;
  }
  else {
    weft1x = weft1x+ 15;
  }
  
//Weft 2  
  
  noStroke();
  fill (255);
  ellipse(weft2x, 2* height/3 + width/4, 40, 40);
  if (weft2x < width/3 ) {
    weft2x= weft2x +2;
  }
  else if (weft2x < (2 * width/3)) {
    weft2x = weft2x + 10;
  }
  else {
    weft2x = weft2x+ 5;
  }  
   //****EXTRA GRID****

  //warp3 

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(2*width/3 + width/9, warp1y, 20, 20);
  if (warp3y < height/3 ) {
    warp3y= warp1y+5;
  }
  else if (warp3y < (2 * height/3)) {
    warp3y = warp3y+15;
  }
  else {
    warp3y = warp3y+ 5;
  }
  //println(y);

  //Warp 4

  fill(255);
  noStroke();
  fill (45,149,44);
  ellipse(2*width/3 + width/4, warp2y, 20, 20);
  if (warp4y < height/3 ) {
    warp4y= warp4y+15;
  }
  else if (warp4y < (2 * height/3)) {
    warp4y = warp4y+1;
  }
  else {
    warp4y = warp4y+ 5;
  }

  //Weft 3

  noStroke();
  fill (255);
  ellipse(weft3x, height/3 + height/8, 20, 20);
  if (weft3x < width/3 + height ) {
    weft3x= weft3x +15;
  }
  else if (weft3x < (2 * width/3)) {
    weft3x = weft3x + 5;
  }
  else {
    weft3x= weft3x+ 15;
  }
  
//Weft 4  
  /*
  noStroke();
  fill (255);
  ellipse(weft4x, 2* height/3 + width/4, 40, 40);
  if (weft4x < width/3 ) {
    weft4x= weft4x +2;
  }
  else if (weft4x < (2 * width/3)) {
   weft4x = weft4x + 10;
  }
  else {
  weft4x= weft4x+ 5;
  }  
 */  
}






