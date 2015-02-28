
Countries Afghanistan;
Countries Chile;
Countries Ethiopia;
Countries Greece;
Countries Indonesia;
Countries Israel;
Countries Kenya;
Countries Philippines;
Countries Portugal;
Countries Venezuela;

color milColor = color(221, 5, 77);
color econColor = color(11, 114, 150);
color death = color(88, 96, 99);
color tourists = color(204, 175, 155);
color gdp = color(221, 192, 118);
color co2 = color(242, 153, 102);
color imports = color(216, 100, 85);
float longestText;
float textDrop;

int buttonWidth = 190; 
int seperation = 20;


PFont baseSans;




float graphWidth, graphHeight, graphPosX, graphPosY;


void setup() {

  size(1280, 800);
  background(0);
  strokeCap(ROUND);
  baseSans = loadFont("BaseTwelveSans-48.vlw");
  textFont(baseSans);

  textSize(38);
  textAlign(LEFT);
  longestText = 70+(textWidth("MERCHANDISE IMPORTS"));

  textSize(18);

  int buttonCent = int(width/2-buttonWidth/2);
  int buttonLeft = int(seperation*2);
  int buttonRight = int(width-buttonLeft-buttonWidth);

  graphWidth = width-longestText-seperation*4; //set the graph area to a third of the width and height
  graphHeight = height - (seperation*4+200) - seperation*5;
  graphPosX = longestText+seperation*2;  //set the graph area to centre screen
  graphPosY = seperation*4+200;


  //just some math to get all the buttons centered
  Afghanistan = new Countries("Afghanistan", buttonLeft, seperation);
  Chile = new Countries("Chile", int(lerp(buttonLeft, buttonCent, .5)), seperation);
  Ethiopia = new Countries("Ethiopia", buttonCent, seperation);
  Greece = new Countries("Greece", int(lerp(buttonRight, buttonCent, .5)), seperation);
  Indonesia = new Countries("Indonesia", buttonRight, seperation);
  Israel = new Countries("Israel", buttonLeft, seperation*2+50);
  Kenya = new Countries("Kenya", int(lerp(buttonLeft, buttonCent, .5)), seperation*2+50);
  Philippines = new Countries("Philippines", buttonCent, seperation*2+50);
  Portugal = new Countries("Portugal", int(lerp(buttonRight, buttonCent, .5)), seperation*2+50);
  Venezuela = new Countries("Venezuela", buttonRight, seperation*2+50);
}

void draw() {
  background(0);
  stroke(255);
  noFill();
  //  rect(graphPosX, graphPosY, graphWidth, graphHeight); //rectangle of current graph area only

  drawCategories();
  drawCheckBoxes();

  if ((Afghanistan.countrySel==false)&&(Chile.countrySel==false)&&(Ethiopia.countrySel==false)&&(Greece.countrySel==false)&&(Indonesia.countrySel==false)
    &&(Israel.countrySel==false)&&(Kenya.countrySel==false)&&(Philippines.countrySel==false)&&(Portugal.countrySel==false)&&(Venezuela.countrySel==false)) {
    textAlign(LEFT);
    fill(255);
    textSize(65);

    text("AID EFFECT", 70, seperation*3+200);
  }



  if (Afghanistan.countrySel) {
    Afghanistan.drawMilAid();
    Afghanistan.drawEconAid();
  }
  Afghanistan.display();


  if (Chile.countrySel) {
    Chile.drawMilAid();
    Chile.drawEconAid();
  }
  Chile.display();


  if (Ethiopia.countrySel) {
    Ethiopia.drawMilAid();
    Ethiopia.drawEconAid();
  }
  Ethiopia.display();


  if (Greece.countrySel) {
    Greece.drawMilAid();
    Greece.drawEconAid();
  }
  Greece.display();

  Indonesia.display();
  if (Indonesia.countrySel) {
    Indonesia.drawMilAid();
    Indonesia.drawEconAid();
  }


  if (Israel.countrySel) {
    Israel.drawMilAid();
    Israel.drawEconAid();
  }
  Israel.display();


  if (Kenya.countrySel) {
    Kenya.drawMilAid();
    Kenya.drawEconAid();
  }
  Kenya.display();


  if (Philippines.countrySel) {
    Philippines.drawMilAid();
    Philippines.drawEconAid();
  }
  Philippines.display();


  if (Portugal.countrySel) {
    Portugal.drawMilAid();
    Portugal.drawEconAid();
  }
  Portugal.display();


  if (Venezuela.countrySel) {
    Venezuela.drawMilAid();
    Venezuela.drawEconAid();
  }
  Venezuela.display();
}

