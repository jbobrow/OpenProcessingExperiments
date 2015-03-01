
//creates two PFont objects 
PFont myFont;
PFont otherFont;

//creates a global string called printText
String printText = "\t Press 'q', 'w', or 'e' to display sketches.";

void setup() {
  size(700, 700);
  myFont = loadFont("GillSans-48.vlw"); //loads font Gill Sans
  textFont(myFont, 30);                //sets the font and point size
  smooth();                           //makes printed graphics smooth
}

void draw() {
  
  fill(0);                  //sets font color to black
  text(printText,100,100); //Prints the string at (100,100) on the screen
  
  if (key == 'q' || key == 'Q')
    fontz(); 
  else if (key =='w' || key =='W')
    clashingColors();
  else if(key=='e' || key =='E')
    separation();
}

void fontz(){
  
  String textz = "Can you read this?";
  
  background(252,252,232);
  fill(0);
  
  otherFont = loadFont("ACaslonPro-Regular-48.vlw"); //loads font ACaslon
  textFont(otherFont, mouseX+10);         //sets the font and assigns point size to mouse position X
  
  text(textz,100,300); //Prints the string at (100,300) on the screen
}

void clashingColors(){

  String sampleText = "CLICK ME TO READ";
  String fixedText = "Isn't this better?";
  
  textFont(myFont, 24);
  
  //displays "CLICK ME TO READ" in red text on a green background if mouse is not pressed
  if(!mousePressed){
    background(1,103,2);
    fill(255,5,5);
    text(sampleText,mouseX,mouseY);
  }
  
  //if mouse is pressed displays "Isn't this better" in black text on a light background
  else{
    background(252,252,232);
    fill(0);
    text(fixedText,100,300);
  }
   
}

void separation(){
  
  background(255);
  noStroke();
  
  int xsize;
  
  fill(203,50,12);
  rect(20,200,200,200); //draws a rectangle at 20,200
  
  fill(203,63,12);
  rect(mouseX,200,200,200); //draws a rectangle at mousex,200
  
}


