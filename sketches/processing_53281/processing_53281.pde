
//loading a text file into processing

String[] kurt;
int idx;
float speed = 5.3;
PFont font;





void setup () {
  size(900, 800);
  background(255);
  frameRate(speed);
  kurt = loadStrings ("Untitled.txt");
  textSize(30);
  textAlign(CENTER);
  fill(255);
  text("kurt", width/2, height/2);
  smooth(); 
}






void draw() {
  background(0);
  fill(255);
  
  font = loadFont("Consolas-Bold-32.vlw");
  textFont(font);
  
  //salmon color font  
  if (idx >= 99 && idx <= 114) {
    background(255);
    fill(214,134,114);
  }
  
  // blue & white text "court marshall"
  if (idx >= 134 && idx <= 146 || idx >= 352 && idx <= 356) {
    background(255);
    fill(0,45,139);
  }
  
   if (idx >= 155 && idx <= 157 || idx == 205 || idx == 212 || idx == 277 || idx == 278 || idx == 282 || idx == 283) {
    background(255);
    fill(255,0,0);
  }
  
   if (idx >= 170 && idx <= 172) {
    background(255);
    fill(255,0,243);
  }
  
  if (idx >= 390 && idx <= 403) {
    background(255);
    fill(0);
    textSize(65);
  }
  
   if (idx == 188 || idx == 190) {
    background(0);
    fill(255,0,0);
  }
  

  //ending green font
  if (idx >= 415) {
    background (170);
    fill(3,255,0);
  }
  
  
  // actually drawing words now
  if (idx < kurt.length) {
    stroke(255);
    text(kurt[idx], width/2, height/2);
  } 
  
   /* gradually increase frame rate howwW??????
  if (idx<20) {
    speed = -4;
  }
  else {
      speed = 0;
  }
  */

  idx++;
  
  //end program.
  if (idx > kurt.length) {
    exit();
  }

}

