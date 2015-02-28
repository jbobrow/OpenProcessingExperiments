
String[] ageData;
String[] smokingData;
int [] smoker;
int [] age;


void setup() {
  smooth();
  size(1000, 400);
  // TEXT FILE TO ARRAY
  String[] textFile = loadStrings("smoking.txt");
  smoker = new int[textFile.length-1];
  age = new int[textFile.length-1];
  // STRING TO ARRAY
  ageData = split(textFile[1], '\t');
  for(int i=0; i<textFile.length-1; i++){
    ageData = split(textFile[i+1], '\t');
    // get the average temperature (col 3)
    age[i] = int(ageData[2]);
    smoker[i] = int(ageData[0]);
  }
}


void draw() {
  background(#ffff00);
  noStroke();
  // HORIZONTAL SPACING
  int stepSize = width/smoker.length;
  for (int i = 0; i < smoker.length; i ++ ) {
    //MAP TO INCREASE Y DISTRUBUTION
    float barHeight = map(age[i], 18, 62, 20, 70);
    noStroke();
    fill(#000000);
    // DRAW DOTS FROM BOTTOM REFERENCE
    ellipse(i*stepSize,height - 4*barHeight,10,10);
    // BOUND DOT IN RECT IF SMOKER
    if (smoker[i] == 1){
      stroke(#ff00ff);
      fill(#ff00ff);
      rectMode(CENTER);
      rect(i*stepSize,height - 4*barHeight,10,10);
      
    }
  }
}






