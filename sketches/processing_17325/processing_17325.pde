
/* DIKKEBEATSGENERATOR

  todo:
    - controlpoints mogen niet negatief zijn (inverted loudness/duration)
    * omdat we ovalen in de linkerbovenhoek tekenen maar met een middenstip moven mogen ze niet van 't canvas af...
        oh lol, door de snap to beat is dit geen probleem meer?
    * ghostimage? of is die juist wel oke
        wil een fade.
    x instruments/colorpicker ...
    x snap to beat.
    x kunnen verschillende instruments op hetzelfde channel?
        nee.
    x deletefunctie
    - copy note.
    x meerdere notes tegelijkertijd editen, duration/loudness
      - je moet ook nootkleur by the masses kunnen editen!
    - wtf is het onderscheid tussen noteSelected en controlPointSelected!
    * per void heb je slechts 1 for loop nodig.
        draw() is ietwat opgeschoond qua for loops. BROKES IT
        fixed it ^_^ cpX/cpY worden per mouseClickedevent refreshed.
        _____________________

  wishful thinking:
    - load/save canvas
    - meerdere 'tracks' om achter elkaar te spelen / afzonderlijk te loopen.
*/

import arb.soundcipher.*;
SCScore score = new SCScore();

float scoreTime;
boolean noteSelected, controlPointSelected, newNote;
int selectedNote, c;
String selectedControlPoint;
PVector mousePos, cpX, cpY, cpXY; // .. controlPoint for duration, loudness and movement.

int[] X = new int[0]; // x position of note visualisation
int[] Y = new int[0]; // y pos
int[] sX = new int[0]; // horizontal size of notes, duration.
int[] sY = new int[0]; // vertical size, loudness.
int[] sN = new int[0]; // selection levels: 0 not selected; 1 selected; 2 'subselection'
int[] iC = new int[0]; // 'instrumentColour'
int[] chan = new int [15]; // channellist
boolean[] playing = new boolean[0];
int bpm = 60;

void setup() {
  size(800,600);
  background(255);
  smooth();
  ellipseMode(CORNER);
  scoreTime = (float)width / bpm;
  score.addCallbackListener(this);  
}

