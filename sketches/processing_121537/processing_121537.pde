
String neurosky[];
ArrayList <JSONObject> reports;
int x;
float h;

int val=0;
int low=0;
int attentionInt=0;
int meditationInt=0;
int deltaInt=0;
int thetaInt=0;
int lowAlphaInt=0;
int highAlphaInt=0;
int lowBetaInt=0;
int highBetaInt=0;
int lowGammaInt=0;
int highGammaInt=0;

float at=0;
float med=0;
float del=0;
float the=0;
float lalp=0;
float halp=0;
float lbet=0;
float hbet=0;
float lgam=0;
float hgam=0;

IntList valArray;
IntList atArray;
IntList medArray;
IntList delArray;
IntList theArray;
IntList lalpArray;
IntList halpArray;
IntList lbetArray;
IntList hbetArray;
IntList lgamArray;
IntList hgamArray;

FloatList valMapArray;
FloatList atMapArray;
FloatList medMapArray;
FloatList delMapArray;
FloatList theMapArray;
FloatList lalpMapArray;
FloatList halpMapArray;
FloatList lbetMapArray;
FloatList hbetMapArray;
FloatList lgamMapArray;
FloatList hgamMapArray;


void setup() {
  size(1200, 600);
  background(255);
  neurosky = loadStrings("data/neurosky.json");
  reports = new ArrayList<JSONObject> ();
  for (int i = 0; i < neurosky.length; i++) {
    reports.add(parseJSON(neurosky[i]));
  }
  valArray = new IntList();
  atArray = new IntList();
  medArray = new IntList();
  delArray = new IntList();
  theArray = new IntList();
  lalpArray = new IntList();
  halpArray = new IntList();
  lbetArray = new IntList();
  hbetArray = new IntList();
  lgamArray = new IntList();
  hgamArray = new IntList();

  valMapArray = new FloatList();
  atMapArray = new FloatList();
  medMapArray = new FloatList();
  delMapArray = new FloatList();
  theMapArray = new FloatList();
  lalpMapArray = new FloatList();
  halpMapArray = new FloatList();
  lbetMapArray = new FloatList();
  hbetMapArray = new FloatList();
  lgamMapArray = new FloatList();
  hgamMapArray = new FloatList();

  for (int i=0; i < reports.size(); i++) {
    try {
      val = reports.get(i).getInt("rawEeg");
      valArray.append(val);
      h = map(val, -200, 200, height/2-50, height/2+50);
      valMapArray.append(h);
    }
    catch(RuntimeException re) {
      valArray.append(val);
      valMapArray.append(h);
    }
  }
  strokeWeight(5);
  for (int i=0; i < reports.size(); i++) {
    try {
      JSONObject esense = reports.get(i).getJSONObject("eSense");
      JSONObject eegpower = reports.get(i).getJSONObject("eegPower");

      attentionInt = esense.getInt("attention");
      atArray.append(attentionInt);
      meditationInt = esense.getInt("meditation");
      medArray.append(meditationInt);

      deltaInt = eegpower.getInt("delta");
      delArray.append(deltaInt);
      thetaInt = eegpower.getInt("theta");
      theArray.append(thetaInt);
      lowAlphaInt = eegpower.getInt("lowAlpha");
      lalpArray.append(lowAlphaInt);
      highAlphaInt = eegpower.getInt("highAlpha");
      halpArray.append(highAlphaInt);
      lowBetaInt = eegpower.getInt("lowBeta");
      lbetArray.append(lowBetaInt);
      highBetaInt = eegpower.getInt("highBeta");
      hbetArray.append(highBetaInt);
      lowGammaInt = eegpower.getInt("lowGamma");
      lgamArray.append(lowGammaInt);
      highGammaInt = eegpower.getInt("highGamma");
      hgamArray.append(highGammaInt);

      at = map(attentionInt, 0, 100, 0, height);
      atMapArray.append(at);
      med = map(meditationInt, 0, 100, 0, height);
      medMapArray.append(med);
      del = map(deltaInt, 0, 100, 0, height);
      delMapArray.append(deltaInt);
      the = map(thetaInt, 0, 100, 0, height);
      theMapArray.append(the);
      lalp = map(lowAlphaInt, 0, 100, 0, height);
      lalpMapArray.append(lalp);
      halp = map(highAlphaInt, 0, 100, 0, height);
      halpMapArray.append(halp);
      lbet = map(lowBetaInt, 0, 100, 0, height);
      lbetMapArray.append(lbet);
      hbet = map(highBetaInt, 0, 100, 0, height);
      hbetMapArray.append(hbet);
      lgam = map(lowGammaInt, 0, 100, 0, height);
      lgamMapArray.append(lgam);
      hgam = map(highGammaInt, 0, 100, 0, height);
      hgamMapArray.append(hgam);
    }
    catch(RuntimeException re) {
      atArray.append(attentionInt);
      medArray.append(meditationInt);

      delArray.append(deltaInt);
      theArray.append(thetaInt);
      lalpArray.append(lowAlphaInt);
      halpArray.append(highAlphaInt);
      lbetArray.append(lowBetaInt);
      hbetArray.append(highBetaInt);
      lgamArray.append(lowGammaInt);
      hgamArray.append(highGammaInt);

      atMapArray.append(at);
      medMapArray.append(med);
      delMapArray.append(deltaInt);
      theMapArray.append(the);
      lalpMapArray.append(lalp);
      halpMapArray.append(halp);
      lbetMapArray.append(lbet);
      hbetMapArray.append(hbet);
      lgamMapArray.append(lgam);
      hgamMapArray.append(hgam);
    }
    x = int(map(i, 0, neurosky.length, 0, 1000));

    //raweeg
    strokeWeight(1);
    stroke(211, 211, 211);
    line(x, valMapArray.get(i), x, height/2);

    //at
    strokeWeight(3);
    stroke(255, 100, 100);
    point(x, atMapArray.get(i));

    //med
    stroke(0, 255, 0);
    point(x, medMapArray.get(i));

    //del
    stroke(0, 0, 255);
    point(x, height-(delMapArray.get(i)/1000));

    //the
    stroke(255, 255, 0);
    point(x, height-(theMapArray.get(i)/1000));

    //lalp
    stroke(255, 0, 255);
    point(x, height-(lalpMapArray.get(i)/100));

    //halp
    stroke(0, 255, 255);
    point(x, height-(halpMapArray.get(i)/100));

    //lbet
    stroke(255, 128, 128);
    point(x, height-(lbetMapArray.get(i)/100));

    //hbet
    stroke(100, 100, 100);
    point(x, height-(hbetMapArray.get(i)/100));

    //lgam
    stroke(50, 50, 50);
    point(x, height-(lgamMapArray.get(i)/100));

    //hgam
    stroke(25, 50, 100);
    point(x, height-(hgamMapArray.get(i)/100));
  }
  for (int i=0; i < reports.size(); i++) {
    try {
      low = reports.get(i).getInt("poorSignalLevel");
      x = int(map(i, 0, neurosky.length, 0, 1000));
      if (low==200) {
        stroke(255, 0, 0);
        line(x, 0, x, height);
      }
    }
    catch(RuntimeException re) {
    }
  }
}

