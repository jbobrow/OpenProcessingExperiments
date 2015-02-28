
String mouse_text = "";

void keyPressed() {
  if (key != 65535) {
    if (keyCode == BACKSPACE) {
  if (mouse_text.length() > 0) {
    mouse_text = mouse_text.substring(0, mouse_text.length()-1); //erases the last character
  }
    }
    else {
  mouse_text += key; //add the key to the word
    }
  }
}


/// setup making the page resizable
/// always fills window
void setup() {
  size(400, 400);  
    background(255);
  smooth();
  }
}
float R=125;
float centerR=125;
float a=PI/2;
float a1=PI;
float a2=3*PI/2;
float pathR=125;
float pathG=125;
float G=125;
float centerG=125;
float pathB=125;
float B=125;
float centerB=125;

///Making a line that follows the mouse
void draw() {
  
  //background(pathR,pathG,pathB);
  fill(pathR,pathG,pathB,10);
  rectMode(CENTER);
  rect(0,0,3000,3000);
  ////////
  
  pathR=centerR+R*sin(a);
  a=a+.03;
   
  pathG=centerG+G*sin(a1);
  a1=a1+.03;
   
  pathB=centerB+B*sin(a2);
  a2=a2+.03;
  
///Text that follows the line's path
///Words are on top of each other
  textSize(50);
  text(mouse_text, pmouseX, pmouseY); 
  fill(250, 7, 64);
    
      textSize(50);
      text(mouse_text, pmouseX, pmouseY); 
  fill(255, 128, 0);
    
      textSize(40);
      text(mouse_text, pmouseX, pmouseY); 
  fill(255, 255, 0);
   
     textSize(30);
     text(mouse_text, pmouseX, pmouseY); 
  fill(0, 204, 0);
   
     textSize(20);
     text(mouse_text, pmouseX, pmouseY); 
  fill(0, 128, 255);
  
    textSize(10);
     text(mouse_text, pmouseX, pmouseY); 
  fill(153, 51, 255);

