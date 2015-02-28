

//Joseph Volpe,
//August 4th
//green square assignment

void setup (){
   
  size(800,500);
  background(80);
  noLoop();
}

void draw(){
  noStroke();
  //rectangle 1 top left corner
  colorMode(RGB);
  fill(23,122,35);
  //   topL,bottomL,topR, BottomR//
  rect(0,0,400,400);
  //rect 2 bottom right corner
  colorMode(RGB);
  fill(23,100,35);
  rect(400,400,800,800);
  //rect 3 bottom right corner
  colorMode(RGB);
  fill(2,199,22);
  rect(0,400,400,100);
  //rect4 bottom left
  colorMode(RGB);
  fill(23,101,45);
  rect(400,0,400,450);
  //center rect5
  colorMode(RGB);
  fill(23,55,31);
  rect(200,185,333,150);
  colorMode(RGB);
  //off center rect bright green 6
  fill(83,167,35);
  rect(222,222,222,222);
  //top left small rect 7
  colorMode(RGB);
  fill(23,167,55);
  rect(0,0,177,122);
  // text has been randomized to appear in a different location everytime this is run//
  PFont font;
  font=loadFont("MSReferenceSansSerif-Bold-48.vlw");
  textFont(font, 60);
  textFont(font, random (500));
  text( "I understand about indecision",215, 30); 
fill(0, 102, 153);
textFont(font, random (121));
text("I don't care if I get behind", 115, 60);
textFont(font, random (101));
fill(0, 102, 153, 51);
text("people living in competition", 215, 90);
textFont(font, random (500));
fill(200, 180, 153, 51);
text("All I want is to have my peace of  mind", 235, 255, 120);
  
println("Yay!I'm catching up");
}

