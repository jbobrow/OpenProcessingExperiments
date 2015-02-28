
/* @pjs preload="space.jpg"; */ 
/* @pjs preload="full.png"; */ 
/* @pjs preload="first.png"; */ 
/* @pjs preload="last.png"; */ 

PImage bg;
PImage full;
PImage first;
PImage last;
String[] rawData;
String[][] data;
int selected = -1;
int dateSelection;
float moonState; //i changed this to a float and the csv file to numbers instead of strings - e.g., fullmoon -> 1, halfmoon -> 0.5
String moonStateString;

void setup() {
  size(800, 501);
  bg = loadImage("space.jpg");

  rawData = loadStrings("moon.csv");
  splitData();
  //drawLines();
  //drawCircles();
  dateSelection = 0;
  println(rawData);
}

void draw() {
  //drawCircleHover();
  background(bg);
  moonState = float(data[dateSelection][1]);
    fill(100);
  
  if ( moonState == 1){
    full = loadImage("full.png");
    image(full,300,150,200,200);
    moonStateString = "Full Moon";
    println("it is a full moon");
  } 
  
  if (moonState == 0.5){
    first = loadImage("first.png");
    image(first,250,100,300,300);
    moonStateString = "First Quarter";
  }
  
  if (moonState == 2){
    last = loadImage("last.png");
    image(last,250,100,300,300);
    moonStateString = "Last Quarter";
  }
  
  if (moonState == 0){
    moonStateString = "New Moon";
  }

  
    text(data[dateSelection][0], width/2, height - 100); // tell us what the date selection is
    text(moonStateString, width/2, height - 80);
  
}

void keyPressed(){
 if (key == 'a'){ //go one date up
  dateSelection += 1;
 }
 if ( key == 's'){ // go one date down
  dateSelection -= 1;
 } 
  println("Date is " + dateSelection);
}


/*
void drawCircleHover() {
  for (int i = 0; i < rawData.length; i++) {
    fill(255);
    strokeWeight(1);
    if (i < rawData.length-1) {
      if (dist(mouseX, mouseY, width/2, height/2) < int(data[i][1])/2*0.6 && dist(mouseX, mouseY, width/2, height/2) > int(data[i+1][1])/2*0.6) {
        fill(220); 
        strokeWeight(2);
        selected = i;
      }
    } 
    else {    
      if (dist(mouseX, mouseY, width/2, height/2) < int(data[i][1])/2*0.6) {
        fill(220); 
        strokeWeight(2);
        selected = i;
      }
    }
    ellipse(width/2, height/2, int(data[i][1])*0.6, int(data[i][1])*0.6);
  }

  if (selected != -1) {
    textAlign(CENTER);
    fill(0);
    text(data[selected][0], width/2, height/2 - 50);
    text(data[selected][1], width/2, height/2);
    text(data[selected][2], width/2, height/2+50);
  }
}

void drawLines() {
  for (int i = 0; i <rawData.length; i++) {
    line(0, i*10+100, int(data[i][1]), i*10+100); //int takes that number and turns it into an integer
  }
}

void drawCircles() {
  for (int i = 0; i < rawData.length; i++) {
    ellipse(width/2, height/2, int(data[i][1])*0.6, int(data[i][1])*0.6);
  }
}
*/

void splitData() {
  data = new String[rawData.length][2]; //specify how many rows of data with the length function (to make it dynamic) and columns

  for (int i = 0; i < rawData.length; i++) { //for loop to split up the csv columns

    String[] pieces = split(rawData[i], ","); //split function (what it's splitting up, what the split cue is)

    for (int j=0; j<2; j++) {
      data[i][j] = pieces[j];
      println(data[i][j]);
    }
  }
}



