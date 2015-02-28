
PShape[] letters;
int[] directions;
PShape extra;
String name;
int count = 0;
float inc;  
float fallInc;
int moveInTime = 300;
int stayTime = 150;
int fallTime = 40;
int hangTime = 150;
int numStages =28;
int stageTime = (int)moveInTime/numStages;

void setup() {
  size(960,540); 
  smooth();
  inc = width/stageTime;
  fallInc = width/fallTime;
  letters = new PShape[66];
  directions = new int[132];
  extra = loadShape("tellthem.svg").getChild("extra");
  for (int i=3; i<letters.length+3; i++) {
    name = "Layer " + i;
    letters[i-3] = loadShape("tellthem.svg").getChild(name);
    if (random(1) > 0.5) {
      directions[i-3] = (int)random(0,2) * 2 - 1;
      directions[i+63] = 0;
    } 
    else {
      directions[i-3] = 0;
      directions[i+63] = (int)random(0,2) * 2 - 1; 
    }
    println(directions[i-3]);
  }
}

void draw() {
  background(255);
  if (count < moveInTime) {
    for (int i=0; i<letters.length; i++) {
      if (i%numStages == (int)count/stageTime) {
        shape(letters[i], 0-(stageTime-count%stageTime)*directions[i]*inc,  
        0-(stageTime-count%stageTime)*directions[i+66]*inc, width, height);
      } 
      else if (i%numStages < (int)count/stageTime) {
        shape(letters[i], 0, 0, width, height); 
      }
    }
  }

  else if (count < moveInTime + stayTime) {
    for (int i=0; i<letters.length; i++) {
      shape(letters[i], 0, 0, width, height);
    }
    shape(extra, 0, 0, width, height);
  } 
  else if (count < moveInTime + stayTime + fallTime) {
    for (int i=0; i<letters.length; i++) {
      if (i == 51 || i == 41 || i == 38 || i == 42 ||
        i == 10 || i == 8 || i == 20) {
        shape(letters[i], 0, 0, width, height);
      } 
      else {
        shape(letters[i], 0, (count-stayTime-moveInTime)*fallInc, width, height);
      }  
    }
  }
  else if (count < moveInTime + stayTime + fallTime + hangTime) {
    for (int i=0; i<letters.length; i++) {
      if (i == 51 || i == 41 || i == 38 || i == 42 ||
        i == 10 || i == 8 || i == 20) {
        shape(letters[i], 0, 0, width, height);
      } 
    }
  } else {
    count = 0;
  }
  count++;
  println(count);
  // for 
}





