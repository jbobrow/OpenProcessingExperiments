
PFont title;
PFont word;
PFont chapter;
PFont chapterName;
PFont number;
PFont allName;

String[] rawData; 
String[][] boxOffice; 

//int ballSize=30;
//int ballSize2=30;

int speed=3;
int speed2=3;

int allButtonSize = 50;

int numberRows =5;

int allBallSizes[] = new int[numberRows];
int allBallSizes2[] = new int[numberRows];

float xPos[]= new float[numberRows];
float yPos[]= new float[numberRows];

float xPos2[]= new float[numberRows];
float yPos2[]= new float[numberRows];



float chapterX[] = new float[numberRows];
float chapterY[] = new float[numberRows];




float barLength;
float barYposition;

boolean animateAll = false;
boolean animateRevenge = false;
boolean animateLove = false;

//float col =255;


void setup() {

  size(displayWidth, displayHeight); 
  colorMode(RGB);

  chapter=loadFont("BaskOldFace-25.vlw");
  title=loadFont("BaskOldFace-25.vlw");
  word=loadFont("BaskOldFace-25.vlw");
  chapterName=loadFont("BaskOldFace-25.vlw");
  number=loadFont("Baskerville-18.vlw");
  allName=loadFont("Baskerville-18.vlw");


  //  strokeWeight(3);
  //  stroke(255,0,0);

  rawData = loadStrings("boxOffice.csv");
  splitData();

  barLength = width*5/7;
  barYposition = height*2/3+100;

  for (int i = 0; i < rawData.length; i++) {


    xPos[i] = width/7 + i*(barLength/(rawData.length - 1));
    yPos[i] = barYposition; 

    xPos2[i] = width/7 + i*(barLength/(rawData.length - 1));
    yPos2[i] = barYposition;   

    chapterX[i] = xPos[i];
    chapterY[i] = yPos[i];


    allBallSizes[i] = 15;
    allBallSizes2[i] = 15;
  }
}


