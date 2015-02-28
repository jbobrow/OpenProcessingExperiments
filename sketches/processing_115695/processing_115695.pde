
boolean button = false;
PFont FuturaH;
PFont FuturaB;
//images array
String[] filenames = { 
  "1.gif", 
  "2.gif", 
  "3.gif", 
  "4.gif", 
  "5.gif", 
  "6.gif", 
  "7.gif", 
  "8.gif", 
  "9.gif",
}; 

// Number Array
String[] pokernumber = {  
  "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"
};
int index = int(random(pokernumber.length));  
String c1, c2, c3, c4;
//countdown
int countDown;
//imagery array
PImage[] images = new PImage[filenames.length]; 
// Image swap
int imageIndex1 = int(random(filenames.length));
int imageIndex2 = int(random(filenames.length));
int imageIndex3 = int(random(filenames.length));
int imageIndex4 = int(random(filenames.length));

//Timer
int savedTime;
int totalTime = 100;

void setup() {
  size(400, 600);
  smooth();
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  //Fonts
  FuturaH = loadFont("FuturaStd-Heavy.vlw");
  FuturaB = loadFont("FuturaStd-Bold.vlw");

  //i
  c1 = pokernumber[int(random(13))];
  c2 = pokernumber[int(random(13))];
  c3 = pokernumber[int(random(13))];
  c4 = pokernumber[int(random(13))];

  //Timer
  savedTime = millis(); 
  // Loading the images into the array
  for (int i = 0; i<filenames.length; i++) { 
    images[i] = loadImage(filenames[i]);
  }
}

void draw() {
pushMatrix();
translate(0,-20);
  background(255);
  
  if (mousePressed) {
    button = true; 
    //timer
    int passedTime = millis() - savedTime;
    //image Mode
    imageMode(CENTER);
    image(images[imageIndex1], width/4, height/4); 
    image(images[imageIndex2], width/4+200, height/4); 
    image(images[imageIndex3], width/4, height/4+300); 
    image(images[imageIndex4], width/4+200, height/4+300); 

    if (passedTime > totalTime) {
      println ("1..2..3!");
      imageIndex1 = int(random(filenames.length));
      imageIndex2 = int(random(filenames.length));
      imageIndex3 = int(random(filenames.length));
      imageIndex4 = int(random(filenames.length));
      savedTime = millis();
    }
  }

  stroke(0);
  line(width/2, 0, width/2, height/2-20 );
  line(width/2, height/2+20, width/2, height );
  line(0, height/2, width/2-60, height/2);
  line(width/2+60, height/2, width, height/2);


  fill(50);
  fill(50);
  textFont(FuturaH, 128);
  text(c1, width/4, height/4); 
  text(c2, (width/4)*3, height/4);
  text(c3, width/4, (height/4)*3);
  text(c4, (width/4)*3, (height/4)*3);

  textFont(FuturaH, 32);
  int timer = countDown - millis();//Declaring countdown
  if (timer <= 0) text("READY", width/2, height/2);
  else text("" + timer/100, width/2, height/2);
  popMatrix();
  //copyright
  fill(0);
  rect(0, 570, width * 2, 60);
  fill(255);
  textFont(FuturaH, 14);
  text( "RULE: Use '+', '-', 'x', '/','()' = 24", 130, 560 );
  text( "24Pt Game 2013 Copyright at Njoy Design Studio", 180, 580 );

}


void mouseReleased() {
  countDown = millis() + 11000;//Time length
  c1 = pokernumber[int(random(13))];
  c2 = pokernumber[int(random(13))];
  c3 = pokernumber[int(random(13))];
  c4 = pokernumber[int(random(13))];
}

void mousePressed() {
  if (mousePressed) countDown = 0;//Time length
}