void draw() {
  noStroke();
  fill(255);
  rect(0,0,width,height); // refresh the canvas
  stroke(0,30);
  strokeWeight(1);
  for (int bm = 1; bm < scoreTime * 2; bm++) {
    line((width/(scoreTime*2))*bm,0,(width/(scoreTime*2))*bm,height); // beatgrid
  }
  mousePos = new PVector(mouseX,mouseY);
  if (!score.playing) {
    score.empty();
    score.addCallback(0,-1); // dummynote start of the score
    score.addCallback(scoreTime,-1); // dummynote end.
    for (int i = 0; i < chan.length; i++) {
      chan[i] = -i; // refresh channels
    }
  }
  if (noteSelected) {
    X[selectedNote] = mouseX-(sX[selectedNote]/2);
    Y[selectedNote] = mouseY-(sY[selectedNote]/2);
  }
  for (int i = 0; i < X.length; i++) {
    if (controlPointSelected) {
      if (selectedControlPoint == "x") {
        if (sN[i] == 1 || sN[i] == 2) {
          sX[i] = int(mousePos.x - X[selectedNote]);
        }
      } else {
        if (sN[i] == 1 || sN[i] == 2) {
          sY[i] = int(mousePos.y - Y[selectedNote]);
        }
      }
      if (keyPressed && key == CODED && keyCode == CONTROL) {
        strokeWeight(5);
        stroke(0);
        for (int xy = 0; xy < X.length; xy++) {
          cpXY = new PVector(X[xy]+(sX[xy]/2),Y[xy]+(sY[xy]/2));
          if (mouseX > cpXY.x - (sX[xy]/2) && mouseX < cpXY.x + (sX[xy]/2) && mouseY > cpXY.y - (sY[xy]/2) && mouseY < cpXY.y + (sY[xy]/2)) {
            point(cpXY.x,cpXY.y);
          }      
        }
      }
    }
    if (iC[i] < 42) {
      if (playing[i]) {
        fill(0,255-(iC[i]*6),255-(iC[i]*6));
      } else {
        fill(0,255-(iC[i]*6),255-(iC[i]*6),120);        
      }
    } else if (iC[i] >= 42 && iC[i] < 84) {
      if (playing[i]) {
        fill(255-((iC[i]-42)*6),0,255-((iC[i]-42)*6));
      } else {
        fill(255-((iC[i]-42)*6),0,255-((iC[i]-42)*6),120);
      }
    } else if (iC[i] >= 84) {
      if (playing[i]) {
        fill(255-((iC[i]-84)*6),255-((iC[i]-84)*6),0);
      } else {
        fill(255-((iC[i]-84)*6),255-((iC[i]-84)*6),0,120);
      }
    }
    noStroke();
    ellipse(X[i],Y[i],sX[i],sY[i]);
    if (!noteSelected && !controlPointSelected) {
      strokeWeight(5);
      stroke(0);
      cpX = new PVector(X[i]+(sX[i])+5,Y[i]+(sY[i]/2));
      cpY = new PVector(X[i]+(sX[i]/2),Y[i]+sY[i]);
      cpXY = new PVector(X[i]+(sX[i]/2),Y[i]+(sY[i]/2));
      if (mouseX > cpXY.x - (sX[i]/2) && mouseX < cpXY.x + (sX[i]/2) && mouseY > cpXY.y - (sY[i]/2) && mouseY < cpXY.y + (sY[i]/2)) {
        point(cpXY.x,cpXY.y);
      }
      if (mousePos.dist(cpX) < 10) {
        selectedNote = i;
        point(cpX.x,cpX.y);
      } else if (mousePos.dist(cpY) < 10) {
        selectedNote = i;
        point(cpY.x,cpY.y);
      }
    }
    if (!score.playing) {
      for (int bm = 1; bm < scoreTime * 2; bm++) {
        if (X[i] - (width/(scoreTime*2))*bm < (width/(scoreTime*2))*(bm+1) - X[i]) {
          X[i] = (int)(width/(scoreTime*2))*bm; // snap to beatgrid
          break;
        }
      }
      for (c = 0; c < 15; c++) {
        if (chan[c] == iC[i] || i == 0 || chan[c] < 0) { // look for a free channel / channel in use by same instrument.
          chan[c] = iC[i];
          break;
        }
      }
      score.addNote(
        (float)scoreTime / ((float)width / X[i]),     // startbeat
        c,                                            // channel
        iC[i],                                        // instrument
        (float)127 - (127 / ((float)height / Y[i])),  // pitch
        (float)sY[i]/(height/4)*127,                  // loudness
        (float)sX[i]/width*scoreTime,                 // duration
        0.8,                                          // articulation
        64                                            // pan!
      );
      score.addCallback((float)scoreTime / ((float)width / X[i]),i);
    }
  }
  if (!score.playing) {
    score.play();
  }
}

void handleCallbacks(int note) {
  if (note >= 0) {
    if (!playing[note]) {
      playing[note] = true;
      score.addCallback((float)scoreTime / ((float)width / X[note]) + (float)sX[note]/width*scoreTime,note);
    } else {
      playing[note] = false;
    }
  }
}

