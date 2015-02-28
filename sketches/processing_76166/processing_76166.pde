
//andrea gershuny
//assignment 08c: averaging
//average score: 81.98631

float scores[] = {
  21.43, 50.00, 59.52, 65.48, 71.43, 71.43, 82.74, 85.71,
  85.71, 85.71, 91.67, 92.86, 93.45, 94.64, 96.43, 98.81,
  102.98, 103.57, 104.17};
  
color backgroundColor = #5C5863;
color fillColor = #FF1F4C;
color outlineColor = #A85163;
color textColor = #CFFFDD;
color averageLineColor = #CFFFDD;

float sumOfValues;
float averageValue;

void setup(){
  size(580,150);
  background(backgroundColor);
  
  for (int i=0; i<19; i++){
  sumOfValues += scores[i];
  }
  
  averageValue = sumOfValues/19;
  //println(averageValue);
}

void draw(){
  int margin = 30;
  stroke(outlineColor);
  fill(fillColor);
  strokeWeight(2);
  int leftEdge;
  
  for (int i=0; i<19; i++){
    leftEdge = i*margin+10;
    rect(leftEdge,height, 20,-scores[i]);
  }
  stroke(averageLineColor);
  line(0,height-averageValue, width,height-averageValue);
  fill(averageLineColor);
  //textSize(17);
  text(averageValue, 50,height-averageValue-5);
}