void draw() {
  int arrayIndex = int(map(mouseX, 0, 1000, 0, neurosky.length));
  fill(255);
  noStroke();
  rect(1000, 0, 1200, height);
  text(int(frameRate), 1160, height-16);
  if (mouseX < 1000) {
    if (arrayIndex>28) {
      fill(0);
      text("Time: " + ((arrayIndex/512)+28) + "s", 1030, 20);
      fill(255, 100, 100);
      text("Attention: " + atArray.get(arrayIndex), 1030, 36);
      fill(0, 255, 0);
      text("Meditaton: " + medArray.get(arrayIndex), 1030, 52);
      fill(0, 0, 255);
      text("Delta: " + delArray.get(arrayIndex), 1030, 68);
      fill(255, 255, 0);
      text("Theta: " + theArray.get(arrayIndex), 1030, 84);
      fill(255, 0, 255);
      text("Low Alpha: " + lalpArray.get(arrayIndex), 1030, 100);
      fill(0, 255, 255);
      text("High Alpha: " + halpArray.get(arrayIndex), 1030, 116);
      fill(255, 128, 128);
      text("Low Beta: " + lbetArray.get(arrayIndex), 1030, 132);
      fill(100, 100, 100);
      text("High Beta: " + hbetArray.get(arrayIndex), 1030, 148);
      fill(50, 50, 50);
      text("Low Gamma: " + lgamArray.get(arrayIndex), 1030, 164);
      fill(25, 50, 100);
      text("High Gamma: " + hgamArray.get(arrayIndex), 1030, 178);
      fill(211, 211, 211);
      text("Raw Eeg: " + valArray.get(arrayIndex), 1030, 194);
    }
    else {
      fill(0);
      text("Time: " + arrayIndex + "s", 1030, 20);
      fill(255, 0, 0);
      text("Poor Signal Level", 1030, 36);
    }
  }
  strokeWeight(1);
}

JSONObject parseJSON(String in) {
  JSONObject neuroskyJSON = JSONObject.parse(in);
  return neuroskyJSON;
}