void mouseClicked() {
  println("noteSelected: " + noteSelected + " cpSelected: " + controlPointSelected);
  if (!noteSelected && !controlPointSelected && X.length > 0) {
    cpX = new PVector(X[selectedNote]+(sX[selectedNote])+5,Y[selectedNote]+(sY[selectedNote]/2)); // controlpoint voor duration
    cpY = new PVector(X[selectedNote]+(sX[selectedNote]/2),Y[selectedNote]+sY[selectedNote]); // controlpoint voor loudness
    if (mousePos.dist(cpX) < 10) {
      selectedControlPoint = "x";
      controlPointSelected = true;
    } else if (mousePos.dist(cpY) < 10) {
      selectedControlPoint = "y";
      controlPointSelected = true;
    }
    if (controlPointSelected) {
      for (int i = 0; i < sN.length; i++) {
        sN[i] = 0;
      }
      sN[selectedNote] = 1;
    }
    if (!controlPointSelected) {
      for (int i = 0; i < X.length; i++) {
        cpXY = new PVector(X[i]+(sX[i]/2),Y[i]+(sY[i]/2));
        if (mousePos.dist(cpXY) < 10) {
          selectedNote = i;
          for (int sNi = 0; sNi < X.length; sNi++) {
            sN[sNi] = 0;
          }
          sN[i] = 1;
          noteSelected = true;
          break;
        } else if (i == X.length-1) {
          newNote = true;
        }
      }
    }
  } else if (noteSelected) {
    X[selectedNote] = mouseX-(sX[selectedNote]/2);
    Y[selectedNote] = mouseY-(sY[selectedNote]/2);
    noteSelected = false;
  } else if (controlPointSelected && !keyPressed) {
    if (selectedControlPoint == "x") {
      for (int i = 0; i < X.length; i++) {
        if (sN[i] == 1 || sN[i] == 2) {
          sX[i] = int(mousePos.x - X[selectedNote]);
          sN[i] = 0;
        }
      }
    } else {
      for (int i = 0; i < X.length; i++) {
        if (sN[i] == 1 || sN[i] == 2) {
          sY[i] = int(mousePos.y - Y[selectedNote]);
          sN[i] = 0;
        }
      }
    }
    controlPointSelected = false;
  } else if (keyPressed && key == CODED && keyCode == CONTROL) {
    if (controlPointSelected) { 
      for (int i = 0; i < X.length; i++) {
        cpXY = new PVector(X[i]+(sX[i]/2),Y[i]+(sY[i]/2));
        if (mousePos.dist(cpXY) < 5) {
          if (sN[i] == 1) {
            if (selectedControlPoint == "x") {
              sX[i] = 30;
            } else {
              sY[i] = 30;
            }
            sN[i] = 0;
            controlPointSelected = false;
          } else if (sN[i] == 0) {
            sN[i] = 2;
          } else if (sN[i] == 2) {
            sN[i] = 0;
          }
          break;
        }
      }
    } else if (noteSelected) {
      for (int i = 0; i < X.length; i++) {
        cpXY = new PVector(X[i]+(sX[i]/2),Y[i]+(sY[i]/2));
        if (mousePos.dist(cpXY) < 5) {
          if (sN[i] == 0) {
            sN[i] = 2;
          } else {
            sN[i] = 0;
          }
          break;
        }
      }
    }
  }
  if (newNote || X.length == 0) {
    X = append(X,mouseX);
    Y = append(Y,mouseY);
    sX = append(sX,30);
    sY = append(sY,30);
    sN = append(sN,0);
    iC = append(iC,0);
    playing = expand(playing,playing.length+1);
    newNote = false;
  }
}

void keyPressed() {
  // this is terribly ugly, i know.
  if (noteSelected && key == DELETE) {
    int[] Xtemp1 = subset(X,0,selectedNote);
    int[] Xtemp2 = subset(X,selectedNote+1);
    X = concat(Xtemp1,Xtemp2);
    int[] Ytemp1 = subset(Y,0,selectedNote);
    int[] Ytemp2 = subset(Y,selectedNote+1);
    Y = concat(Ytemp1,Ytemp2);
    int[] sXtemp1 = subset(sX,0,selectedNote);
    int[] sXtemp2 = subset(sX,selectedNote+1);
    sX = concat(sXtemp1,sXtemp2);
    int[] sYtemp1 = subset(sY,0,selectedNote);
    int[] sYtemp2 = subset(sY,selectedNote+1);
    sY = concat(sYtemp1,sYtemp2);
    int[] sNtemp1 = subset(sN,0,selectedNote);
    int[] sNtemp2 = subset(sN,selectedNote+1);
    sN = concat(sNtemp1,sNtemp2);
    int[] iCtemp1 = subset(iC,0,selectedNote);
    int[] iCtemp2 = subset(iC,selectedNote+1);
    iC = concat(iCtemp1,iCtemp2);
    boolean[] playingtemp1 = subset(playing,0,selectedNote);
    boolean[] playingtemp2 = subset(playing,selectedNote+1);
    playing = concat(playingtemp1,playingtemp2);
    noteSelected = false;
  }
  else if (noteSelected && key == CODED) {
    if (keyCode == UP) {
      for (int i = 0; i < X.length; i++) {
        if (sN[i] == 1 || sN[i] == 2) {
          iC[i] = iC[i] + 42;
        }
      }
    } else if (keyCode == DOWN) {
      for (int i = 0; i < X.length; i++) {
        if (sN[i] == 1 || sN[i] == 2) {
          iC[i] = iC[i] - 42;
        }
      }
    } else if (keyCode == LEFT) {
      for (int i = 0; i < X.length; i++) {
        if (sN[i] == 1 || sN[i] == 2) {
          iC[i] = iC[i] - 1;
        }
      }
    } else if (keyCode == RIGHT) {
      for (int i = 0; i < X.length; i++) {
        if (sN[i] == 1 || sN[i] == 2) {
          iC[i] = iC[i] + 1;
        }
      }
    }
    for (int i = 0; i < X.length; i++) {
      if (iC[i] < 0) {
        iC[i] = 0;
      } else if (iC[i] > 127) {
        iC[i] = 127;
      }
    }
  }
}

