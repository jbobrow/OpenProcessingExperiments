
//author @tim heng, bheng@sfu.ca

import controlP5.*;

//declaring variables

ControlP5 cp5;

TimeSeries myData;

boolean scale = true;

PFont font;

color ausColor, britColor, canColor, dutColor, frenColor, germanColor, jpnColor, swissColor;
color tbAus, tbBrit, tbCan, tbDut, tbFren, tbGerman, tbJpn, tbSwiss;

boolean japanese_us, australia_us, british_us, canadian_us, dutch_us, french_us, german_us, swiss_us = false;

int small_scale; //used when japanese is not selected
int big_scale;   //used when japanese is selected

void setup() {
  size(1200, 700);

  //initialize preset colors
  ausColor = color(102, 217, 204); //Lagoon
  britColor = color(54, 48, 51); //Silhouette
  canColor = color(249, 222, 14); // Yolks
  dutColor = color(2, 93, 140); //Azurite
  frenColor = color(164, 244, 121); //Green
  germanColor = color(211, 25, 150); //Sea Glass
  jpnColor = color(213, 219, 174); //Lemongrass
  swissColor = color(217, 13, 61); // Cornucopia

  tbAus = color(68, 144, 135); //Lagoon
  tbBrit = color(16, 14, 15); //Silhouette
  tbCan = color(160, 143, 13); // Yolks
  tbDut = color(2, 43, 64); //Azurite
  tbFren = color(107, 158, 80); //Green
  tbGerman = color(132, 17, 94); //Sea Glass
  tbJpn = color(130, 134, 107); //Lemongrass
  tbSwiss = color(136, 9, 39); // Cornucopia

  //read from the csv file
  myData = new TimeSeries("daily-foreign-exchange-1983-1985.csv");

  //convert to days
  myData.convertTime();

  font = loadFont("Helvetica-Light-48.vlw");

  noStroke();
  fill(100);
  rect(1000, 0, 200, 700);

  cp5 = new ControlP5(this);

  //create sliders
  cp5.addSlider("small_scale")  //control the scaling when japanese is not selected
    .setPosition(1020, 600)
      .setSize(90, 20)
        .setRange(1, 36)
          .setValue(12);

  cp5.addSlider("big_scale")    //control the scaling when japanese is selected
    .setPosition(1020, 650)
      .setSize(90, 20)
        .setRange(1, 300)
          .setValue(300);

  //Create toggles
  cp5.addToggle("australia_us")
    .setPosition(1070, 100)
      .setColorActive(ausColor)
        .setColorForeground(ausColor)
          .setColorBackground(tbAus)
            .setSize(50, 20);

  cp5.addToggle("british_us")
    .setPosition(1070, 150)
      .setColorActive(britColor)
        .setColorForeground(britColor)
          .setColorBackground(tbBrit)
            .setSize(50, 20);

  cp5.addToggle("canadian_us")
    .setPosition(1070, 200)
      .setColorActive(canColor)
        .setColorForeground(canColor)
          .setColorBackground(tbCan)
            .setSize(50, 20);

  cp5.addToggle("dutch_us")
    .setPosition(1070, 250)
      .setColorActive(dutColor)
        .setColorForeground(dutColor)
          .setColorBackground(tbDut)
            .setSize(50, 20);

  cp5.addToggle("french_us")
    .setPosition(1070, 300)
      .setColorActive(frenColor)
        .setColorForeground(frenColor)
          .setColorBackground(tbFren)
            .setSize(50, 20);

  cp5.addToggle("german_us")
    .setPosition(1070, 350)
      .setColorActive(germanColor)
        .setColorForeground(germanColor)
          .setColorBackground(tbGerman)
            .setSize(50, 20);

  cp5.addToggle("japanese_us")
    .setPosition(1070, 400)
      .setColorActive(jpnColor)
        .setColorForeground(jpnColor)
          .setColorBackground(tbJpn)
            .setSize(50, 20);

  cp5.addToggle("swiss_us")
    .setPosition(1070, 450)
      .setColorActive(swissColor)
        .setColorForeground(swissColor)
          .setColorBackground(tbSwiss)
            .setSize(50, 20);
}

