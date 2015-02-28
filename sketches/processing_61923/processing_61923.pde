
// just copy code below comment after draw and this comment to your sketch , call createButtonImage(); on setup(), cursor(ARROW); at begin of draw() and call sliders and buttons as you need.   code by qdiiibp
float testFloatA = 10;
float testFloatB = -7.11;
int testInteger = 7;      // some test values
void setup(){
  size(640,480);
  createButtonImage();                                         // create the main "design" image of the slider, a simple gradient. You can load a image or movie or whatever
}
void draw(){ background(testFloatA*2.5); 
  cursor(ARROW);  // reset the cursor at begin of draw, else it will be a hand after pointing a slider forever.
 slider(30 ,100           ,"UI Size",sliderSize,25,45,mousePressed,mouseX,mouseY);  sliderSize=sliderResult;                 
 slider(int(30+sliderSize*5) ,100            ,"Integer 3-10",testInteger,3,10,mousePressed,mouseX,mouseY);  testInteger=round(sliderResult);                 
 slider(30              ,int(100+sliderSize*1)             ,"Background %",testFloatA,0,100,mousePressed,mouseX,mouseY);  testFloatA=sliderResult;                 
 slider(int(30+sliderSize*5)             ,int(100+sliderSize*1)             ,"Float 155-(-10)",testFloatB,155,-10,mousePressed,mouseX,mouseY);  testFloatB=sliderResult;        
 button(int(30+sliderSize*5)             ,int(100+sliderSize*2),"Exit",false            ,mousePressed,mouseX,mouseY);  if(buttonSwitch)exit();                              // set a button always false and call a function on button press
 
}






// just copy code below comment after draw and this comment to your sketch , call createButtonImage(); on setup(), cursor(ARROW); at begin of draw() and call sliders and buttons as you need.   code by qdiiibp
  PImage bimg;               // the button Image
  boolean buttonSwitch;      // will return true or false if the button is on or of
  boolean clickable = true;  // without this user would trigger the button by pressing
void createButtonImage(){     
  bimg=get(0,0,int(sliderSize),int(sliderSize));   //  copy some pixels to the image, instead createImage...bimg.beginDraw();
for (int i = 0; i < sliderSize; i++) {  for(int j = 0; j < sliderSize; j++) {    color c = color(255-j*5, 153-i*3, (i+j)*5);    bimg.set(i, j, c);  }}}     //the main "design" of the button, a gradient. You can load a image or movie or whatever
void button( int posx,int posy, String txt, boolean buttonbool,boolean pressed,int pointerx,int pointery){ // boolean pressed,int pointerx,int pointery ------------> are important for usage in other windows, just use variables set to appc.mouseX/Y and appc.mousePressed in window controller handler. This is also usefull to correct mouse input if you draw the buttons to an image shown on a part of the screen.
noStroke();  buttonSwitch = buttonbool;
fill(255,255,255,55); rect(posx, posy,sliderSize*5,sliderSize);      //  button background, a little bigger as the button to fit buttons together to one transparent ui surface.
fill(0,0,0,55); rect(posx+3, posy+3,sliderSize*5-5,sliderSize-5);    //  button shadow
if(buttonSwitch){fill(255,255,255,255);tint(0,255,0,255);}           //  if button is on, fill the text white and tint the button green
else {fill(0,0,0,255); tint(255,0,0,255);}                           //  if button is off, fill the text black and tint the button red
if (pointerx >= posx+4 && pointerx <= posx+sliderSize*5-4 &&   pointery >= posy+4 && pointery <= posy+sliderSize-4) {                // if the pointer is over the button
  cursor(HAND); tint(255,255,0,255);                                                                                         // turn the cursor to a hand and fill the button orange
if(pressed){                                                // if the button is pressed
if(clickable){                                                  // if the button is clickable
clickable = false;                                              // make the button not triggerable
if(buttonSwitch)buttonSwitch=false;else buttonSwitch=true; }}   // switch the boolean
else clickable = true;}                                    // makes the button clickable again 
image(bimg,posx+4, posy+4,sliderSize*5-8,sliderSize-8);    // draw the main button image
text(txt,posx+sliderSize*.4, posy+sliderSize*.7);          // draw the button text
}

  float sliderResult;      // will return the result of the slider
  float sliderSize = 35;       // slidersize ;-)


void slider( int posx,int posy, String txt, float sliderlfoat, float sliderMin,  float sliderMax, boolean pressed,int pointerx,int pointery){ // boolean pressed,int pointerx,int pointery ------------> are important for usage in other windows, just use variables set to appc.mouseX/Y and appc.mousePressed in window controller handler. This is also usefull to correct mouse input if you draw the sliders to an image shown on a part of the screen.
noStroke();  sliderResult = sliderlfoat;
fill(255,255,255,55); rect(posx, posy,sliderSize*5,sliderSize);      //  slider background, a little bigger as the slider to fit sliders together to one transparent ui surface.
fill(0,0,0,55); rect(posx+3, posy+3,sliderSize*5-5,sliderSize-5);    //  slider shadow
tint(255-sliderResult*2.5,sliderResult*2.5,0,255);
fill(sliderResult*1+155,255-sliderResult*1,111,255);
if (pointerx >= posx+4 && pointerx <= posx+sliderSize*5-4 &&   pointery >= posy+4 && pointery <= posy+sliderSize-4) {                // if the pointer is over the slider
  cursor(HAND); tint(255,255,0,255);                                                                                         // turn the cursor to a hand and fill the slider orange
if(pressed){                                                // if the slider is pressed
sliderResult=map(mouseX,posx+4,posx+sliderSize*5-4,sliderMin,sliderMax);
}   }                             
image(bimg,posx+4, posy+4,sliderSize*5-8,sliderSize-8); 
float bviz = map(sliderResult,sliderMin,sliderMax,0,(sliderSize*5)-8);
tint(sliderResult*2.5,255-sliderResult*2.5,0,255);
image(bimg,posx+4, posy+4,bviz,sliderSize-8);    // draw the main slider image
text(txt + " :  " + sliderResult,posx+sliderSize*.4, posy+sliderSize*.7);          // draw the slider text
}