void drawCategories() {

  int x = 70;

  textSize(38);
  textAlign(LEFT);
  float longestText = x+(textWidth("MERCHANDISE IMPORTS"));

  fill(death);
  text("DEATH RATE", x, 350);

  fill(tourists);
  text("TOURISTS", x, 400);

  fill(gdp);
  text("GDP", x, 450);

  fill(co2);
  text("CO2 EMISSION", x, 500);

  fill(imports);
  text("MERCHANDISE IMPORTS", x, 550);

  stroke(163);
  line(x, 575, longestText, 575);

  fill(milColor);
  text("MILITARY AID", x, 625);

  fill(econColor);
  text("ECONOMIC AID", x, 675);
}

void drawCheckBoxes() {

  for (int i = 330; i<550; i+=50) {
    noFill();
    stroke(163);
    strokeWeight(2);
    rect(seperation*2, i, 15, 15);
  }
}


void mouseReleased() {
  Afghanistan.checkButton();
  if (Afghanistan.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Chile.checkButton();
  if (Chile.countrySel) {
    Afghanistan.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Ethiopia.checkButton();
  if (Ethiopia.countrySel) {
    Chile.countrySel = false;
    Afghanistan.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Greece.checkButton();
  if (Greece.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Afghanistan.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Indonesia.checkButton();
  if (Indonesia.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Afghanistan.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Israel.checkButton();
  if (Israel.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Afghanistan.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Kenya.checkButton();
  if (Kenya.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Afghanistan.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Philippines.checkButton();
  if (Philippines.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Afghanistan.countrySel = false;
    Portugal.countrySel = false;
    Venezuela.countrySel = false;
  }

  Portugal.checkButton();
  if (Portugal.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Afghanistan.countrySel = false;
    Venezuela.countrySel = false;
  }

  Venezuela.checkButton();
  if (Venezuela.countrySel) {
    Chile.countrySel = false;
    Ethiopia.countrySel = false;
    Greece.countrySel = false;
    Indonesia.countrySel = false;
    Israel.countrySel = false;
    Kenya.countrySel = false;
    Philippines.countrySel = false;
    Portugal.countrySel = false;
    Afghanistan.countrySel = false;
  }

  for (int i = 330; i<550; i+=50) {

    if ((Afghanistan.countrySel==false)&&(Chile.countrySel==false)&&(Ethiopia.countrySel==false)&&(Greece.countrySel==false)&&(Indonesia.countrySel==false)
      &&(Israel.countrySel==false)&&(Kenya.countrySel==false)&&(Philippines.countrySel==false)&&(Portugal.countrySel==false)&&(Venezuela.countrySel==false)) {
      //do nothing
    }
    else {
      if (mouseX>seperation*2 && mouseX<longestText && mouseY>i && mouseY<i+20) {
        switch(i) {
        case 330:
          //drawCheck(35, 330, color(88, 96, 99));
          Afghanistan.deathSel = !Afghanistan.deathSel;
          Chile.deathSel = !Chile.deathSel;
          Ethiopia.deathSel = !Ethiopia.deathSel;
          Greece.deathSel = !Greece.deathSel;
          Indonesia.deathSel = !Indonesia.deathSel;
          Israel.deathSel = !Israel.deathSel;
          Kenya.deathSel = !Kenya.deathSel;
          Philippines.deathSel = !Philippines.deathSel;
          Portugal.deathSel = !Portugal.deathSel;
          Venezuela.deathSel = !Venezuela.deathSel;
          break;

        case 380:
          //drawCheck(35, 330, color(88, 96, 99));
          Afghanistan.tourismSel = !Afghanistan.tourismSel;
          Chile.tourismSel = !Chile.tourismSel;
          Ethiopia.tourismSel = !Ethiopia.tourismSel;
          Greece.tourismSel = !Greece.tourismSel;
          Indonesia.tourismSel = !Indonesia.tourismSel;
          Israel.tourismSel = !Israel.tourismSel;
          Kenya.tourismSel = !Kenya.tourismSel;
          Philippines.tourismSel = !Philippines.tourismSel;
          Portugal.tourismSel = !Portugal.tourismSel;
          Venezuela.tourismSel = !Venezuela.tourismSel;
          break;

        case 430:
          //drawCheck(35, 330, color(88, 96, 99));
          Afghanistan.gdpSel = !Afghanistan.gdpSel;
          Chile.gdpSel = !Chile.gdpSel;
          Ethiopia.gdpSel = !Ethiopia.gdpSel;
          Greece.gdpSel = !Greece.gdpSel;
          Indonesia.gdpSel = !Indonesia.gdpSel;
          Israel.gdpSel = !Israel.gdpSel;
          Kenya.gdpSel = !Kenya.gdpSel;
          Philippines.gdpSel = !Philippines.gdpSel;
          Portugal.gdpSel = !Portugal.gdpSel;
          Venezuela.gdpSel = !Venezuela.gdpSel;
          break;

        case 480:
          //drawCheck(35, 330, color(88, 96, 99));
          Afghanistan.co2Sel = !Afghanistan.co2Sel;
          Chile.co2Sel = !Chile.co2Sel;
          Ethiopia.co2Sel = !Ethiopia.co2Sel;
          Greece.co2Sel = !Greece.co2Sel;
          Indonesia.co2Sel = !Indonesia.co2Sel;
          Israel.co2Sel = !Israel.co2Sel;
          Kenya.co2Sel = !Kenya.co2Sel;
          Philippines.co2Sel = !Philippines.co2Sel;
          Portugal.co2Sel = !Portugal.co2Sel;
          Venezuela.co2Sel = !Venezuela.co2Sel;
          break;

        case 530:
          //drawCheck(35, 330, color(88, 96, 99));
          Afghanistan.importSel = !Afghanistan.importSel;
          Chile.importSel = !Chile.importSel;
          Ethiopia.importSel =  !Ethiopia.importSel;
          Greece.importSel = !Greece.importSel;
          Indonesia.importSel = !Indonesia.importSel;
          Israel.importSel = !Israel.importSel;
          Kenya.importSel = !Kenya.importSel;
          Philippines.importSel = !Philippines.importSel;
          Portugal.importSel = !Portugal.importSel;
          Venezuela.importSel = !Venezuela.importSel;
          break;
        }
      }
    }
  }
}

class Countries {

  String country;
  String[] lines; //used for grabbing original data
  String[] pieces; //used to split original data into columns
  String[][] data; //used to store information for graphing
  boolean countrySel, deathSel, tourismSel, gdpSel, co2Sel, exportSel, importSel;

  int x;
  int y;

  Countries(String _country, int _x, int _y) {

    lines = loadStrings(_country + ".csv"); //load country specific data
    splitData(); //splits data into two-dimensional array

    country = _country;


    countrySel = false;
    deathSel = false;
    tourismSel = false;
    gdpSel = false;
    co2Sel = false;
    exportSel = false;
    importSel = false;

    x = _x;
    y = _y;
  }

  void display() {

    drawButton();

    if (countrySel == true  && deathSel == true) {
      drawDeath();
    }

    if (countrySel == true  && tourismSel == true) {
      drawTourism();
    }

    if (countrySel == true  && gdpSel == true) {
      drawGdp();
    }

    if (countrySel == true  && co2Sel == true) {
      drawCo2();
    }

    if (countrySel == true  && importSel == true) {
      drawImport();
    }
  }

  void drawMilAid() {
    int column = 1;
    float max = maxValue(column);
    float min = minValue(column, max);





    for (int i = 0; i < lines.length; i++) {

      //Take data from string and map population points. We will need to use an algorithm to determine the min and max, rather than hard code values
      float year = map(float(data[i][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
      float point = map(float(data[i][column]), min, max, graphHeight+graphPosY, graphPosY);
      float distPoint = dist(year, point, mouseX, mouseY);

      // I removed your larger if statement as it wasn't really doing anything.
      if (i > 0) { //only draw line between points after the first value of i (other wise null pointer exception)
        float p_year = map(float(data[i-1][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
        float p_point = map(float(data[i-1][column]), min, max, graphHeight+graphPosY, graphPosY);
        if ((float(data[i-1][column])>0)&&(float(data[i][column])>0)) {
          stroke(milColor);
          strokeWeight(2);
          line(year, point, p_year, p_point);
          fill(milColor);
          noStroke();
          ellipse(year, point, 5, 5);
        }
      }

      //Roll over
      if (distPoint <= 10) {
        
        fill(milColor);
        textAlign(RIGHT);
        textSize(38);
        float textHeight = textAscent();
        if (int(data[i][column])>0) {
          String rollOverText = data[i][0] + "   $"+nfc(int(data[i][column]))+",000,000";
          float textLength = graphPosX+graphWidth-textWidth(rollOverText);
          text(rollOverText, graphPosX+graphWidth, height-seperation*3.5+textHeight);
          fill(milColor);
          ellipse(textLength-seperation, height-seperation*3.5+textHeight/2, seperation/2, seperation/2);
          ellipse(year, point, 10, 10);
        }
        else {
          String rollOverText = data[i][0] + "   $0";
          float textLength = graphPosX+graphWidth-textWidth(rollOverText);
          text(rollOverText, graphPosX+graphWidth, height-seperation*3.5+textHeight);
          ellipse(textLength-seperation, height-seperation*3.5+textHeight/2, seperation/2, seperation/2);
          ellipse(year, point, 10, 10);
        }
      }

      
    }
  }

  void drawEconAid() {
    int column = 2;
    float max = maxValue(column);
    float min = minValue(column, max);


    stroke(econColor);
    strokeWeight(2);

    for (int i = 0; i < lines.length; i++) {

      //Take data from string and map population points. We will need to use an algorithm to determine the min and max, rather than hard code values
      float year = map(float(data[i][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
      float point = map(float(data[i][column]), min, max, graphHeight+graphPosY, graphPosY);
      float distPoint = dist(year, point, mouseX, mouseY);

      // I removed your larger if statement as it wasn't really doing anything.
      if (i > 0) { //only draw line between points after the first value of i (other wise null pointer exception)
        float p_year = map(float(data[i-1][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
        float p_point = map(float(data[i-1][column]), min, max, graphHeight+graphPosY, graphPosY);
        if ((float(data[i-1][column])>0)&&(float(data[i][column])>0)) {
          stroke(econColor);
          strokeWeight(2);
          line(year, point, p_year, p_point);
          fill(econColor, 100);
          noStroke();
          ellipse(year, point, 8, 8);
        }
      }

      //Roll over
      if (distPoint <= 5) {
        fill(econColor);
        textAlign(RIGHT);
        textSize(38);
        float textHeight = textAscent();
        if (int(data[i][column])>0) {
          String rollOverText = data[i][0] + "   $"+nfc(int(data[i][column]))+",000,000";
          float textLength = graphPosX+graphWidth-textWidth(rollOverText);
          text(rollOverText, graphPosX+graphWidth, height-seperation*3.5+textHeight);
          fill(econColor);
          ellipse(textLength-seperation, height-seperation*3.5+textHeight/2, seperation/2, seperation/2);
          ellipse(year, point, 8, 8);
        }
        else {
          String rollOverText = data[i][0] + "   $0";
          float textLength = graphPosX+graphWidth-textWidth(rollOverText);
          text(rollOverText, graphPosX+graphWidth, height-seperation*3.5+textHeight);
          ellipse(textLength-seperation, height-seperation*3.5+textHeight/2, seperation/2, seperation/2);
          ellipse(year, point, 8, 8);
        }
      }
    }
  }


  void drawDeath() {
    int column = 3;
    float max = maxValue(column);
    float min = minValue(column, max);

    stroke(death);


    for (int i = 0; i < lines.length; i++) {

      //Take data from string and map population points. We will need to use an algorithm to determine the min and max, rather than hard code values
      float year = map(float(data[i][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
      float point = map(float(data[i][column]), min, max, graphHeight+graphPosY, graphPosY);
      float distPoint = dist(year, point, mouseX, mouseY);

      // I removed your larger if statement as it wasn't really doing anything.
      if (i > 0) { //only draw line between points after the first value of i (other wise null pointer exception)
        float p_year = map(float(data[i-1][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
        float p_point = map(float(data[i-1][column]), min, max, graphHeight+graphPosY, graphPosY);
        if ((float(data[i-1][column])>0)&&(float(data[i][column])>0)) {
          strokeWeight(4);
          line(year, point, p_year, p_point);
        }
      }

      //checkmark
      strokeWeight(1);
      line(seperation*2-2, 330+3, seperation*2+7.5, 330+11);
      line(seperation*2+7.5, 330+11, seperation*2+17, 330-8);

      //Roll over
      if (distPoint <= 5) {
        fill(death);
        text(data[i][column], mouseX, mouseY);
      }
    }
  }

  void drawTourism() {
    int column = 4;
    float max = maxValue(column);
    float min = minValue(column, max);

    stroke(tourists);


    for (int i = 0; i < lines.length; i++) {

      //Take data from string and map population points. We will need to use an algorithm to determine the min and max, rather than hard code values
      float year = map(float(data[i][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
      float point = map(float(data[i][column]), min, max, graphHeight+graphPosY, graphPosY);
      float distPoint = dist(year, point, mouseX, mouseY);

      // I removed your larger if statement as it wasn't really doing anything.
      if (i > 0) { //only draw line between points after the first value of i (other wise null pointer exception)
        float p_year = map(float(data[i-1][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
        float p_point = map(float(data[i-1][column]), min, max, graphHeight+graphPosY, graphPosY);
        if ((float(data[i-1][column])>0)&&(float(data[i][column])>0)) {
          strokeWeight(4);
          line(year, point, p_year, p_point);
        }
      }

      //checkmark
      strokeWeight(1);
      line(seperation*2-2, 380+3, seperation*2+7.5, 380+11);
      line(seperation*2+7.5, 380+11, seperation*2+17, 380-8);


      //Roll over
      if (distPoint <= 5) {
        fill(tourists);
        text(data[i][column], mouseX, mouseY);
      }
    }
  }

  void drawGdp() {
    int column = 5;
    float max = maxValue(column);
    float min = minValue(column, max);

    stroke(gdp);


    for (int i = 0; i < lines.length; i++) {

      //Take data from string and map population points. We will need to use an algorithm to determine the min and max, rather than hard code values
      float year = map(float(data[i][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
      float point = map(float(data[i][column]), min, max, graphHeight+graphPosY, graphPosY);
      float distPoint = dist(year, point, mouseX, mouseY);

      // I removed your larger if statement as it wasn't really doing anything.
      if (i > 0) { //only draw line between points after the first value of i (other wise null pointer exception)
        float p_year = map(float(data[i-1][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
        float p_point = map(float(data[i-1][column]), min, max, graphHeight+graphPosY, graphPosY);
        if ((float(data[i-1][column])>0)&&(float(data[i][column])>0)) {
          strokeWeight(4);
          line(year, point, p_year, p_point);
        }
      }

      //checkmark
      strokeWeight(1);
      line(seperation*2-2, 430+3, seperation*2+7.5, 430+11);
      line(seperation*2+7.5, 430+11, seperation*2+17, 430-8);

      //Roll over
      if (distPoint <= 5) {
        fill(gdp);
        text(data[i][column], mouseX, mouseY);
      }
    }
  }

  void drawCo2() {
    int column = 6;
    float max = maxValue(column);
    float min = minValue(column, max);

    stroke(co2);
    strokeWeight(2);

    for (int i = 0; i < lines.length; i++) {

      //Take data from string and map population points. We will need to use an algorithm to determine the min and max, rather than hard code values
      float year = map(float(data[i][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
      float point = map(float(data[i][column]), min, max, graphHeight+graphPosY, graphPosY);
      float distPoint = dist(year, point, mouseX, mouseY);

      // I removed your larger if statement as it wasn't really doing anything.
      if (i > 0) { //only draw line between points after the first value of i (other wise null pointer exception)
        float p_year = map(float(data[i-1][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
        float p_point = map(float(data[i-1][column]), min, max, graphHeight+graphPosY, graphPosY);
        if ((float(data[i-1][column])>0)&&(float(data[i][column])>0)) {
          strokeWeight(4);
          line(year, point, p_year, p_point);
        }
      }

      //checkmark
      strokeWeight(1);
      line(seperation*2-2, 480+3, seperation*2+7.5, 480+11);
      line(seperation*2+7.5, 480+11, seperation*2+17, 480-8);

      //Roll over
      if (distPoint <= 5) {
        fill(co2);
        text(data[i][column], mouseX, mouseY);
      }
    }
  }


  void drawImport() {

    int column = 8;
    float max = maxValue(column);
    float min = minValue(column, max);

    stroke(imports);


    for (int i = 0; i < lines.length; i++) {

      //Take data from string and map population points. We will need to use an algorithm to determine the min and max, rather than hard code values
      float year = map(float(data[i][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
      float point = map(float(data[i][column]), min, max, graphHeight+graphPosY, graphPosY);
      float distPoint = dist(year, point, mouseX, mouseY);

      // I removed your larger if statement as it wasn't really doing anything.
      if (i > 0) { //only draw line between points after the first value of i (other wise null pointer exception)
        float p_year = map(float(data[i-1][0]), 1960, 2011, graphPosX, graphWidth+graphPosX);
        float p_point = map(float(data[i-1][column]), min, max, graphHeight+graphPosY, graphPosY);
        if ((float(data[i-1][column])>0)&&(float(data[i][column])>0)) {
          strokeWeight(4);
          line(year, point, p_year, p_point);
        }
      }

      //checkmark
      strokeWeight(1);
      line(seperation*2-2, 530+3, seperation*2+7.5, 530+11);
      line(seperation*2+7.5, 530+11, seperation*2+17, 530-8);

      //Roll over
      if (distPoint <= 5) {
        fill(imports);
        text(data[i][column], mouseX, mouseY);
      }
    }
  }

  void splitData() {

    data = new String[lines.length][9]; //set up 2D array - one dimension is number of rows, other is number of columns

    for (int i = 0; i<lines.length; i++) {
      pieces = split(lines[i], ","); //split up original data into columns
      for (int j = 0; j<9; j++) {
        data[i][j] = pieces[j]; //put information into array
      }
    }
  }

  float maxValue(int column) {
    float max = 0;

    for (int i = 0; i < lines.length; i++) {
      if (float(data[i][column]) > max) {
        max = float(data[i][column]);
      }
    }
    return max;
  }

  float minValue(int column, float max) {
    float min = max;
    for (int i = 0; i < lines.length; i++) {
      if (int(data[i][column]) != 0) {
        if (float(data[i][column]) < min) {
          min = float(data[i][column]);
        }
      }
    }
    return min;
  }

  void drawButton() {

    if (countrySel == false) {
      fill(0);
      stroke(163);
      strokeWeight(2);
      textSize(30);
      rect(x, y, 190, 50);
      fill(163);
      String capsCountry = country; //hold string ready for conversion
      capsCountry = capsCountry.toUpperCase(); //convert to all caps
      textAlign(CENTER);
      text(capsCountry, x+buttonWidth/2, y+35);
    }

    else {
      fill(255);
      stroke(163);
      strokeWeight(2);
      textSize(30);
      textAlign(CENTER);
      rect(x, y, 190, 50);
      fill(0);
      String capsCountry = country;
      capsCountry = capsCountry.toUpperCase(); 

      text(capsCountry, x+buttonWidth/2, y+35);
      textAlign(LEFT);
      fill(255);
      textSize(65);

      text(capsCountry, 70, seperation*3+200);

      textSize(38);
      float timeHeight = textAscent();

      fill(163, 163, 163);
      line(graphPosX, height-seperation*4, graphPosX+graphWidth, height-seperation*4);
      text("TIME", graphPosX, height-seperation*3.5+timeHeight);
    }
  }

  void checkButton() {

    if (mouseX > x && mouseX < x+buttonWidth && mouseY > y && mouseY < y+50) {
      countrySel = !countrySel;
    }
  }
}