void draw() {
  //draw the basic layout
  drawTemplate(scale);

  //if japanese_us is selected, use the big_scale, else use the small scale
  if (japanese_us) scale = true;
  else scale = false;

  //draw points on the graph when using the small_scale
  if (!scale) {
    if (australia_us) {
      for (int i=0; i<myData.getLength(aus)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getAus(i))*(600/small_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getAus(i+1))*(600/small_scale))), ausColor);
      }
    }

    if (british_us) {
      for (int i=0; i<myData.getLength(brit)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getBrit(i))*(600/small_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getBrit(i+1))*(600/small_scale))), britColor);
      }
    }

    if (canadian_us) {
      for (int i=0; i<myData.getLength(can)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getCan(i))*(600/small_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getCan(i+1))*(600/small_scale))), canColor);
      }
    }

    if (dutch_us) {
      for (int i=0; i<myData.getLength(dut)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getDut(i))*(600/small_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getDut(i+1))*(600/small_scale))), dutColor);
      }
    }

    if (french_us) {
      for (int i=0; i<myData.getLength(fren)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getFren(i))*(600/small_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getFren(i+1))*(600/small_scale))), frenColor);
      }
    }

    if (german_us) {
      for (int i=0; i<myData.getLength(german)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getGerman(i))*(600/small_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getGerman(i+1))*(600/small_scale))), germanColor);
      }
    }

    if (swiss_us) {
      for (int i=0; i<myData.getLength(swiss)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getSwiss(i))*(600/small_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getSwiss(i+1))*(600/small_scale))), swissColor);
      }
    }
  } 
  else {
    //draw using another formula if using the big_scale
    if (japanese_us) {
      for (int i=0; i<myData.getLength(jpn)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getJpn(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getJpn(i+1))*(600/big_scale))), jpnColor);
      }
    }

    if (australia_us) {
      for (int i=0; i<myData.getLength(aus)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getAus(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getAus(i+1))*(600/big_scale))), ausColor);
      }
    }

    if (british_us) {
      for (int i=0; i<myData.getLength(brit)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getBrit(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getBrit(i+1))*(600/big_scale))), britColor);
      }
    }

    if (canadian_us) {
      for (int i=0; i<myData.getLength(can)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getCan(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getCan(i+1))*(600/big_scale))), canColor);
      }
    }

    if (dutch_us) {
      for (int i=0; i<myData.getLength(dut)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getDut(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getDut(i+1))*(600/big_scale))), dutColor);
      }
    }

    if (french_us) {
      for (int i=0; i<myData.getLength(fren)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getFren(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getFren(i+1))*(600/big_scale))), frenColor);
      }
    }

    if (german_us) {
      for (int i=0; i<myData.getLength(german)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getGerman(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getGerman(i+1))*(600/big_scale))), germanColor);
      }
    }

    if (swiss_us) {
      for (int i=0; i<myData.getLength(swiss)-1; i++) {
        myData.plotLine((myData.getTime(i)*800/905)+75, ((height - 50) - ((myData.getSwiss(i))*(600/big_scale))), (myData.getTime(i+1)*800/905)+75, ((height - 50) - ((myData.getSwiss(i+1))*(600/big_scale))), swissColor);
      }
    }
  }
}

//function to draw the layout
void drawTemplate(boolean my300) {
  fill(255);
  noStroke();
  rect(0, 0, 1000, 700);


  fill(0);
  textSize(14);
  textAlign(LEFT);
  if (my300) {
    //Exchange rate axis
    text("Exchange Rate", 30, 20);
    text(String.valueOf(big_scale), 30, 55);
    text(String.valueOf(big_scale/3*2), 30, 255);
    text(String.valueOf(big_scale/3), 30, 455);
    //    text("0", 50, 655);
  } 
  else {
    //Exchange rate axis
    text("Exchange Rate", 30, 20);
    text(String.valueOf(small_scale), 30, 55);
    text(String.valueOf(small_scale/3*2), 30, 255);
    text(String.valueOf(small_scale/3), 30, 455);
    //    text("0", 50, 655);
  }

  //Time axis
  text("Date", 900, height-10);
  textAlign(CENTER);
  text(myData.getMinDate(), 75, height-30);
  text("1983-08-16", 275, height-30);
  text("1984-03-29", 475, height-30);
  text("1984-11-12", 675, height-30);
  text(myData.getMaxDate(), 875, height-30);

  //axes
  stroke(0);
  strokeWeight(2);
  line(75, 25, 75, height-50);
  line(75, height-50, 925, height-50);

  //grids
  strokeWeight(1);
  stroke(230);

  //verticle lines
  line(125, 50, 125, height-50);
  line(175, 50, 175, height-50);
  line(225, 50, 225, height-50);
  stroke(150);
  line(275, 50, 275, height-50);
  stroke(230);
  line(325, 50, 325, height-50);
  line(375, 50, 375, height-50);
  line(425, 50, 425, height-50);
  stroke(150);
  line(475, 50, 475, height-50);
  stroke(230);
  line(525, 50, 525, height-50);
  line(575, 50, 575, height-50);
  line(625, 50, 625, height-50);
  stroke(150);
  line(675, 50, 675, height-50);
  stroke(230);
  line(725, 50, 725, height-50);
  line(775, 50, 775, height-50);
  line(825, 50, 825, height-50);
  stroke(150);
  line(875, 50, 875, height-50);
  stroke(230);
  //horizontal lines
  stroke(150);
  line(75, 50, 875, 50);
  stroke(230);
  line(75, 100, 875, 100);
  line(75, 150, 875, 150);
  line(75, 200, 875, 200);
  stroke(150);
  line(75, 250, 875, 250);
  stroke(230);
  line(75, 300, 875, 300);
  stroke(230);
  line(75, 350, 875, 350);
  line(75, 400, 875, 400);
  stroke(150);
  line(75, 450, 875, 450);
  stroke(230);
  line(75, 500, 875, 500);
  line(75, 550, 875, 550);
  line(75, 600, 875, 600);
}