void draw() {
  background(173, 166, 146);


  fill(0, 0, 0);
  stroke(200);
  line(width/7, barYposition, width/7 + barLength, barYposition);



  textFont(title);
  fill(71, 66, 63);
  text("Hamlet", width/2, 80);

  textFont(title);
  fill(71, 66, 63);
  text("Shakespeare, William", width/2, 100);



  rectMode(CENTER);
  fill(71, 66, 63);
  noStroke();
  rect(width/2, 150, 90, 30);

  rectMode(CENTER);
  fill(236, 108, 63);
  noStroke();
  rect(width/2, 190, 90, 30);

  textFont(word);
  fill(255, 255, 255);
  text("Revenge", width/2, 150);

  textFont(word);
  fill(255, 255, 255);
  text("Love", width/2, 190);

  textFont(chapterName);
  fill(82, 117, 120);
  text("ACT", width/7-50, barYposition);

  //draw the all button
  fill(82, 117, 120);
  noStroke();
  ellipse(width*6/7+50, barYposition, allButtonSize, allButtonSize);
  fill(255, 255, 255);
  textAlign(CENTER, CENTER);
  textFont(allName);
  text("ALL", width*6/7+50, barYposition);  

  drawLineGraph();

  //mouseMovedFeng();

  /////mouseOver
  for (int i = 0; i < rawData.length; i++) {

    if (dist(mouseX, mouseY, xPos[i], yPos[i]) < allBallSizes[i]) {
      textFont(number);
      if ( xPos[i] == width/7 + i*(barLength/(rawData.length - 1)) && yPos[i] == barYposition) {
        fill(82, 117, 120);
      }
      else {
        fill(71, 66, 63);
      }



      text(int(boxOffice[i][1])+" Times", xPos[i]+15, yPos[i]-allBallSizes[i]/2 - 10);




      if (allBallSizes[i]<50) {
        if (animateRevenge) {
          fill(71, 66, 63);
        }
        else {
          fill(82, 117, 120);
        }
        ellipse(xPos[i], yPos[i], allBallSizes[i], allBallSizes[i]);

        allBallSizes[i] = allBallSizes[i]+1;
      }
    }

    else {

      if (allBallSizes[i]>15) {
        if (animateRevenge) {
          fill(71, 66, 63);
        }
        else {
          fill(82, 117, 120);
        }
        ellipse(xPos[i], yPos[i], allBallSizes[i], allBallSizes[i]);
        allBallSizes[i] = allBallSizes[i]-1;
      }
    }
  }
  ///////////mouseOver for love
  for (int i = 0; i < rawData.length; i++) {


    if (dist(mouseX, mouseY, xPos2[i], yPos2[i]) < allBallSizes2[i]) {
      textFont(number);
      if ( xPos2[i] == width/7 + i*(barLength/(rawData.length - 1)) && yPos2[i] == barYposition) {
        fill(82, 117, 120);
      }
      else {
        fill(236, 108, 63);
      }


      text(int(boxOffice[i][2])+" Times", xPos2[i]+15, yPos2[i]-allBallSizes2[i]/2 - 10);

      if (allBallSizes2[i]<50) {
        if (animateLove) {
          fill(236, 108, 63);
        }
        else {
          println("hayaya");
          fill(82, 117, 120);
        }
        ellipse(xPos2[i], yPos2[i], allBallSizes2[i], allBallSizes2[i]);
//        col = col-10;
        allBallSizes2[i] = allBallSizes2[i]+1;
      }
    }

    else {

      if (allBallSizes2[i]>15) {        
        if (animateLove) {
          fill(236, 108, 63);
        }
        else {
          fill(82, 117, 120);}
          ellipse(xPos2[i], yPos2[i], allBallSizes2[i], allBallSizes2[i]);
//          col = col+10;
          allBallSizes2[i] = allBallSizes2[i]-1;
        }
      }
    }
  }
  void drawLineGraph() {

    for (int i = 0; i < rawData.length; i++) {  


      textFont(chapter);
      fill(82, 117, 120);
      text(i + 1, chapterX[i], chapterY[i]+20); 


      ///////////this is about revenge
      if (animateRevenge == false) {
        ellipse(xPos[i], yPos[i], allBallSizes[i], allBallSizes[i]);

        if (yPos[i] < barYposition) {
          yPos[i] += speed;

          if (yPos[i]>barYposition) {

            yPos[i] =barYposition;
          }
        }
      } 
      else {
        stroke(200);
        line(xPos[i], yPos[i], xPos[i], barYposition); 
        fill(71, 66, 63); 
        ellipse(xPos[i], yPos[i], allBallSizes[i], allBallSizes[i]);



        if (i > 0) {
          line(xPos[i], yPos[i], xPos[i-1], yPos[i-1]);
          ellipse(xPos[i], yPos[i], allBallSizes[i], allBallSizes[i]);
          ellipse(xPos[i-1], yPos[i-1], allBallSizes[i-1], allBallSizes[i-1]);
        }    

        //This line takes the data from the file and maps it so it fits on the screen


        float mappedBoxOfficeMoney = map(int(boxOffice[i][1]), 0, 40, 0, height*2/3);

        //This line moves the yPos up to the value of the mapped data 
        if (yPos[i] > barYposition - mappedBoxOfficeMoney) {
          yPos[i] -= speed;
        }
      }

      /////////////////this is about love    
      if (animateLove == false) {

        ellipse(xPos2[i], yPos2[i], allBallSizes2[i], allBallSizes2[i]);

        if (yPos2[i] < barYposition) {
          yPos2[i] += speed2;

          if (yPos2[i]>barYposition) {

            yPos2[i] =barYposition;
          }
        }
      } 
      else {
        stroke(200);
        line(xPos2[i], yPos2[i], xPos2[i], barYposition);
        fill(236, 108, 63); 
        ellipse(xPos2[i], yPos2[i], allBallSizes2[i], allBallSizes2[i]);



        if (i > 0) {
          line(xPos2[i], yPos2[i], xPos2[i-1], yPos2[i-1]);
          ellipse(xPos2[i], yPos2[i], allBallSizes2[i], allBallSizes2[i]);
          ellipse(xPos2[i-1], yPos2[i-1], allBallSizes2[i-1], allBallSizes2[i-1]);
        }    

        //This line takes the data from the file and maps it so it fits on the screen


        float mappedBoxOfficeMoney2 = map(int(boxOffice[i][2]), 0, 40, 0, height*2/3);

        //This line moves the yPos up to the value of the mapped data 
        if (yPos2[i] > barYposition - mappedBoxOfficeMoney2) {
          yPos2[i] -= speed2;
        }
      }
    }
  }





  void mouseClicked() {

    if (dist(mouseX, mouseY, width*6/7+50, barYposition) < allButtonSize/2) {
      //    animateAll = !animateAll;
      animateRevenge = !animateRevenge;
      animateLove = !animateLove;
      println("yes");
    }

    if ( mouseX<width/2+45 && mouseX>width/2-45 && mouseY<150+15 &&mouseY>150-15) {
      animateRevenge = !animateRevenge;
      println("yes");
    }
    if (mouseX<width/2+45 && mouseX>width/2-45 && mouseY<190+15 &&mouseY>190-15) {
      animateLove = !animateLove;
      println("yes");
    }
  }





  void splitData() {

    boxOffice = new String[rawData.length][3];


    for (int i=0; i<rawData.length; i++) {

      String[] pieces = split(rawData[i], ",");

      for (int j=0; j<pieces.length; j++) {
        boxOffice[i][j] = pieces[j];
        println(boxOffice[i][j]);
      }
    }
  }

  //This function simply allows us to run full screen mode in Processing
  //boolean sketchFullScreen() {
  //  return true;
  //}



