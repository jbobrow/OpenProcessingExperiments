
int[] myNumbers;
float[] margins= {25, 40, 50, 100};
String[] myLabels;
void setup(){
  size (1000, 300);
  
  myLabels=loadStrings("cities.txt");
  
  String[] stringData = loadStrings("population.txt");
  myNumbers = new int[stringData.length];
  
  for(int i = 0; i <= stringData.length - 1; i += 1){
    myNumbers[i] = parseInt(stringData[i]);
  }
}

void draw(){
  background(0);
  drawPoints();
  drawYAxis();
 // drawLines();
}

void drawPoints(){
  for(int i = 0; i <= myNumbers.length - 1; i += 1){
   float offset = 4;
   float x  = map(i, 0, myNumbers.length-1, margins[3]+(offset*10), width-margins[3]);
   float y = scaleY(myNumbers[i]);
   noStroke();
   ellipse(x, y, 10, 10);
   
   textAlign(CENTER, TOP);
   text(myLabels[i], x, height-margins[2]+(offset*2));
  }                
}

void drawYAxis(){
  int horizOffset = 10;
  int vertOffset= 4;
  int interval = 5000000;
  for(int value = 0; value < max(myNumbers); value += interval){
  float x1 = margins[3];
  float x2 = width- margins[1];
  float y1 = height-scaleY(value)-margins[2];
  float y2 = y1;
  
  stroke(255);
  line (x1, y1, x2, y2);
  
  textAlign(RIGHT);
  text(value, x1-horizOffset, y1+vertOffset);
  }
}

float scaleY(int i){
  return map(i, 0, max(myNumbers), 0, height- margins[0]-margins[2]);
}

//void drawLines(){
  //for(int i = 0; i <= myNumbers.length - 1; i += 1){
  // float space = 20;
  // float x1 = 
   //float x2 = 
   //float y1 = 
   //float y2 = 
   //line(x1, y1, x2, y2);  
//}
  
//}





