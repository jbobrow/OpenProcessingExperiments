
//draws TEXT with color referring to each pixel of the imate
//Functions:
// 1: case one, draws with only one character alone the string.
// 2: case two, draws with a word within the string defined.
// ENTER: show image, and erases screen
// s: save pdf
// m: save video (.mov format)

//import processing.video.*;
//MovieMaker mm;

PImage bg;
PFont font;
int x,y,counter=0,counter1 = 0,loc,s=1,dX,dY,wlength=1,fade=10;
int drawMode = 1;
color c;
boolean showbg = false;
String inputText = "Looking at my shoes, I think I'm tired. Lets go home and get some rest eh? It's getting late anyways.so ttyl";
char [] letter = new char [inputText.length()];
String [] word = splitTokens(inputText);

void setup() { 
  size(723,480);
  bg = loadImage("4.jpg");
  background(0);
  smooth();
  
  for(int i=0; i<inputText.length()-1;i++){
    letter [i] = inputText.charAt(i);
  }
  
 //  mm = new MovieMaker(this, width, height, "TypeRoad.mov",
 //                      30, MovieMaker.MOTION_JPEG_A, MovieMaker.HIGH);
}

void draw(){
//  mm.addFrame();
}


void mouseMoved(){
  dX=mouseX-pmouseX;
  dY=mouseY-pmouseY;
  s = (int)sqrt(dX*dX+dY*dY);
    font = createFont("Georgia-Italic",1+s);
    
    //cases the mouse location
    loc = mouseX+mouseY*bg.width;
    
    //finds picture color
    loadPixels();
    float r = red(bg.pixels[loc]);
    float g = green(bg.pixels[loc]);
    float b = blue(bg.pixels[loc]);
    
    //writes out letter
    fill(r,g,b);
    textFont(font);
    x=mouseX;
    y=mouseY;
    
    switch(drawMode) {
    case 1:
      // by letter
      int i = 0; 
      text(letter[counter], x+i*textWidth(letter[counter]), y);
      counter++;
      i++;
      break;
    case 2:
      // by word 
      text(word[counter1], x, y);
      counter1++;
      break;
    }
    
    //resets counters when sentence is over
   if(counter>inputText.length()-5) counter =0;  
   if(counter1>word.length-1) counter1 =0;  
   
   if(showbg){
      background(bg);
    }else{
      fill(0,fade);
      rect(0,0,width,height);
    }  
}

void keyPressed(){
  //Save PNG image
  if (key == 's' || key == 'S') saveFrame("road_##.png");
  // Save .MOV 
 // if (key == 'm') {
 //   mm.finish();
 // }
  
  if(keyCode == ENTER){
    showbg = !showbg;
    if(showbg){
      background(bg);
    }else{
      background(0);
    }  
  }
  
  if (key == '1'){
    drawMode = 1;
    println("case 1");
  }
  if (key == '2'){
   drawMode = 2;
   println("case 2");
  }
  if (keyCode == UP){
    fade++;
    println("fade: " + fade);
  }
  if (keyCode == DOWN){
    fade--;
    println("fade: " +fade);
  }
}

