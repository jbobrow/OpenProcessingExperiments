

  PFont font; //intialisisert das objekt font
  String input = "";
  

boolean drawAlpha = true;

  void setup(){
  size(800,800);
  textAlign(CENTER, CENTER);
  font = loadFont("Bello-Pro-48.vlw");
  textFont(font);
  }


  void draw(){

  fill(226, 0, 26,5);
  rect(0,0,width,height);
  translate(width/2, height/4);
  fill(0);
  textSize(mouseX + 4);
  text(input,10,mouseY); //10,10 gibt an, wo die  die linke untere Ecke vom Text positioniert ist

  }
  
  

  void mousePressed(){
   fill(random(255));

   if (key != CODED){
   input += key;
   }
   
   if (key==BACKSPACE){
   println("Backspace pressed");
   int lastLetter = input.length()-1;
   input = input.substring(0,3);
   }
  } 



 void keyPressed() {
 input += key;
 }

