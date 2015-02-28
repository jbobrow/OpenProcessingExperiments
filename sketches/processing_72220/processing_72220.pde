
//my program
// by joyce jones-helton

//setup runs once at start up
 void setup(){
 size(652,652);
 smooth();
 colorMode(HSB,360,100,100,100);
}

//draw runb 60 fps
void draw(){
  
  textSize(25);
  text(" World Famous Dog Breeds In 2011");
  background(293,0,99);
  fill(245,62,96,222);
  arc(320, 320, 490, 490, radians(160), radians(280));
  textSize(14);
  text(" Labrador Retrievers",15,150);
  fill(360,66,98,250);
  arc(320, 320, 490, 490, radians(270), radians(330));
  text(" German Shepherds",500,145);
  fill(300,96,57,147);
  arc(320, 320,490, 490, radians(140), radians(170));
  text( " Beagles",15,395);
  fill(46,99,99,255);
  arc(320, 320, 490, 490, radians(380), radians(400));
  text(" Golden Retrievers",535,440);
  fill(86,98,37,54);
  arc(320, 320, 490, 490, radians(330), radians(400));
  fill(12960,51,52);
  text(" Yorkshire Terriers",525,245);
  fill(357,97,60,155);
  arc(320, 320, 490, 490, radians(400), radians(500));
  text(" Bulldogs",445,560);
  
}
