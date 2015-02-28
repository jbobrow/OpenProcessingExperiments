
//1 is Democratic, 2 is Republican, 3 is Third Party

String stateabbreviations[]= {
  "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "DC"
};

String winners[] = {
  "Richard Nixon (R)", "Richard Nixon (R)", "Jimmy Carter (D)", "Ronald Reagan (R)", "Ronald Regan (R)", "George H. W. Bush (R)", "Bill Clinton (D)", "Bill Clinton (D)", "George W. Bush (R)", "George W. Bush (R)", "Barack Obama (D)", "Barack Obama (D)"
};

int win[] = {
  2, 2, 1, 2, 2, 2, 1, 1, 2, 2, 1, 1
};

//from 1968 ~ 2012. Third Party is George Wallace
//Winners were Richard Nixon (R), Richard Nixon (R), Jimmy Carter (D), Ronald Reagan (R), Ronald Regan (R), Ronald Reagan (R), George H. W. Bush (R), Bill Clinton (D), Bill Clinton (D), George W. Bush (R), George W. Bush (R), Barack Obama (D), Barack Obama (D)
int selection[][] = {
  //AL
  {
    3, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //AK
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //AZ
  {
    2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2
  }
  , 
  //AR
  {
    1, 2, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2
  }
  , 
  //CA
  {
    2, 2, 2, 2, 2, 2, 1, 1, 2, 1, 1, 1
  }
  , 
  //CO
  {
    2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 1, 1
  }
  , 
  //CT
  {
    1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //DE
  {
    2, 2, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //FL
  {
    2, 2, 1, 2, 2, 2, 2, 1, 2, 1, 2, 1
  }
  , 
  //GA
  {
    3, 2, 1, 1, 2, 2, 1, 2, 2, 2, 2, 2
  }
  , 
  //HI
  {
    1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //ID
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //IL
  {
    2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //IN
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2
  }
  , 
  //IA
  {
    2, 2, 2, 2, 2, 1, 1, 1, 1, 2, 1, 1
  }
  , 
  //KS
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //KY
  {
    2, 2, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2
  }
  , 
  //LA
  {
    3, 2, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2
  }
  , 
  //ME
  {
    1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //MD
  {
    1, 2, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //MA
  {
    1, 1, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //MI
  {
    1, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //MN
  {
    1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //MS
  {
    3, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //MO
  {
    2, 2, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2
  }
  , 
  //MT
  {
    2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2
  }
  , 
  //NE
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //NV
  {
    2, 2, 2, 2, 2, 2, 1, 1, 2, 2, 2, 1
  }
  , 
  //NH
  {
    2, 2, 2, 2, 2, 2, 1, 1, 2, 2, 1, 1
  }
  , 
  //NJ
  {
    2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //NM
  {
    2, 2, 2, 2, 2, 2, 1, 1, 1, 2, 1, 1
  }
  , 
  //NY
  {
    1, 2, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //NC
  {
    2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 1, 2
  }
  , 
  //ND
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //OH
  {
    2, 2, 1, 2, 2, 2, 1, 1, 2, 2, 1, 1
  }
  , 
  //OK
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //OR
  {
    2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //PA
  {
    1, 2, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //RI
  {
    1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //SC
  {
    2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //SD
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //TN
  {
    2, 2, 1, 2, 2, 2, 1, 1, 2, 2, 2, 2
  }
  , 
  //TX
  {
    1, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //UT
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //VT
  {
    2, 2, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1
  }
  , 
  //VA
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 1
  }
  , 
  //WA
  {
    1, 2, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //WV
  {
    1, 2, 1, 1, 2, 1, 1, 1, 2, 2, 2, 2
  }
  , 
  //WI
  {
    2, 2, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  //WY
  {
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  //D.C.
  {
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
  }
};

int frame;
PShape usa;

void setup() {
  size(950, 800);
  usa = loadShape("http://upload.wikimedia.org/wikipedia/commons/3/32/Blank_US_Map.svg");
  smooth();
  frameRate(0.5);
  frame=0;
  colorMode(RGB);
}

void draw() {
  background(255);
  shape(usa, 0, 0);
  for (int i = 0; i < selection.length; i++) {
    PShape state = usa.getChild(stateabbreviations[i]);
    state.disableStyle();
    println(i+" " + frame);
    if (selection[i][frame] == 1) {
      fill(0, 0, 255);
    }
    else if (selection[i][frame] == 2) {
      fill(255, 0, 0);
    }
    else if (selection[i][frame] == 3) {
      fill(255, 110, 0);
    }
    noStroke();
    shape(state, 0, 0);
  }
  textSize(32);
  int yeari = 1968 + 4*frame;
  if(win[frame] == 1) {
    fill(0, 0, 255);
  }
  else {
    fill(255, 0, 0);
  }
  text("In the year " + yeari + ", " + winners[frame] + " won the election.", 30, 700, 800, 800);
  frame++;
  if (frame>11) {
    frame=0;
  }
}



