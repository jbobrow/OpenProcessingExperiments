
//import controlP5.*;
//ControlP5 cp5;
//CheckBox checkbox;

int sliderValue = 300;
int year = 1955;
float zoom = 1;
float xo;
float yo;
float mx = 29;
int dataCol = 2;
//float minR;
//float maxR;
//float minP;
//float maxP;


color[] rainbow = {
  #FFFFCD, #CC5C54, #F69162, #85A562, #7AB5DB
};
color[] palette = rainbow;
PFont titleFont, labelFont;

Table stateData;
int rowCount;

void setup() {
  size(934, 650);
  titleFont = loadFont("GillSans-Bold-18.vlw");
  labelFont = loadFont("GillSans-12.vlw");
  cp5 = new ControlP5(this);

  //    cp5.addSlider("sliderTicks2")
  //     .setPosition(100,800)
  //     .setWidth(900)
  //     .setRange(1955,2012) // values can range from big to small as well
  //     .setValue(1955)
  //     .setNumberOfTickMarks(57)
  //     .setSliderMode(Slider.FLEXIBLE)
  //     ;

//  cp5.addSlider("slider")
//    .setBroadcast(false)
//      .setRange(1955, 2012)
//        .setValue(1955)
//          .setPosition(120, 35)
//            .setSize(900, 20)
//              .setBroadcast(true)
//                .setNumberOfTickMarks(57)
//                  .setSliderMode(Slider.FLEXIBLE)
//                    ;
//  checkbox = cp5.addCheckBox("checkBox")
//    .setPosition(1050, 35)
//      .setColorForeground(color(120))
//        .setColorActive(color(palette[4]))
//          .setColorLabel(color(palette[3]))
//            .setSpacingColumn(30)
//              .setSpacingRow(20)
//                .setSize(20, 20)
//                  .addItem("Adjust for inflation", 3)
//                    //            .addItem("Switch to profit", 3)
//                    ;
}

void draw() {
  background(palette[0]);
  textFont(titleFont);
  smooth();
  scale(zoom);
  translate(xo, yo);
  //fill(palette[2]);
  textAlign(CENTER);
  drawLines();



  //  line(30, 30, 850, 850);
  //  stroke(0);
  //  strokeWeight(3);
  //  



  stateData = new Table(year + ".tsv");
  rowCount = stateData.getRowCount();
  println("rowCount = " + rowCount);
  float minRevenue = stateData.getFloat(1, dataCol + 5);
  float maxRevenue = stateData.getFloat(0, dataCol +5);
  float minProfit = stateData.getFloat(1, dataCol + 6);
  float maxProfit = stateData.getFloat(0, dataCol + 6);
  //  float minR = minRevenue;
  //  float maxR = maxRevenue;
  //  float minP = minProfit;
  //  float maxP = maxProfit;
  text(minRevenue + " (million)", 95, 820);
  text(maxRevenue +" (million)", 95, 50);
  println("minRevenue = " + minRevenue);
  println("maxRevenue = " + maxRevenue);
  println("minProfit = " + minProfit);
  println("maxProfit = " + maxProfit);



  for (int row = 0; row < rowCount; row++) {
    String state = stateData.getString(row, 1);
    int ranking = stateData.getInt(row, 0);
    //   float x = map(ranking, 1, 500, 0, 900);
    float revenue = stateData.getFloat(row, dataCol);
    float y = map(revenue, minRevenue, maxRevenue, 0, height-100);
    float profit = stateData.getFloat(row, dataCol+1);
    float d = map(profit, minProfit, maxProfit, 0, 200);

    //     println("ranking(x-axis) = " + ranking);
    //     println("revenue(y-axis) = " + revenue);
    //    // println("y = " + y);
    //      println("profit(diameter) = " + profit);
    //         println("d(diameter) = " + d);
    //            println("name = " + state);


    noStroke();
    ellipse(ranking*2+120, 900-(y*2+100), d, d);
    fill(palette[1], 50);
    //    text(state, ranking, revenue*12); 

    if ((mx > 100) && (mx < width-50)) {
      stroke(0);
      line(mx, 55, mx, 820);
      strokeWeight(1);
      if (abs(ranking*2+120 - mx) < 1.1) {
        fill(palette[4]);
        text("# " + ranking + " " + state, mx - 6, 900-(y*2+160));
        text("Revenue =" + revenue, mx - 6, 900-(y*2+145));
        text("Profit =" + profit, mx - 6, 900-(y*2+130));
      }
    }
  }

  // noLoop();
}

//slider for year manipulation
void slider(int theColor) {
  year = int(theColor);
  println("a slider event. setting background to "+theColor);
   for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
  if (n==1) {
        dataCol = 4;
        //        float minRevenue = stateData.getFloat(1,9);
        //        float maxRevenue = stateData.getFloat(0,9);
        //        float minProfit = stateData.getFloat(1,10);
        //        float maxProfit = stateData.getFloat(0,10);
      }
      else {
        dataCol = 2;
        //        float minRevenue = stateData.getFloat(1,7);
        //        float maxRevenue = stateData.getFloat(0,7);
        //        float minProfit = stateData.getFloat(1,8);
        //        float maxProfit = stateData.getFloat(0,8);
      }
   }
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      mx += 2;
    }
    else if (keyCode == LEFT) {
      mx -= 2;
    }
    else if (keyCode == UP) {
      zoom ++;
    }
    else if (keyCode == DOWN) {
      zoom --;
    }
  }
  //  if (key == ' ') {
  //    zoom = 1;
  //    xo = width/2;
  //    yo = height/2;
  //  }
}

