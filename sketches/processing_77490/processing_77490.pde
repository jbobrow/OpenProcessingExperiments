
//working title: penrose type
//I want my final to be built like the penrose example but into letter shapes,
//the user can then type in their name/word and be able to export is as a pdf and print it out.
//being able to incorporate/manipulate the penrose system into each letter, forming the letter



int leftmargin = 40;////////////the padding on both sides
int rightmargin = 40;
String buff = "";
boolean didntTypeYet = true;

void setup() { //////////////////the font and dimension of the screen
  smooth();
  size(650, 130, P3D);
  textFont(loadFont("CenturyGothic-Bold-48.vlw"), 51);
}


void draw()///////////////////////////////////cursor and where the letters type
{ 
  background(#FF0033);  
  float rPos;
  // Store the cursor rectangle's position
  rPos = textWidth(buff) + leftmargin;
  rect(rPos+1, 45, 3, 45);
  if(didntTypeYet) {
    fill(0);
    //text("Use the keyboard.", 22, 40);
  }
  fill(255);
  pushMatrix();
  translate(rPos, 85);
  char k;
  for(int i = 0;i < buff.length(); i++) {
    k = buff.charAt(i);
    translate(-textWidth(k),0);
    text(k,0,0);
  }
  popMatrix();
} /////////////////////////////////////////////////////////////////////////


/*if (oldBLetter.startParticles[i].isShining())
        startParticles[i].makeShine(map(random(1), 0, 1, ELLIPSE_RAD*1.5, ELLIPSE_RAD*2.5));  
      letterSystem.makeSpring(startParticles[i], targetParticles[i], random(LOW_SPRING, HIGH_SPRING), random(1), 0);
    }*/


//void morph() { ////////////////////hopefully change into the penrose function


void keyPressed()//////////////////////////////key type
{
  char k;
  k = (char)key;
  switch(k){
  case 8:
    if(buff.length()>0){
      buff = buff.substring(1);
    }
    break;
  case 13:  // Avoid special keys
  case 10:
  case 65535:
  case 127:
  case 27:
    break;
  default:
    if(textWidth(buff+k)+leftmargin < width-rightmargin){ ////////////<<<argument?
      didntTypeYet = false;
      buff=k+buff;
    }
    break;
  }
}

