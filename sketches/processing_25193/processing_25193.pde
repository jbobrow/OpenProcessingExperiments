
//draws TEXT with color referring to each pixel of the image.
//Functions:
// 1: case one, draws with only one character alone the string.
// 2: case two, draws with a word within the string defined.
// s: save pdf
 


 
PImage bg;
PFont font;
int x,y,counter=0,counter1 = 0,loc,s=1,dX,dY,wlength=1,fade=10;
int drawMode = 1;
color c;
boolean showbg = false;
String inputText = "Every atom in your body came from a star that exploded. And, the atoms in your left hand probably came from a different star than your right hand. It really is the most poetic thing I know about physics: You are all stardust. You couldn’t be here if stars hadn’t exploded, because the elements - the carbon, nitrogen, oxygen, iron, all the things that matter for evolution and for life - weren’t created at the beginning of time. They were created in the nuclear furnaces of stars, and the only way for them to get into your body is if those stars were kind enough to explode. So, forget Jesus. The stars died so that you could be here today.";
char [] letter = new char [inputText.length()];
String [] word = splitTokens(inputText);
 
void setup() {
  size(400,800);
  bg = loadImage("bg.jpg");
  background(bg);
  smooth();
 
   
  for(int i=0; i<inputText.length()-1;i++){
    letter [i] = inputText.charAt(i);
  }
   
}
 
void draw(){
}
 
 
void mouseMoved(){
  dX=mouseX-pmouseX;
  dY=mouseY-pmouseY;
  s = (int)sqrt(dX*dX+dY*dY);
  PFont font;  
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
    
}
 
void keyPressed(){
  //Save PNG image
//  if (key == 's' || key == 'S') saveFrame("wallpaper2.png");
   
 // if(keyCode == ENTER){
 ////   showbg = !showbg;
  //  if(showbg){
  //    background(bg);
 //   }else{
 //     background(0);
 //   } 
//  }
   
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


