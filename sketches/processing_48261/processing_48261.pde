
int x,y,pX,pY;
PFont font;
String textTyped="";
int actRandomSeed = 6;
int centerX = 100, centerY = 100, offsetX = 0, offsetY = 0;

void setup(){
  size(800,800);
  background (255);
  smooth();
  noStroke();
  font = createFont("AGaramondPro-Regular-48.vlw",10);
}




void draw() {
  
  background(255);
  smooth();
  noStroke();
  textAlign(RIGHT);

  if (mousePressed == true) {
    centerX = mouseX-offsetX;
    centerY = mouseY-offsetY;
  } 


  translate(centerX,centerY);


  for (int i = 0; i < textTyped.length(); i++) {
    float fontSize = 25;
    textFont(font,fontSize);
    char letter = textTyped.charAt(i);
    float letterWidth = textWidth(letter);

    //will change the direction of the typespace depend on . , spaces and return keys
   
    switch(letter) { 
    case ' ': // space
      
      int turn = floor(random(0, 2)); 
      if(turn == 0){

        translate(1.9, 0);
        rotate(PI/4);
      }
      if(turn == 1){

        translate(13,-5);
        rotate(-PI/4);
      }
      break;
//rotates in ocatagonal way
    case ',':

      translate(30,15);
      rotate(PI/4);
      break;
//rotates in a square
    case '.':

      translate(60,40);
      rotate(-PI/2);
      break;
//flips over /not mirrored
    case '\n':   
      translate(0, 15);
      rotate(PI);
      break;

    default: // the distance between the text that is going to be
             //typed from the blinker
      fill(0);
      text(letter, 1, 1);
      translate(letterWidth, 0);
    }
    
  }
  

  // TEXT BLINKER
  fill(0);
  if (frameCount/6 % 2 == 0) rect(0, 0, 15, 2);
  

}


void mousePressed(){
  offsetX = mouseX-centerX;
  offsetY = mouseY-centerY;
}


void keyReleased() {

  if (keyCode == ALT) actRandomSeed++;
  println(actRandomSeed);
}

void keyPressed() {
  if (key != CODED) {
    switch(key) {
    case BACKSPACE:
      textTyped = textTyped.substring(0,max(0,textTyped.length()-1));
      break;
    case TAB:
      break;
    case ENTER:
    case RETURN:
      
      textTyped += "\n";
      break;
    case ESC:
      break;
    default:
      textTyped += key;
    }
  }


}


