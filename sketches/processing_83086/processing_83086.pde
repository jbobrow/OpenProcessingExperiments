
OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/10432*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//import processing.opengl.*;
import geomerative.*;

RFont font;

int fontSize = 200;

ArrayList seekers, coords;

String inp = "", lastText;
String zin = "Happy Hanukah! From Jeff Friedman LCSW ";
String[] words = split(zin, " ");
int currWord = 0;

boolean seek = false, newtext = true, auto = true;

void setup(){
  size(924, 450);
  //size(900, 900, OPENGL);
  smooth();
  noCursor();
  RG.init(this);
  font = new RFont("haas.ttf", fontSize, RFont.CENTER);
  seekers = new ArrayList();
  coords = new ArrayList();
  noStroke();
  noCursor();
  fill(0);
}

void draw(){
  if((frameCount == 1) && auto){
    inp = words[currWord];
  }

  background(255);

  RGroup grp = font.toGroup(inp);
  RCommand.setSegmentLength(3);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);
  RPoint[] pnts = grp.getPoints();

  if(pnts != null){
    if(newtext){
      coords = new ArrayList();
    }
    if(pnts.length > 0) {
      update(pnts.length, pnts, 4);
    }
    if(newtext){
      newtext = false;
    }

    //add seekers if there are more points than seekers
    checkSeekerCount(pnts.length);
    if(auto == true){
      if(arrived() == 100){
        if(currWord < words.length-1){
          currWord++;
          inp = words[currWord];
        }
        else{
          currWord = 0;
          inp = words[currWord];
        }
      }
    }
  }
  else{
    seekers = new ArrayList();
  }
  if(inp != lastText){
    newtext = true;
  }
  lastText = inp;
}
