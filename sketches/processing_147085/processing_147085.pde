
//Store the font
PFont font;

void setup() {
  size(500, 150);
  background(255);

  //loadfont
  font = loadFont("PSLDoungkamolPro-30.vlw");
  //Set the current font
  textFont(font);


  //console
  String firstName="Chosita";
  String secondName="Raksaseree";
  String zipCode="10119";
  String houseNumber="15";
  int age=26;
  float bodySize=1.64;


  println(firstName, secondName, zipCode, houseNumber, age, bodySize);


  //text()
  fill(0);
  textSize(40);
  text("Chosita", 250, 60);
  textSize(40);
  text("Raksaseree", 250, 90);


  //load strings
  textSize(30);

  fill(150, 30, 230);
  text(firstName, 40, 30);
  fill(100, 100, 200);
  text(secondName, 40, 50);
  fill(40, 40, 200);
  text(zipCode, 40, 70);
  fill(10, 100, 10);
  text(houseNumber, 40, 90);
  fill(200, 200, 20);
  text(age, 40, 110);
  fill(200, 100, 10);
  text(bodySize, 40, 130);
}



