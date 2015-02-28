
String message = "I Need A Six Month";
String message0 = "VACATION";
String message1 = "V";
String message3 = "A";
String message4 = "C";
String message5 = "A";
String message6 = "T";
String message7 = "I";
String message8 = "O";
String message9 = "N";
String message10 = "Hawaii";
String message11 = "Tokyo";
String message12 = "Paris";
String message13 = "London";
String message14 = "Beijing";

String message2 = "TWICE A YEAR";
PFont font;
PFont font1;
PFont font2;
PFont font3;

float angle = 0.0;
float offset = 300;
float scalar = 40;
float speed = 0.03;


   float offset2 = 60;
   float scalar2 = 30;
  

void setup() {
  size(600, 600);
  smooth();
  

  font = loadFont("Garamond-Bold-48.vlw");
  font1 = loadFont("Calibri-Bold-108.vlw");
  font2 = loadFont("MyriadPro-Cond-28.vlw");
  font3 = loadFont("GillSansMT-13.vlw");
}

void draw() {
  background(255);
  fill(0);
  textFont(font);
rotate(PI/16);
  ellipse(75, 53,10,10);
  text("I Need A Six Month", 100, 70);
  
  textFont(font3);
  rotate(-PI/16);
  text("Hawaii", 130, 150);
  text("Tokyo", 130, 165);
  text("London", 130, 180);
  text("Beijing", 130, 195);
  text("Paris", 130, 210);
   noFill();
   stroke(0);
  ellipse(400, 430,200,200);
 
line(500,30,100,550);

  if (mousePressed) {
textFont(font1);
    float y1 = offset + sin(angle) * scalar;
    float y2 = offset + sin(angle + 0.4) * scalar;
    float y3 = offset + sin(angle + 0.8) * scalar;
    float y4 = offset + sin(angle + 0.12) * scalar;
    float y5 = offset + sin(angle + 0.46) * scalar;
    float y6 = offset + sin(angle + 0.20) * scalar;
    float y7 = offset + sin(angle + 0.54) * scalar;
    float y8 = offset + sin(angle + 0.18) * scalar;
    
    text("V", 80, y1);
    text ("A", 140, y2);
    text("C",220, y3);
    text("A",280, y4);
    text("T",340, y5);
    text("I",400, y6);
    text("O",440, y7);
    text("N",500, y8);
    
    textFont(font2);
  translate(400, 430);
     rotate(angle);
     text("TWICE A YEAR", -15, -15);
     angle += 0.1;
   

  
    angle += speed;
  }else{
    textFont(font1);
       text("VACATION",80, 320);
  }
  
}



