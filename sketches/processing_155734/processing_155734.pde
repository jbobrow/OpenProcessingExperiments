
String[] rawData;
String[][] data;
int selected = -1;

void setup() {
  size(800, 500);

  rawData = loadStrings("boxOffice.csv");
  splitData();
  //drawLines();
  //drawCircles();

  println(rawData);
}

void draw() {
  drawCircleHover();
}

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

void splitData() {
  data = new String[rawData.length][3]; //specify how many rows of data with the length function (to make it dynamic) and columns

  for (int i = 0; i < rawData.length; i++) { //for loop to split up the csv columns

    String[] pieces = split(rawData[i], ","); //split function (what it's splitting up, what the split cue is)

    for (int j=0; j<3; j++) {
      data[i][j] = pieces[j];
      println(data[i][j]);
    }
  }
}



