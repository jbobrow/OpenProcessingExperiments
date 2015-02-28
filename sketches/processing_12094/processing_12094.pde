


/*draw 10 points in the top left corner of the screen
if the mouse is pressed move one of the points and assign the mouseX and mouseY to that position
when mouse pressed again connect a line between the last point that was declared*/
float[] mouseXHistory;
float[] mouseYHistory;
int lastMouseHistoryItem = 0;
int mouseHistorySize = 20;
float color1=10;
float greenGradient=0;

int pickedPoint = 0;
boolean movingAPoint = false;

//float[] Points;


void setup (){
  
  size(800, 800);
  colorMode(RGB);
  
  mouseXHistory = new float[mouseHistorySize];
  mouseYHistory = new float[mouseHistorySize];
 
//if (wantBackground=true)
 
  background(2, 13, 10, 100);
  
 
   // Points = new float[]{0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100};
 
  
}

void draw(){
  noStroke();
  // background(20, 77, 63, 100);
 /*for(int i=0; i<255; i++){
 if(i>=255){
   i==0;}
 
  background(48, i, 69, 50);}*/
  //background(157, 200, 255);
  //background(51, 9, 152, 50);
  
  for (int i=0; i < mouseXHistory.length; i++) {
   //for (int j=0; j < mouseYHistory.length; j++) {
   //for (int j=0; j < mouseXHistory.length; j++)
    
     fill(random(i++), random (i+ 60), random(i+20));
     
     ellipse(mouseXHistory[i], mouseYHistory[i], 50 , 50);
  // }
  }
}
/*void keyReleased(){
  background(2, 13, 10, 100);
  
}*/

void mousePressed(){
 
  lastMouseHistoryItem++;
   
    if (lastMouseHistoryItem >= mouseHistorySize) {
   lastMouseHistoryItem = 0; 
  } 
   mouseXHistory[lastMouseHistoryItem] = mouseX;
   mouseYHistory[lastMouseHistoryItem] = mouseY;
   
   for (int i=0; i < mouseXHistory.length; i++) {
    if (areReallyClose(mouseX, mouseY, mouseXHistory[i], mouseYHistory[i])) {
      pickedPoint = i;
      movingAPoint = true;
      //break;
    }
  }
   
}


void mouseDragged(){
  if (movingAPoint) {
    mouseXHistory[pickedPoint] = mouseX;
    mouseYHistory[pickedPoint] = mouseY;
  }  
}

void mouseReleased(){
  if (movingAPoint) {
    movingAPoint = false;
  } 
}

float closenessThreshold = 5;
boolean areReallyClose(float x1, float y1, float x2, float y2) {
  //test if the distance between the two points is below the threshold
  if (dist(x1, y1, x2, y2) < closenessThreshold) {
    return true;
  } 
  else {
    return false;
  }
}

void keyReleased(){
  if(key == 's'){
     savePointsToAFile();
  }
  if(key == 'r'){
   // fill(2, 13, 10);  
    //rect(0, 0, 800, 800);
     background(2, 13, 10, 100);
  }  
  if(key == 'l'){
    println("Opening snakePoints.txt");
    open("/Users/dhample/Documents/Aesthetics and Computation/Green_snake_draw/snakePoints.txt");
    
    loadPointsFromAFile();
    
  }
}

String pointsFilename = "snakePoints.txt";

//save the data currently in curvePointsX/Y arrays to a file on disk.
void savePointsToAFile() {
  String[] textToSave = new String[mouseXHistory.length];
  for (int i=0; i < mouseXHistory.length; i++) {
    textToSave[i] = str(mouseXHistory[i]) + " " + str(mouseYHistory[i]);
  }
  
  println("Saving Data:");
  println(textToSave);
  
  //see the reference on saveStrings()
  saveStrings(pointsFilename, textToSave);
}


//read the file *pointsFilename* and use the points stored therein.
void loadPointsFromAFile() {
  //load the text from the file, which is returned as an array of strings
  String[] textFromFile = loadStrings(pointsFilename);
  //error checking: If there are too few points in the file, don't use it.
  //the way the program is written, it expects at least a certain number of points to work.
  if (textFromFile.length < mouseXHistory.length) {
    println("Too few sets of points in file. Ignoring.");
    return; //this exits the function "early"
  }
  //create some arrays to store the points as we load them.
  float[] newPointsX = new float[textFromFile.length];
  float[] newPointsY = new float[textFromFile.length];
  
  //go through each line of the file data
  for (int i=0; i < textFromFile.length; i++) {
    //create an array of data from this line by breaking it up at " " (space) characters
    String[] thisLine = split(textFromFile[i], " ");
    //error checking: be sure there are at least two coordinates present!
    if (thisLine.length < 2) {
      println("Error: Too few points on line " + i + " of file. Ignoring.");
      return; //this exits the function "early"      
    }
    //if we had at least two points (which we did, since we got here)
    //then store them in the new point arrays.
    newPointsX[i] = float(thisLine[0]);
    newPointsY[i] = float(thisLine[1]);
  }
  
  //if we got through all the data, then success! 
  //Put the new points into use. We're done loading.
  mouseXHistory = newPointsX;
  mouseYHistory = newPointsY;
}

