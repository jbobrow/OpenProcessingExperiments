
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/77978*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

///Patrick - see I'm just playing with your code.
//By making the angry and funny different colors it helps the user see that they are opposed.
//If you could make them move at a different speed it could exaggerate their dynamic opposition even further.

PFont Fun;
PFont Angry;
float angle = 0.0;
String s = "Funny";
String word = "Angry";
char[] letters;
float[] y;
int currentLetter = 0;


void setup() {
size(200,200);
background(153);

Fun = loadFont("Impact-48.vlw");
Angry = loadFont("VinerHandITC-48.vlw");
textFont(Angry);
letters = word.toCharArray();
y = new float[letters.length];
for (int i = 0; i < letters.length; i++) {
  y[i] = 130;
  
}
fill(0);

}
void draw(){
  background(125);
textFont(Fun);
//text("Funny", 45,70);
fill(255,0,0);
//text("Angry", 50, 150);
fill(0,102,153);

angle += 0.1;
for (int i = 0; i < s.length(); i++){
    fill(0,0,255);
  float c = sin(angle + i/PI);
  textSize((c+1.0) * 32 + 10);
  text(s.charAt(i), i*26,60);

  if (y[currentLetter] > 35) {
    y[currentLetter] -= 3;
  } else {
    if (currentLetter < letters.length-1) {
      currentLetter++;
    }
  }
  fill(255,0,0);
  float x = (width - textWidth(word)) / 2;
  text(letters[i], x, y[i]);
  x += textWidth(letters[i]);
}
}

