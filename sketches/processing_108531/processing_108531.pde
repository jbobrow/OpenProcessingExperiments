
String[] rawData;
//String[] rawData2; //this is the x, y
String[][] data;
//String[][] data2; //this is x, y split
PImage background;
PImage disasterCircle;
boolean red=true;
boolean blue=true;
boolean circles;
PFont myFont; 
//boolean box;


//For Time
int numPoints = 20; //use this to determine how many objects are drawn
int[] xPos = new int[numPoints]; //simple array to hold x positions
int[] yPos= new int[numPoints]; //simple array to hold y positions
int counter = 0; //we will use this variable to count how much time has passed (in frames, not seconds)
int currentCircle = 0; //this variable determine which index of the array will be drawn


void setup() {
  size(900, 675);
  background = loadImage("map1.jpg");
  rawData = loadStrings("Nuclear Disasters.csv");
  myFont = loadFont("Serif-14.vlw");
  disasterCircle = loadImage("circle.png");
  //Time
  frameRate(60); //be sure to set the framerate to 60. this assures that the draw loop will run 60 times a second.

  splitData();

  //initialize the x and y coordinates. these are stored in the array
  for (int i = 0; i < numPoints; i++) {
    xPos[i] = int(data[i][2]);
    yPos[i] = int(data[i][3]);

    //  box = true;
  }


  circles = true;
}

void draw() {

if (mousePressed){
  if (mouseX > (width-100) && mouseY < 100){
   red=!red;
  }
   if (mouseX < 100 && mouseY < 100){
   blue=!blue;
}}

  background (background);
  noStroke();

  //Nuclear Reactors
  if(blue == true){
  for (int i = 0; i < currentCircle; i++) {
    fill(0, 0, 255);
    ellipse(int(data[i][7]), int(data[i][8]), 8, 8);
    if (dist(mouseX, mouseY, int(data[i][7]), int(data[i][8])) < 8) {
      fill(255);
      textFont(myFont);
      textAlign(CENTER);
      text("City " + data[i][5], width -450, height-110);
      //       ellipse(int(data[i][2]), int(data[i][3]), int(data[i][1])*0.6, int(data[i][1])*0.6);

//println("" + data[i][0]);

//   println("City " + data[i][5]);
    }
  }
  //     ellipse(int(data[i][2]), int(data[i][3]), 6, 6);
  //Nuclear Disasters
  //  for (int i = 0; i < data.length; i++) {
  //     fill(255, 0, 0);
  //     imageMode(CENTER);
  //     image(disasterCircle, int(data[i][2]), int(data[i][3]));
  //
  //    if (dist(mouseX, mouseY, int(data[i][2]), int(data[i][3])) < 10) {
  //      fill(255);
  //      textFont(myFont);
  //      textAlign(CENTER);
  //      text("" + data[i][0], width -450, height-110);
  //       
     
  //    }
  //  }

  if(red == true){
  for (int i = 0; i < currentCircle; i++) {
    fill(255, 0, 0);
    imageMode(CENTER);
    image(disasterCircle, int(data[i][2]), int(data[i][3]));
    if (dist(mouseX, mouseY, int(data[i][2]), int(data[i][3])) < 4) {
      // println(mouseX + " " + mouseY + " " + int(data[i][2]) + " " + int(data[i][3]));

      fill(255);
      textFont(myFont);
      textAlign(CENTER);
      text("" + data[i][0], width -450, height-110);
    }
  }
  }
  }

  //Time
  drawOverTime(4);

  //       ellipse(int(data[i][2]), int(data[i][3]), int(data[i][1])*0.6, int(data[i][1])*0.6);

  //  else {
  //      if(dist(mouseX, mouseY, int(data[i][2]), int(data[i][3]) > 30){
  //       fill(100);
  //       selected = i;
  //       }
  //     }
  //       fill(255, 0, 0);


  println(mouseX + ", " + mouseY);

  // if (box==true && mouseY >60 && mouseY < 40 && mouseX >40 && mouseX <134 ) {
  //    background(img);
  //  for (int i = 0; i <1; i++) {
  //   fill(0, 0, 255);
  //      ellipse(int(data[i][7]), int(data[i][8]), 8, 8);
  //    }


//void mouseClicked(){
//} 

  }
  
void splitData() {

  // create a function to store and organize the data into arrays
  // data = new String[# of rows][# of columns] 
  data = new String[rawData.length][9];

  for (int i = 0; i <rawData.length; i++) {

    //pieces has three columns seperated by columns  
    String[] pieces = split(rawData[i], ",");

    for (int j = 0; j < 9; j++) {

      data[i][j] = pieces[j];

//       println(data[i][j]);
    }
  }
}
//void mouseClicked() {
//  if (circles==true && mouseX >150 && mouseY < 330) {
//    circles = !circles;
//    println(circles);
//  }
//  if (circles==false && mouseX<100 && mouseY >600){
//    circles = !circles;
//    println(circles);
//}
//else if(box==false) {
//    background(img); 
//}



//Time
void drawOverTime(int totalTime) {
  //this simple equation determines how long the interval is
  //between drawing points. for example, 10 points over 10 seconds
  //should take 1 second each. we multiply by 60 to get the number
  //of frames. 1 second is 60 frames.
  float timeInterval = (totalTime/float(numPoints))*60;

 
  if (counter%timeInterval == 0 && currentCircle < numPoints) {
    println(currentCircle);
    currentCircle++; //this allow us to draw different x and y coordinates each time
  }

  counter++; //increase the counter. the counter will go up by 60 each second because the draw loop runs 60 times a second because of the frameRate
}