void mouseMoved() {
  mx = mouseX;
}

//inflation checkbox
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(checkbox)) {
    print("got an event from "+checkbox.getName()+"\t\n");
    // checkbox uses arrayValue to store the state of 
    // individual checkbox-items. usage:
    println(checkbox.getArrayValue());
    dataCol = 1;
    //    int col = 0;
    for (int i=0;i<checkbox.getArrayValue().length;i++) {
      int n = (int)checkbox.getArrayValue()[i];
      print(n);
      if (n==1) {
        dataCol = 4;
        //        float minRevenue = stateData.getFloat(1,9);
        //        float maxRevenue = stateData.getFloat(0,9);
        //        float minProfit = stateData.getFloat(1,10);
        //        float maxProfit = stateData.getFloat(0,10);
      }
      else {
        dataCol = 2;
        //        float minRevenue = stateData.getFloat(1,7);
        //        float maxRevenue = stateData.getFloat(0,7);
        //        float minProfit = stateData.getFloat(1,8);
        //        float maxProfit = stateData.getFloat(0,8);
      }
    }
    println();
  }
}

//}
//    } else if (keyCode == UP) {
//      zoom += .03;
//    } else if (keyCode == DOWN) {
//      zoom -= .03;
//    }

//
//void mouseDragged() {
//  xo = xo + (mouseX - pmouseX);
//  yo = yo + (mouseY - pmouseY);
//}


class Table {
  int rowCount;
  String[][] data;
  
  
  Table(String filename) {
    String[] rows = loadStrings(filename);
    data = new String[rows.length][];
    
    for (int i = 0; i < rows.length; i++) {
      if (trim(rows[i]).length() == 0) {
        continue; // skip empty rows
      }
      if (rows[i].startsWith("#")) {
        continue;  // skip comment lines
      }
      
      // split the row on the tabs
      String[] pieces = split(rows[i], TAB);
      // copy to the table array
      data[rowCount] = pieces;
      rowCount++;
      
      // this could be done in one fell swoop via:
      //data[rowCount++] = split(rows[i], TAB);
    }
    // resize the 'data' array as necessary
    data = (String[][]) subset(data, 0, rowCount);
  }
  
  
  int getRowCount() {
    return rowCount;
  }
  
  
  // find a row by its name, returns -1 if no row found
  int getRowIndex(String name) {
    for (int i = 0; i < rowCount; i++) {
      if (data[i][0].equals(name)) {
        return i;
      }
    }
    println("No row named '" + name + "' was found");
    return -1;
  }
  
  
  String getRowName(int row) {
    return getString(row, 0);
  }


  String getString(int rowIndex, int column) {
    return data[rowIndex][column];
  }

  
  String getString(String rowName, int column) {
    return getString(getRowIndex(rowName), column);
  }

  
  int getInt(String rowName, int column) {
    return parseInt(getString(rowName, column));
  }

  
  int getInt(int rowIndex, int column) {
    return parseInt(getString(rowIndex, column));
  }

  
  float getFloat(String rowName, int column) {
    return parseFloat(getString(rowName, column));
  }

  
  float getFloat(int rowIndex, int column) {
    return parseFloat(getString(rowIndex, column));
  }
  
  
  void setRowName(int row, String what) {
    data[row][0] = what;
  }


  void setString(int rowIndex, int column, String what) {
    data[rowIndex][column] = what;
  }

  
  void setString(String rowName, int column, String what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = what;
  }

  
  void setInt(int rowIndex, int column, int what) {
    data[rowIndex][column] = str(what);
  }

  
  void setInt(String rowName, int column, int what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }

  
  void setFloat(int rowIndex, int column, float what) {
    data[rowIndex][column] = str(what);
  }


  void setFloat(String rowName, int column, float what) {
    int rowIndex = getRowIndex(rowName);
    data[rowIndex][column] = str(what);
  }  
}


void drawLines(){
  fill(palette[3]);
  text("Fortune 500 companies from 1955 to 2012", width/2, 20);
  
  
  textFont(labelFont);
  textAlign(LEFT);
    // Line and labels for X axis
  textAlign(CENTER);
  line(100, 820, width-50, 820);
  for (int i = 1; i < 11; i++) {
//    int a = 1;
//    int b = 10;
    text (i*50, i * 105 + 100, 840);
    fill(palette[3]);
  }
  text("ranking", width/2, 870);

  // Line and labels for Y axis
  textAlign(RIGHT);
  line(100, 30, 100, 820);
  strokeWeight(1);
  
//  for (int i = 1; i < 17; i++) {
//    text (i, 95, 840-i*50);
//  }
  text("revenue", 70, 450);
}


