
// just copy code below comment after draw and this comment to your sketch , call cursor(ARROW); at begin of draw() and call buttons as you need.   code by qdiiibp
int testButtonCount = 15;
boolean[] testButtonBoolean;
void setup(){
  size(640,480);
  testButtonBoolean = new boolean [testButtonCount+10];
testButtonBoolean[2]=true;
testButtonBoolean[4]=true;
}

void draw(){
  cursor(ARROW); 
  background(0);
  drawButtons();
}

void drawButtons(){ 
for(int i=1; i < testButtonCount-5;i++){fill(255,255,255,66);if(testButtonBoolean[i])ellipse(width-33*i,height-22*i,66,44);}

for(int i=1; i < testButtonCount;i++){
if(testButtonBoolean[0]){//settings
  if (i==testButtonCount-3 && testButtonCount<24){  if(button(buttonSize*6,buttonSize*4,"More Buttons",false,mousePressed,mouseX,mouseY)){   testButtonCount++; }}
  else if (i==testButtonCount-4 && testButtonCount>8){   if(button(buttonSize*6,buttonSize*5,"Less Buttons",false,mousePressed,mouseX,mouseY))  testButtonCount--;}
  else if (i==testButtonCount-5){if(button(buttonSize*6,buttonSize*6,"Reset",false,mousePressed,mouseX,mouseY)){ testButtonCount = 15; setup();}}
  else if (i==testButtonCount-7){if(button(buttonSize*6,buttonSize*7,"Exit",false,mousePressed,mouseX,mouseY)){background(0); cursor(ARROW); exit(); return;}}
  else if (i==testButtonCount-2){ testButtonBoolean[testButtonCount] = button(buttonSize*6,buttonSize*2,"All Buttons Off",false,mousePressed,mouseX,mouseY);}
  else if (i==testButtonCount-1){ testButtonBoolean[testButtonCount-1] = button(buttonSize*6,buttonSize*3,"All Buttons On",false,mousePressed,mouseX,mouseY);}
}  
  if(i<testButtonCount-5) {testButtonBoolean[i]=button(buttonSize,buttonSize*i,"Test Ellipse "+i,testButtonBoolean[i],mousePressed,mouseX,mouseY);}
  if( testButtonBoolean[testButtonCount-1] && i<=testButtonCount-6)  testButtonBoolean[i] = true;
  if( testButtonBoolean[testButtonCount] && i<=testButtonCount-6)  testButtonBoolean[i] = false;
}
testButtonBoolean[0]=button(buttonSize*6,buttonSize*1,"Settings",testButtonBoolean[0],mousePressed,mouseX,mouseY);
}



// just copy code below comment after draw and this comment to your sketch , call cursor(ARROW); at begin of draw() and call buttons as you need.   code by qdiiibp

  int buttonSize = 24;       // buttonsize ;-)
  boolean clickable = true;  // without this user would trigger the button by pressing


boolean button( int posx,int posy, String txt, boolean buttonSwitch,boolean pressed,int pointerx,int pointery){ // boolean pressed,int pointerx,int pointery ------------> are important for usage in other windows, just use variables set to appc.mouseX/Y and appc.mousePressed in window controller handler. This is also usefull to correct mouse input if you draw the buttons to an image shown on a part of the screen.

noStroke();  
fill(255,255,255,55); rect(posx, posy,buttonSize*5,buttonSize);      //  button background, a little bigger as the button to fit buttons together to one transparent ui surface.
fill(0,0,0,55); rect(posx+3, posy+3,buttonSize*5-5,buttonSize-5);    //  button shadow
if(buttonSwitch){fill(100,255,100,255);}           //  if button is on, fill the text white and tint the button green
else { fill(255,100,100);}                           //  if button is off, fill the text black and tint the button red
if (pointerx >= posx+4 && pointerx <= posx+buttonSize*5-4 &&   pointery >= posy+4 && pointery <= posy+buttonSize-4) {                // if the pointer is over the button
  cursor(HAND); fill(255,255,100);                                                                                         // turn the cursor to a hand and fill the button orange
if(pressed){                                                // if the button is pressed
if(clickable){                                                  // if the button is clickable
clickable = false;                                              // make the button not triggerable
buttonSwitch^=true; }}   // switch the boolean
else clickable = true;}                                    // makes the button clickable again 
rect(posx+4, posy+4,buttonSize*5-8,buttonSize-8); // draw the main button rect
fill(0);
text(txt,posx+buttonSize*.4, posy+buttonSize*.7);          // draw the button text
return buttonSwitch;
}
