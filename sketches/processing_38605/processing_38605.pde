
float smileStart =2;
float smileEnd = 2.4;
float wooHoo = 280;


void setup() {

  size(400, 400);
  smooth();
}


void draw () {

  background (250);

  float redred = 250;
  float circleWidth = 450;
  float circleHeight = 400;
  //curtain adjustments
  circleHeight = 2.05*height;
  circleWidth = 100 + 3*mouseY;
  //stage
  fill (90, 90, 90);
  rect(0, 300, 400, 100); 

 //"Encore!"  
 PFont Eurostile;
  Eurostile = loadFont("EurostileBold-48.vlw");
  fill(20, 190, 200, 120);
  textFont(Eurostile, 25);
  text("Encore!", 150, 175);
  text("Encore!", 150, 225);
  
  //smileyface
  strokeWeight(1);
  fill(255, 235, 30);
  ellipse(200, 275, 25, 25);
  strokeWeight(2.5);
  point(195, 272);
  point(205, 272);
  noFill ();
  arc(200, 275, 12, 12, smileStart, smileEnd);
  
//arms
  line (195, 290, 180, wooHoo);
  line (205, 290, 225, wooHoo);
    //tuxedo, arms raised
  



  //fill(redred,0,0,250);
  //arc(0,0,circleWidth,circleHeight,0,2);
  // arc(800,0,circleWidth,circleHeight,1.5,4);
  circleWidth = circleWidth - 25; 
  circleHeight = circleHeight - 25;
  redred = redred - 50;

  fill(redred, 0, 0, 250);
  arc(0, 0, circleWidth, circleHeight, 0, 2);
  arc(400, 0, circleWidth, circleHeight, 1.5, 4);
  stroke(2);
 
  
  if (mouseY <=350) {
    smileStart = mouseY/100;
    wooHoo =250 + .3*mouseY ;
  }
   
  }



