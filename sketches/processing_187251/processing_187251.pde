
// LOAD DATA
int[] myNumbers;
String[] myLabels;

// LAYOUT
float[] margins = { 50, 50, 80, 100 };
float barWidth = 20;
boolean overBar = false;

void setup(){
  size(500, 400);
  colorMode(RGB);
  
  myLabels = loadStrings("cities.txt");
  
  String[] stringData = loadStrings("population.txt");
  myNumbers = new int[stringData.length];
  
  for(int i = 0; i <= stringData.length - 1; i += 1){
    myNumbers[i] = parseInt(stringData[i]);
  }
  
}

void draw(){
  background(255);
  drawBars();
  drawYAxis();
  
    
}

void drawYAxis(){
  int offset = 10;
  int interval = 5000000;
  // start, stop, increment
  for(int value = 0; value < max(myNumbers); value += interval){
//    println(value);
    float x1 = margins[3] - offset;
    float x2 = width - margins[1] + offset;
    float y1 = height - margins[2] - scaleY(value);
    float y2 = y1;
    
    // grayscale, alpha
    stroke(0, 100);
    line(x1, y1, x2, y2);
    
    textAlign(RIGHT);
    text(value, x1 - offset, y1);
  }
}

void someText(){
   text("Populations of Major World Cities", 100, margins[0] - 10);
}

void drawBars(){
  for(int i = 0; i <= myNumbers.length - 1; i += 1){
    
    float barHeight = scaleY(myNumbers[i]);
    float x = scaleX(i); 
    float y = height - margins[2];
    fill(231, 216, 242); 
    rect(x, y, barWidth, -barHeight);    
  
    // horizontal, vertical
    textAlign(LEFT);
    pushMatrix();
    translate(x,y);
    rotate(QUARTER_PI);
    fill(100, 75, 117);
    text(myLabels[i], 5+i, 10);
    popMatrix();
    textAlign(CENTER, TOP);
    text("Populations of Some Major World Cities", width/2, margins[0] -20);
}
}
    //Try to make a mouseover function - test if mouse is over one of the bars
void ColorBars(){
     for(int i = 0; i <= myNumbers.length - 1; i += 1){
    
    float barHeight = scaleY(myNumbers[i]);
    float x = scaleX(i); 
    float y = height - margins[2];
  if(mouseX > x && mouseX < barWidth && mouseY >= y && mouseY <= y-barHeight) {
    overBar = true;
      stroke(0);
      fill(0);
    }
   else {
    stroke(255);
    overBar = false;
  }
    
     
     }
}
float scaleY(int n){
  return map(n,                                   // input
             0, max(myNumbers),                   // input range
             0, height - margins[0] - margins[2]);//output range
}

float scaleX(int n){
  return map(n,                                           // input
             0, myNumbers.length - 1,                     // input range
             margins[3], width - barWidth - margins[1]);  // output range
}




