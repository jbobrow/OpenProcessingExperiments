
// DATA
int[] myNumbers;
String[] myLabels;

// LAYOUT
// [0] top, [1] right, [2] bottom, [3] left
float[] margins = { 50, 50, 50, 50 };
float ellipseWidth;
float ellipseHeight;

void setup(){
  size(800, 150);
  
  myLabels = loadStrings("cities.txt");
  
 String[] stringData = loadStrings("population.txt");
  myNumbers = new int[stringData.length];
  
 for(int i = 0; i <= stringData.length - 1; i += 1){
   myNumbers[i] = parseInt(stringData[i]);
 }
  
  ellipseWidth = ((myNumbers.length - margins[1] - margins[3]) / myNumbers.length); 
  ellipseHeight = ((myNumbers.length - margins[0] - margins[2]) / myNumbers.length);
  println(myNumbers);
  println("My highest value is: "+ max(myNumbers));
}

void draw(){
  background(0);
  drawBubbles();
  drawYAxis();
}

void drawYAxis(){
 int offset = 10;
    float x1 = margins[3]- offset;
    float x2 = width - margins[1]+ offset;
    float y1 = height/2;
    float y2 = y1;
    
    //grayscale, alpha
    stroke(255, 100);
    line(x1, y1, x2, y2);
 
  }

void drawBubbles(){
  for(int i = 0; i <= myNumbers.length - 1; i += 1){
    
    float ellipseWidth = myNumbers[i]; 
    float x = scaleX(i);  
    float y = height/2;
    
 ellipse(x, y, myNumbers[i] / 1000000, myNumbers[i] / 1000000);
 
 textAlign(CENTER);
 text(myNumbers[i], x, y * 1.50);
 text(myLabels[i], x, y * .60);
 
  }
}

float scaleX(int n){
  return map(n,                                               // input
             0, myNumbers.length - 1,                         // input range
             margins[3], width - ellipseWidth - margins[1]);  // output range
}