String data[], chunks[], date[];
int time[], year[], month[], day[];
float aus[], brit[], can[], dut[], fren[], german[], jpn[], swiss[];

class TimeSeries {    //store all the data read from the csv file
  
  //contructor
  TimeSeries( String file) {
    data = loadStrings( file );
    date = new String[data.length-3];

    year = new int[data.length-3];
    month = new int[data.length-3];
    day = new int[data.length-3];

    aus = new float[data.length-3];
    brit = new float[data.length-3];
    can = new float[data.length-3];
    dut = new float[data.length-3];
    fren = new float[data.length-3];
    german = new float[data.length-3];
    jpn = new float[data.length-3];
    swiss = new float[data.length-3];
    
    //splitting the values
    for (int i=1; i< data.length-2; i++) {
      chunks = split(data[i], ",");
      date[i-1] = chunks[0];
      aus[i-1] = float(chunks[1]);
      brit[i-1] = float(chunks[2]);
      can[i-1] = float(chunks[3]);
      dut[i-1] = float(chunks[4]);
      fren[i-1] = float(chunks[5]);
      german[i-1] = float(chunks[6]);
      jpn[i-1] = float(chunks[7]);
      swiss[i-1] = float(chunks[8]);
    }
  }
  
  //function to draw the lines on the graph
  void plotLine(float x, float y, float nextX, float nextY, color p_color) {
    strokeWeight(1);
    stroke(p_color);
    if ( (x >= 75 && x <= 875) && (y >= 50 && y <= height-50) && (nextX >= 75 && nextX <= 875) && (nextY >= 50 && nextY <= height-50)) line(x, y, nextX, nextY);
  }

  //convert all the time to day format
  void convertTime() {
    int max_time, min_time;
    String[] tempChunk;
    for (int i=0; i<date.length; i++) {
      tempChunk = split(date[i], "-");
      year[i] = int(tempChunk[0]);
      month[i] = int(tempChunk[1]);
      day[i] = int(tempChunk[2]);
    }
    max_time = (year[year.length-1]*365) + (month[month.length-1]*30) + day[day.length-1];
    min_time = (year[0]*365) + (month[0]*30) + day[0];
    time = new int[year.length];

    for (int i=0; i<year.length; i++) {
      time[i] =  max_time - ((year[i]*365) + (month[i]*30) + day[i]);
    }
    time = sort(time);
    println(max_time-min_time);
  }
  
  //a set of getter methods
  int getTime(int index) {
    return time[index];
  }

  String getMaxDate() {
    return date[date.length-1];
  }

  String getMinDate() {
    return date[0];
  }

  float getAus(int index) {
    return aus[index];
  }

  float getBrit(int index) {
    return brit[index];
  }

  float getCan(int index) {
    return can[index];
  }

  float getDut(int index) {
    return dut[index];
  }

  float getFren(int index) {
    return fren[index];
  }

  float getGerman(int index) {
    return german[index];
  }

  float getJpn(int index) {
    return jpn[index];
  }

  float getSwiss(int index) {
    return swiss[index];
  }

  int getLength(float[] obj) {
    return obj.length;
  }
}



