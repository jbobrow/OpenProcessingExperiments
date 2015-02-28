
int [] age;

float [] prospeed;

float [] intconf;

boolean ageRange1 = true;
boolean ageRange2 = true;
boolean ageRange3 = true;
boolean ageRange4 = true;
boolean ageRange5 = true;

void setup() {
  //frameRate(10);
  size(600, 600);
  background(255);
  loadData();
  smooth();

  PFont fontA;
  fontA = loadFont("AgencyFB-Reg-48.vlw");
  textFont(fontA, 20);
}

void draw() {
  background(255);

  graph();

  buttons();

  currentlyShowing();

  displayAll();
}

void displayAll() {
  stroke(0);
  noFill();
  rect(305, 530, 25, 25);
  rect(302, 527,31,31);
  fill(0);
  text("R", 315,550);
  text("Display All", 288,578);
}

  void currentlyShowing() {
    stroke(0);

    if (ageRange1==true) {
      fill(255, 0, 0);
      rect(430, 95, 10, 10);
    }

    if (ageRange2==true) {
      fill(7, 0, 255);
      rect(445, 95, 10, 10);
    }

    if (ageRange3==true) {
      fill(255, 247, 0);
      rect(460, 95, 10, 10);
    }

    if (ageRange4==true) {
      fill(33, 255, 0);
      rect(475, 95, 10, 10);
    }

    if (ageRange5==true) {
      fill(255, 0, 243);
      rect(490, 95, 10, 10);
    }

    fill(0);
    text("Currently Showing", 412, 86);
  }

  void graph() {

    for (int i =0;i<age.length;i++) {

      // red
      if (age[i]<21) {
        stroke(255, 0, 0);
      }

      //blue
      if (age[i]>20 && age[i]<41) {
        stroke(7, 0, 255);
      }

      //yellow
      if (age[i]>40 && age[i]<61) {
        stroke(255, 247, 0);
      }

      //green
      if (age[i]>60 && age[i]<81) {
        stroke(33, 255, 0);
      }

      //pink
      if (age[i]>80 && age[i]<101) {
        stroke(255, 0, 243);
      }

      float x = map(intconf[i], 0, 1, 100, 500);
      float y = map(prospeed[i], 0, 1, 0, 600);

      float d = age[i];

      noFill();
      if (age[i]<20 && ageRange1==true) {
        ellipse(x-20, y-20, d, d);
      }

      if (age[i]>20 && age[i]<41 && ageRange2==true) {
        ellipse(x-20, y-20, d, d);
      }

      if (age[i]>40 && age[i]<61 && ageRange3==true) {
        ellipse(x-20, y-20, d, d);
      }

      if (age[i]>60 && age[i]<81 && ageRange4==true) {
        ellipse(x-20, y-20, d, d);
      }

      if (age[i]>80 && age[i]<101 && ageRange5==true) {
        ellipse(x-20, y-20, d, d);
      }

      stroke(0);
      line(80, 70, 80, 450);
      fill(0);
      text("Processing", 5, 260);
      text("Speed", 19, 280);
      fill(0);
      line(80, 450, 520, 450);
      text("Internet", 280, 470);
      text("Confidence", 272, 490);
      text("Circle Radius = Age", 405, 570);
      text("Candidate Ages", 20, 520);
    }
  }

  void buttons() {

    noFill();

    if (ageRange1==true) {
      stroke(255, 0, 0);
      rect(22, 527, 31, 31);
    }

    if (ageRange2==true) {
      stroke(7, 0, 255);
      rect(67, 527, 31, 31);
    }

    if (ageRange3==true) {
      stroke(255, 247, 0);
      rect(112, 527, 31, 31);
    }

    if (ageRange4==true) {
      stroke(33, 255, 0);
      rect(157, 527, 31, 31);
    }

    if (ageRange5==true) {
      stroke(255, 0, 243);
      rect(202, 527, 31, 31);
    }

    stroke(0);
    fill(0);
    text("0-20", 23, 580);
    fill(255, 0, 0);
    rect(25, 530, 25, 25);
    fill(0);
    text("21-40", 67, 580);
    fill(7, 0, 255);
    rect(70, 530, 25, 25);
    fill(0);
    text("41-60", 112, 580);
    fill(255, 247, 0);
    rect(115, 530, 25, 25);
    fill(0);
    text("61-80", 157, 580);
    fill(33, 255, 0);
    rect(160, 530, 25, 25);
    fill(0);
    text("81-100", 200, 580);
    fill(255, 0, 243);
    rect(205, 530, 25, 25);
  }

  void mouseClicked() {
    println("-click-");

    if (mouseX>25 && mouseX<25+25 && mouseY>530 && mouseY<530+25) {
      println("red");
      if (ageRange1 == true) {
        ageRange1=false;
      }
      else {
        ageRange1=true;
      }
    }


    if (mouseX>70 && mouseX<70+25 && mouseY>530 && mouseY<530+25) {
      println("blue");
      if (ageRange2 == true) {
        ageRange2=false;
      }
      else {
        ageRange2=true;
      }
    }



    if (mouseX>115 && mouseX<115+25 && mouseY>530 && mouseY<530+25) {
      println("yellow");
      if (ageRange3 == true) {
        ageRange3=false;
      }
      else {
        ageRange3=true;
      }
    }


    if (mouseX>160 && mouseX<160+25 && mouseY>530 && mouseY<530+25) {
      println("green");
      if (ageRange4 == true) {
        ageRange4=false;
      }
      else {
        ageRange4=true;
      }
    }

    if (mouseX>205 && mouseX<205+25 && mouseY>530 && mouseY<530+25) {
      println("pink");
      if (ageRange5 == true) {
        ageRange5=false;
      }
      else {
        ageRange5=true;
      }
    }

    if (mouseX>305 && mouseX<305+25 && mouseY>530 && mouseY<530+25) {
      println("white");
      ageRange1=true;
      ageRange2=true;
      ageRange3=true;
      ageRange4=true;
      ageRange5=true;
    }
  }

  void loadData() {
    String page[]= loadStrings("data.csv");

    //age value storage
    int ageIndex=0;
    age = new int [page.length-1];

    //processing speed value storage
    int prospeedIndex=0;
    prospeed = new float [page.length-1];

    int intconfIndex=0;
    intconf = new float [page.length-1];

    //splitting the data at ther commas
    String bit[] = split(page[0], ",");
    for (int i=0;i<bit.length;i++) {
      println(i+">"+bit[i]);
    }

    // space between data and data titles
    println("-------");
    for (int i=1;i<page.length;i++) {
      bit=split(page[i], ",");
      age[ageIndex++] = int(bit[26]);
      prospeed[prospeedIndex++] = float(bit[22]);
      intconf[intconfIndex++] = float(bit[21]);
    }

    for (int i=0;i<age.length;i++) {
      println(age[i]+" "+prospeed[i]+" "+intconf[i]);
    }
  }


