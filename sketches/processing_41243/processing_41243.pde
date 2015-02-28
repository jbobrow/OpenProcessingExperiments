
/* 
connecting the dots  
Jannette http://twitter.com/_janem
Oct, 2011

Resources
Steven Jobs' business card http://www.networkworld.com/community/blog/steve-jobs-business-card-1979
Bill Atkinson round corner http://www.folklore.org/StoryView.py?story=Round_Rects_Are_Everywhere.txt
http://toastytech.com/guis/lisawsprefs.png
http://oldcomputers.net/lisa.html

*/

// color of apple rainbow
int[] r = { 97, 253, 245, 224, 150, 86 };
int[] g = { 187, 184, 130, 58, 61, 0 };
int[] b = { 70, 39, 31, 62, 151, 220 };

PFont font;
// quote from http://www.youtube.com/watch?v=UF8uR6Z6KLc&noredirect=1
String stanford05 = "stay hungry, stay foolish";

void setup(){
  size(900, 200);
  background(0);
  font = loadFont("CenturyGothic-48.vlw");
  textFont(font);
  // for a cleared rendered font
  sj();
}

// Press the mouse to hide the cursor
// http://processing.org/reference/
void draw() 
{
  if(mousePressed == true) {
    noCursor();
  } else {
    cursor(HAND);
  }
}

void mouseMoved(){
  smooth();
  sj();
  for (int i = 0; i < r.length; i++) {
    float d = random(0.2, 9);
    fill(r[i], g[i], b[i]);
    noStroke();
    ellipse(mouseX, mouseY, d, d);
    println(i);
  }
}

void mousePressed(){
  background(0);
}

void sj(){
  float stanford05Width = textWidth(stanford05)/2;
  int x = width/2 - int(stanford05Width);
  for (int i = 0; i < stanford05.length(); i++){
    fill(255);
    text(stanford05.charAt(i),x, height/2);
    // letter-spacing
    //y
      if(i==9){
        int letterSpacing = 3;
        x += textWidth(stanford05.charAt(9))+letterSpacing;
      }
      //,
      else if(i==10){
        int letterSpacing = 3;
        x += textWidth(stanford05.charAt(10))-letterSpacing;
      }
      // letter-spacing for the rest of the character
      else{
     x += textWidth(stanford05.charAt(i));
    }
  }
}

