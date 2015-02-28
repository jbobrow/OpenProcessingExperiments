
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/138723*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/138333*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/137099*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/136836*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/136404*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
int startingHue=172;
int endingHue=120;
int randomNum;
int randomHue;
int colorDiff;//difference between hues


int startingHue2=15;
int endingHue2=6;
int randomNum2;
int randomHue2;
int colorDiff2;

int startingHue3=358;
int endingHue3=279;
int randomNum3;
int randomHue3;
int colorDiff3;

float a;
float b;
float c;
float d;
float e;
float f;

int whichOne=0;

boolean buttonToggleOne=true;

boolean saveComposition=false;
boolean resetDrawing=false;
boolean fadeDrawing=false;

boolean makeFirstTriangle=true;




void setup() {
  size(800, 600);
  colorMode(HSB, 360, 100, 100);

  colorDiff= startingHue - endingHue;
  colorDiff2=startingHue2-endingHue2;
  colorDiff3=startingHue3-endingHue3;
  drawBackground();
  
}

void draw() {
  //calls function to draw border
drawBorder();

  //calls function to draw buttons
drawButtons();
}


void mouseClicked() {
if(mouseX>25&&mouseY<775&&mouseY>23&&mouseY<550){
  //boolean conditional- draws triangle and then makes the statement false  
  if(makeFirstTriangle) {
    drawFirstTriangle();  
  }
  else {
   //if the statement is false, then draw these functions
    if (buttonToggleOne){
    drawTriangle();
    }else{
    drawTriangle2();
    }
  }
}
  
  //boolean conditional-switches triangles
    if(mouseX < 60 && mouseY > 550 && mouseY < 600){
    buttonToggleOne=!buttonToggleOne;
    
  }
  
 //boolean conditional-draws low opacity layer
  if(mouseX>70 && mouseX<150 && mouseY > 550 && mouseY < 600){
   fadeDrawing=true;
   drawRectangle();
  }
  
 //boolean conditional-resets drawing by drawing background
   if(mouseX>610 && mouseX<650 && mouseY > 550 && mouseY < 600){
   resetDrawing=true;
   drawBackgroundAgain();
  }
  
 //boolean conditional-saves drawing
   if(mouseX>710 && mouseX<780 && mouseY > 550 && mouseY < 600){
   saveComposition=true;
   saveDrawing();
  }
  
}


//rotates color range 
void pickColor() {
  if (whichOne==0) {
    pickRandomHue();
  }
  else if (whichOne==1) {
   pickRandomHue2();
  }
  else if (whichOne==2) {
    pickRandomHue3();
  }


  whichOne++;
  if (whichOne>2) {
    whichOne=0;
  }
}


//draws first triangle to start composition
void  drawFirstTriangle() {
  
makeFirstTriangle=false;
  noStroke();
 fill(randomHue, 65, 86, random(7, 200));
 
  a=mouseX+random(-30, 30);
  b=mouseY+random(-30, 30);
  c=mouseX+random(100);
  d=mouseY+random(100);
  e=mouseX;
  f=mouseY;


 triangle(a, b, c, d, e, f);
 
  //chooses random color range
  pickColor();
}


//draws triangle connecting at 2 points
void drawTriangle() {

  noStroke();
  fill(randomHue, 90, 75, random(7, 200));

  triangle(e, f, mouseX, mouseY, c, d);
  c=e;
  d=f;
  e=mouseX;
  f=mouseY;

  //chooses random color range
  pickColor();
}

//draws triangle connected at 2 different points
void drawTriangle2() {

  noStroke();
  fill(randomHue, 72, 99, random(7, 200));

  triangle(a, b, mouseX, mouseY, e, f); 
  e=a;
  f=b;
  a=mouseX;
  b=mouseY;
  
  pickColor();
}


//blue range
void pickRandomHue() {
  randomNum= floor(random(colorDiff));
  randomHue= randomNum + startingHue;
}


//red range
void pickRandomHue2() {
  randomNum2= floor(random(colorDiff2));
  randomHue= randomNum2 + startingHue2;
}


//red/purple range
void pickRandomHue3() {
  randomNum3= floor(random(colorDiff3));
  randomHue= randomNum3 + startingHue3;
}


//draws border
void drawBorder() {
  fill(255, 0, 99);
  noStroke();
  rectMode(CORNER);
  rect(0, 550, width, height/6);
  rect(0, 0, width/30, height);
  rect(775, 0, width/30, height);
  rect(0, 0, width, height/25);
}


//draws bottom control button
void drawButtons() {

  fill(0, 0, 85);//far left button
  triangle(50, 565, 40, 585, 60, 585);
  
  textSize(15);//reset
  fill(0,0,70);
  text("FADE", 100, 580);

  textSize(15);//reset
  fill(0,0,70);
  text("RESET", 610, 580);

  textSize(15); //save
  fill(0, 0, 70);
  text("SAVE", 710, 580);
}

void drawRectangle(){
  rectMode(CORNER);
  fill(29, 6, 94,20);
  rect(0,0,width,height);
}

void drawBackground(){
    background(29, 6, 94);
  for (int y= 0; y<height; y+=3) {
    for (int x=0; x<width; x+=4) {
      line(x, y, x, y);
      stroke(29, 31, 61, 50);
    }
  }
  for (int y= 0; y<height; y+=2) {
    for (int x=0; x<width; x+=3) {
      line(x, y, x, y);
      stroke(29, 31, 61, 50);
    }
  }
}

void drawBackgroundAgain(){
  makeFirstTriangle=true;
  rectMode(CORNER);
  fill(29, 6, 94);
  rect(0,0,width,height);  for (int y= 0; y<height; y+=3) {
    for (int x=0; x<width; x+=4) {
      line(x, y, x, y);
      stroke(29, 31, 61, 50);
    }
  }
  for (int y= 0; y<height; y+=2) {
    for (int x=0; x<width; x+=3) {
      line(x, y, x, y);
      stroke(29, 31, 61, 50);
    }
  }
}

void saveDrawing() {
  fill(255, 0, 99);
  noStroke();
  rect(0, 550, width, height/6);
saveFrame("images/triangles-###.png"); //when running on the web it will put the PNG in a new browser tab

}

//noLoop
//Loop



