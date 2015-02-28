
String[] ageData;
String[] smokingData;
int [] smoker;
int [] age;
int x = 1;
int y = 1;


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
  strokeWeight(10);
      noFill();

  // HORIZONTAL SPACING

  for (int i = 0; i < smoker.length; i ++ ) {
    //MAP TO INCREASE Y DISTRUBUTION
    float barHeight = map(age[i], 18, 62, 20, 1000);
    barHeight = map(age[i], 19, 65, 40, 1000);
    x = int(width+sin(radians(i*360/age.length))*barHeight);
    y = int(height+cos(radians(i*360/age.length))*barHeight);
    
barHeight = map(age[i], 19, 65, 40, 240);
    stroke(#000000, 50);
    line(x-x/2, y-y/4, width/2, height/2); 
    ellipse(x-x/2, y-y/4,10, 10); 
    
    
    // PINK SMOKER
    if (smoker[i] == 1){
      stroke(#ff00ff, 50);
      x = int(width/4+cos(radians(i*360/age.length))*barHeight);
      y = int(height/2+sin(radians(i*1800/age.length))*barHeight);
      line(x-x/2, y-y/2, width/2, height/2);
      rectMode(CENTER);
      rect(x-x/2, y-y/2,10, 10);   
    }
    
    


  }
}






