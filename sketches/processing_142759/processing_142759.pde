
//Haiku by Luis Silva
//words
String[] oneSyllable = {
  "Red", "Stone", "Mask", "Stand", "Cars", "Star", "Wham", "Pose", "Fight"
};
String[] twoSyllable = {
  "JoJo", "Bizarre", "DIO", "Joseph", "Jolyne", "Caesar", "Josuke", "MUDA", "Giorno", "ORA"
};
String[] threeSyllable = {
  "Adventure", "Jotaro", "Jonathan", "ZA WARUDO", "Platinum", "Speedwagon", "Polnareff"
};
//images
PImage photo1; //Background


//font
PFont font;

void setup() {
  size(700, 700);
  smooth();
  background(0);
}

void draw() {

  photo1 = loadImage("background.png");
  imageMode(CENTER);
  image(photo1, width/2, height/2);

  String firstLine = twoSyllable[(int)random(twoSyllable.length)] + 
    " " + threeSyllable[(int)random(threeSyllable.length)];
  String secondLine = threeSyllable[(int)random(threeSyllable.length)] + 
    " " + threeSyllable[(int)random(threeSyllable.length)] + 
    " " + oneSyllable[(int)random(oneSyllable.length)];
  String thirdLine = twoSyllable[(int)random(twoSyllable.length)] + 
    " " + twoSyllable[(int)random(twoSyllable.length)] + 
    " " + oneSyllable[(int)random(oneSyllable.length)];

  println(firstLine);
  println(secondLine);
  println(thirdLine);


  font = loadFont("Verdana-Bold-48.vlw");
  textFont(font, 32);
  textAlign(CENTER);
  fill(200, 247, 100);
  text(firstLine, width/2, height/2-100);
  fill(245, 88, 27);
  text(secondLine, width/2, height/2);
  fill(164, 242, 232);
  text(thirdLine, width/2, height/2+100);

  noLoop();
}



