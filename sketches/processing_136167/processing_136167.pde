
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/46607*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
// data visualisation for cooking
// matching calories with quantities of a certain type of food


import controlP5.*;

ControlP5 cp5;

String lines[];
PFont font;
String food[], units[];
int amount[];
float calories[];
int[] daily;

int selectedFood = 0, start = 0, dailyCalories = 2000;

color[] circlecolour = { 
  #3c5f96, #3e4c81, #597780, #59c3e2, #3c5f96, #2c3342, #4b819a, #979393, #3e4c81, #59c3e2, #3d4524, #3e4c81, #597780, #59c3e2, #3c5f96, #2c3342, #4b819a, #979393, #3e4c81, #59c3e2, #3d4524, #3e4c81, #597780, #59c3e2, #3c5f96, #2c3342, #4b819a, #979393, #3e4c81, #59c3e2, #3d4524, #3e4c81, #597780, #59c3e2, #3c5f96, #2c3342, #4b819a, #979393, #3e4c81, #59c3e2
};


PImage iaac;
PImage logo;
PImage circle;

void setup() {


  size(1600, 1000);
  smooth();
  noStroke();
  //noLoop();
  //font = loadFont("Aller-Regular-13.vlw");
  //textFont(font, 20);
  textSize(25);
  textLeading(35);
  iaac = loadImage("iaac_a.png");
  color toolback = color(100, 100, 80, 100);
  cp5 = new ControlP5(this);
  logo = loadImage("logotest.png");
  circle = loadImage("circle.png");

  //ALL THE BUTTONS ARE DEFINED


  PImage[] a1 = {
    loadImage("1_a.png"), loadImage("1_b.png"), loadImage("1_c.png"),
  };
  cp5.addButton("b1")
    .setValue(128)
      .setPosition(400, 160)
        .setSize(90, 90)
          .setImages(a1)
            .updateSize()
              ;


  PImage[] a2 = {
    loadImage("2_a.png"), loadImage("2_b.png"), loadImage("2_c.png"),
  };

  cp5.addButton("b2")
    .setValue(128)
      .setPosition(600, 230)
        .setSize(90, 90)
          .setImages(a2)
            .updateSize()
              ;

  PImage[] a3 = {
    loadImage("3_a.png"), loadImage("3_b.png"), loadImage("3_c.png"),
  };

  cp5.addButton("b3")
    .setValue(128)
      .setPosition(480, 275)
        .setSize(90, 90)
          .setImages(a3)
            .updateSize()
              ;

  PImage[] a4 = {
    loadImage("4_a.png"), loadImage("4_b.png"), loadImage("4_c.png"),
  };

  cp5.addButton("b4")
    .setValue(128)
      .setPosition(460, 380)
        .setSize(90, 90)
          .setImages(a4)
            .updateSize()
              ;

  PImage[] a5 = {
    loadImage("5_a.png"), loadImage("5_b.png"), loadImage("5_c.png"),
  };

  cp5.addButton("b5")
    .setValue(128)
      .setPosition(880, 135)
        .setSize(90, 90)
          .setImages(a5)
            .updateSize()
              ;

  PImage[] a6 = {
    loadImage("6_a.png"), loadImage("6_b.png"), loadImage("6_c.png"),
  };

  cp5.addButton("b6")
    .setValue(128)
      .setPosition(1045, 140)
        .setSize(90, 90)
          .setImages(a6)
            .updateSize()
              ;


  PImage[] a7 = {
    loadImage("7_a.png"), loadImage("7_b.png"), loadImage("7_c.png"),
  };

  cp5.addButton("b7")
    .setValue(128)
      .setPosition(1210, 200)
        .setSize(90, 90)
          .setImages(a7)
            .updateSize()
              ;


  PImage[] a8 = {
    loadImage("8_a.png"), loadImage("8_b.png"), loadImage("8_c.png"),
  };

  cp5.addButton("b8")
    .setValue(128)
      .setPosition(925, 250)
        .setSize(90, 90)
          .setImages(a8)
            .updateSize()
              ;

  PImage[] a9 = {
    loadImage("9_a.png"), loadImage("9_b.png"), loadImage("9_c.png"),
  };

  cp5.addButton("b9")
    .setValue(128)
      .setPosition(1080, 275)
        .setSize(90, 90)
          .setImages(a9)
            .updateSize()
              ;

  PImage[] a10 = {
    loadImage("10_a.png"), loadImage("10_b.png"), loadImage("10_c.png"),
  };

  cp5.addButton("b10")
    .setValue(128)
      .setPosition(1210, 340)
        .setSize(90, 90)
          .setImages(a10)
            .updateSize()
              ;

  PImage[] a11 = {
    loadImage("11_a.png"), loadImage("11_b.png"), loadImage("11_c.png"),
  };

  cp5.addButton("b11")
    .setValue(128)
      .setPosition(1335, 380)
        .setSize(90, 90)
          .setImages(a11)
            .updateSize()
              ;

  PImage[] a12 = {
    loadImage("12_a.png"), loadImage("12_b.png"), loadImage("12_c.png"),
  };

  cp5.addButton("b12")
    .setValue(128)
      .setPosition(1015, 380)
        .setSize(90, 90)
          .setImages(a12)
            .updateSize()
              ;

  PImage[] a13 = {
    loadImage("13_a.png"), loadImage("13_b.png"), loadImage("13_c.png"),
  };

  cp5.addButton("b13")
    .setValue(128)
      .setPosition(990, 550)
        .setSize(90, 90)
          .setImages(a13)
            .updateSize()
              ;

  PImage[] a14 = {
    loadImage("14_a.png"), loadImage("14_b.png"), loadImage("14_c.png"),
  };

  cp5.addButton("b14")
    .setValue(128)
      .setPosition(1170, 590)
        .setSize(90, 90)
          .setImages(a14)
            .updateSize()
              ;

  PImage[] a15 = {
    loadImage("15_a.png"), loadImage("15_b.png"), loadImage("15_c.png"),
  };

  cp5.addButton("b15")
    .setValue(128)
      .setPosition(1345, 535)
        .setSize(90, 90)
          .setImages(a15)
            .updateSize()
              ;


  PImage[] a16 = {
    loadImage("16_a.png"), loadImage("16_b.png"), loadImage("16_c.png"),
  };

  cp5.addButton("b16")
    .setValue(128)
      .setPosition(1300, 650)
        .setSize(90, 90)
          .setImages(a16)
            .updateSize()
              ;

  PImage[] a17 = {
    loadImage("17_a.png"), loadImage("17_b.png"), loadImage("17_c.png"),
  };

  cp5.addButton("b17")
    .setValue(128)
      .setPosition(1060, 720)
        .setSize(90, 90)
          .setImages(a17)
            .updateSize()
              ;

  PImage[] a18 = {
    loadImage("18_a.png"), loadImage("18_b.png"), loadImage("18_c.png"),
  };

  cp5.addButton("b18")
    .setValue(128)
      .setPosition(1060, 860)
        .setSize(90, 90)
          .setImages(a18)
            .updateSize()
              ;

  PImage[] a19 = {
    loadImage("19_a.png"), loadImage("19_b.png"), loadImage("19_c.png"),
  };

  cp5.addButton("b19")
    .setValue(128)
      .setPosition(925, 800)
        .setSize(90, 90)
          .setImages(a19)
            .updateSize()
              ;

  PImage[] a20 = {
    loadImage("20_a.png"), loadImage("20_b.png"), loadImage("20_c.png"),
  };

  cp5.addButton("b20")
    .setValue(128)
      .setPosition(865, 695)
        .setSize(90, 90)
          .setImages(a20)
            .updateSize()
              ;

  PImage[] a21 = {
    loadImage("21_a.png"), loadImage("21_b.png"), loadImage("21_c.png"),
  };

  cp5.addButton("b21")
    .setValue(128)
      .setPosition(690, 875)
        .setSize(90, 90)
          .setImages(a21)
            .updateSize()
              ;

  PImage[] a22 = {
    loadImage("22_a.png"), loadImage("22_b.png"), loadImage("22_c.png"),
  };

  cp5.addButton("b22")
    .setValue(128)
      .setPosition(570, 785)
        .setSize(90, 90)
          .setImages(a22)
            .updateSize()
              ;

  PImage[] a23 = {
    loadImage("23_a.png"), loadImage("23_b.png"), loadImage("23_c.png"),
  };

  cp5.addButton("b23")
    .setValue(128)
      .setPosition(610, 650)
        .setSize(90, 90)
          .setImages(a23)
            .updateSize()
              ;

  PImage[] a24 = {
    loadImage("24_a.png"), loadImage("24_b.png"), loadImage("24_c.png"),
  };

  cp5.addButton("b24")
    .setValue(128)
      .setPosition(425, 800)
        .setSize(90, 90)
          .setImages(a24)
            .updateSize()
              ;

  PImage[] a25 = {
    loadImage("25_a.png"), loadImage("25_b.png"), loadImage("25_c.png"),
  };

  cp5.addButton("b25")
    .setValue(128)
      .setPosition(460, 675)
        .setSize(90, 90)
          .setImages(a25)
            .updateSize()
              ;

  PImage[] a26 = {
    loadImage("26_a.png"), loadImage("26_b.png"), loadImage("26_c.png"),
  };

  cp5.addButton("b26")
    .setValue(128)
      .setPosition(330, 670)
        .setSize(90, 90)
          .setImages(a26)
            .updateSize()
              ;

  PImage[] a27 = {
    loadImage("27_a.png"), loadImage("27_b.png"), loadImage("27_c.png"),
  };

  cp5.addButton("b27")
    .setValue(128)
      .setPosition(425, 550)
        .setSize(90, 90)
          .setImages(a27)
            .updateSize()
              ;

  //ALL THE BUTTONS ARE DEFINED END



  // Array: 0 Food / 1 Units / 2 Amount / 3 Calories

  lines = loadStrings("nutrients.csv");

  food = new String[lines.length];
  units = new String[lines.length];
  amount = new int[lines.length];
  calories = new float[lines.length];

  daily = new int[0];

  for (int i = 1; i<lines.length; i++) {
    String thisline[] = split(lines[i], ",");

    // remove 1 to i each time to cancel the CSV header		

    food[i-1] = thisline[0];
    units[i-1] = thisline[1];
    amount[i-1] = int(thisline[2]);
    calories[i-1] = float(thisline[3]);
  }
}





void draw() {
  background(25);
  textLeading(35);






  // Draw the list for all items

  //for (int j = 0; j < lines.length; j++) {
  // Highlight the current item in red
  // if (selectedFood== j) fill(0, 0, 255);
  // else fill (255);
  //  textLeading(40);
  //  text(food[j] + " ", 20, 20 * j+120 + (selectedFood * 20)*(-1));
  // }


  // Write the text for the currently selected item

  // fill(255);
  //textLeading(32);
  //text(char(0x21D2) + " " + amount[selectedFood] + " " + units[selectedFood] + " uses " + floor(calories[selectedFood]) + " Liters of Water to produce", 230, 120);



  // Draw the circles
  noStroke();

  int caloriesStack = 0;

  for (int i = 0; i < daily.length; i++) {
    fill(circlecolour[i], 40);

    float mapX = map(calories[daily[i]] + caloriesStack, 10, dailyCalories, 10, 300);
    ellipse(width/2, height/2, mapX, mapX);

    caloriesStack += calories[daily[i]];
  }


  // Draw the outer circle (limit)
  noFill();
  stroke(255);
  ellipse(width/2, height/2, 300, 300);




  // Draw the selected daily items List

  for (int k = 0; k < daily.length; k++) {
    fill(circlecolour[k]);
    textSize(20);
    text( " " + units[daily[k]] + " of " + food[daily[k]] + " uses " + floor(calories[daily[k]]) + " Liters", 10, 150 + k*30);
  }




  // DRAW THE INFORMATION ON THE CENTER
  //FOR EVERY ITEM SEPERATELY

  if ((cp5.isMouseOver(cp5.getController("b1")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(400+45, 160+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textSize(15);
    textAlign(CENTER);
    text("The water footprint \nof pure Cocholate is 2.400liters/bar\nBased on the composition\n 40% cocholate paste\n (water footprint 33260l/kg)\n 20% cocao butter\n (water footprint 50,700lt/kg)\n 40% Sugar\n (water footprint 1500 l/kg)\n", width/2, height/2-85);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b2")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(600+45, 230+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("To produce 1 kilogram \nof cheese 10 kilograms\nof milk are needed\nThe water required to produce this milk\n is 10000 litres", width/2, height/2-50);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b3")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(480+45, 275+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("The water footprint for 1kg\n of potatos is 250 lt.\n A bag of potato crisps (200g)\n has a water footprint of\n185 litres \n based on 900 litres for one kg\n of potato flakes", width/2, height/2-70);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b4")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(460+45, 380+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("Rice fileds of the world\n consume about 1350 billion m³\n of water annually, which is\n 21% of the global water use\n for crops", width/2, height/2-50);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b5")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(880+45, 135+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("Bread uses 1600 liters of\n of water for 1 kilogram", width/2, height/2-20);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b6")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1045+45, 140+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("One mozerella pizza requires\n 750 liters of water to \n produce all the ingredients", width/2, height/2-20);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b7")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1210+45, 200+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("1 kilogram of tomatos has a \n water footprint of 180 litres on \naverage.The virtual water content\n of tomatoes depends on their origin\n Spanish tomatoes have\nway bigger footprint\n than Dutch tomatos", width/2, height/2-65);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b8")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(925+45, 250+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("Most of the water is\n needed for the production of the\nbeef contained in the hamburger\n This calculation\n assumes that about 150g \nof beef are in one burger", width/2, height/2-50);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b9")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1080+45, 270+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("Producing wheat requires 1300\n litres of water per kilogram\n One slice of bread has a weight\nabout 30g which implies a water footprint\nof 40 liters. Consumed with one slice\n of cheese it requires\n 90 liters of water", width/2, height/2-80);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b10")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1210+45, 340+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("Producing a glass of milk\n(200ml) requires about 200 liters of\nwater\nDrinking orange juice would require \n170 liters of water.", width/2, height/2-35);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b11")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1335+45, 380+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("To produce 1 kilogram of\nfresh tea leaves 2400 liters of\nwater are required\nA standard cup of tea requires\nthree grams of black tea\n so that one cup of tea\nhas a water footprint of 30 litres", width/2, height/2-80);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b12")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1015+45, 380+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("It costs about 21000 litres\nof water to produce\none kilogram of roasted coffee\nFor a standard cup of coffee\n7g of roasted coffee is needed\n It needs more than 1100 drops\n of water to produce one drop \nof coffee ", width/2, height/2-80);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b13")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(990+45, 550+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("Most of the water required\nfor wine is for producing the grapes\nthe water required to produce\n the bottle is not \n115liters per glass", width/2, height/2-40);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b14")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1170+45, 590+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("Most of the water required\nfor beer is for producing the barley\nthe water required to produce\n the bottle is not included\n99liters per bottle", width/2, height/2-40);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b15")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1345+45, 535+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("The exact amount of water depends\n on the origin and variety\nof the orange\nOne glass of orange juice\ncosts about 170liters of\nwater", width/2, height/2-40);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b16")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1300+45, 650+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("On average about 700 liters\nof water are needed to produce\none kilogram of apples\nThe exact amount depends on the origin\nOne glass of apple juice(200ml)\n requires about\n190 liters of water", width/2, height/2-55);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b17")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1060+45, 720+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("One kilogram of bananas\nhas a water footprint of 860 litres\nBananas are the crop by far\nthe largest interprovincial water\n flow relative to the\nwater use for production", width/2, height/2-55);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b18")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(1060+45, 860+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("One can(330ml) of CocaCola\n needs about 24 liters\nof water to produce\nMost of this water is consumed\n by sugar\nproduction and packaging", width/2, height/2-50);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b19")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(925+45, 800+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("1 bottle (500ml) of bottled\n drinking water\nrequires 7 liters of water to produce\nThis includes the plastic\n bottle production", width/2, height/2-50);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b20")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(865+45, 695+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("By industrial standards\n it takes ten weeks before\n the chcken is slaughtered\nIt will produce 1.7kg of meat\nA chicken consumes about3.3 kgs\nof grains and 30liters of water\nmeaning 1 kg chicken meat\n has needs 3900 liters of water ", width/2, height/2-80);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b21")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(690+45, 875+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textSize(15);
    textAlign(CENTER);
    text("Olives require 3000 liters\nto produce 1 kilograms", width/2, height/2);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b22")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(570+45, 785+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textAlign(CENTER);
    textSize(15);
    text("By industrial standards\n it takes about ten months\n before a pig is slaughtered\nA pig comsumes about 385 kg of grains\n and 11 m3 of water drinking\nand servicing the farmhouse\nApproximately 10 m3 of water are used\nduring the slaughter processes\nTo produce the feed\n 435 m3 water is used", width/2, height/2-90);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b23")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(610+45, 650+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textSize(15);
    textAlign(CENTER);
    text("In an industrial sheep\n farming system\nit takes 18 months on average\n before a sheep is slaughtered\nThe sheep produces 28kg of fresh carcass\ntogether with wool\nA sheep consumes about 40kg\n of grains and 4m3 of water for\n drinking and servicing\n the farmhouse", width/2, height/2-90);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b24")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(425+45, 800+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textSize(15);
    textAlign(CENTER);
    text("In an industrial farming system\n it takes an average of two years\nbefore the goat is slaughtered\nIt will produce 20 kg of fresh goat meat\nDuring its lifetime the goat consumes\n 55 kg grains 165 kg of roughages and\n 3.5m3 water for drinking and\nProducing 55 kg of feed \nof this composition\ntake 80 m3 of water", width/2, height/2-90);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b25")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(460+45, 675+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textSize(15);
    textAlign(CENTER);
    text(" As a global average, eggs require\nabout 3,300 m3 of water per ton\nMoist of its required for feeding\nthe chicken with a highly\nenriched grain composition.", width/2, height/2-25);
    textAlign(LEFT);
  }
  if ((cp5.isMouseOver(cp5.getController("b26")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(330+45, 670+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textSize(15);
    textAlign(CENTER);
    text("In an industrial\nbeef production system, it takes \n three years before an animal is slaughtered\nto produce about 200 kg of boneless beef\nThe animal consumes nearly 1,200 kg of grain\n7,200 kg of roughages 24 m3 of water\nfor drinking and 7m3 of water for serving\nTo produce 1kg of boneless beef\nwe use about 6,5 kg grain, 36kgroughages\nand 155 litres of water", width/2, height/2-110);
    textAlign(LEFT);
  }

  if ((cp5.isMouseOver(cp5.getController("b27")))  == true) {
    strokeWeight(2);
    stroke(100, 1000, 1000, 100);
    line(425+45, 550+45, width/2, height/2);
    fill(150, 120, 100, 10);
    noStroke();
    ellipse ( width/2, height/2, 300, 300);
    fill(255, 255, 255);
    textSize(15);
    textAlign(CENTER);
    text("1 portion of salat uses\n50 liters of water", width/2, height/2);
    textAlign(LEFT);
  }



  // DRAW THE INFORMATION ON THE CENTER
  //FOR EVERY ITEM SEPERATELY END

  // Draw instructional text
  // at the top

  noStroke();
  fill(0, 64, 82, 100);
  rect(0, 0, width, 95);
  fill(255);
  // Write the total number of calories
  // If it is over the daily limit, show it in red

  image(circle, 1240, -100);

  fill(255);
  line(310, 950, 500, 950);
  textSize(70);
  textAlign(RIGHT);
  text( + caloriesStack + " lt", 1560, 70);
  textAlign(LEFT);
  textSize(33);
  text( "Water used for production of your food and beverages you consumed today: ", 20, 70);

  //textLeading(25);
  // text("Select the items you consumed today to calculate your water footprint\nUse the " + char(0x2191) + " and " + char(0x2193) + " arrows to choose a product\nHit Enter/Return to add the selected product to your daily list, Backspace to delete the last item\n", 20, 30);

  //draw iaac logo on the corner
  //logo on the corner
  image(iaac, 1340, 900);
  image(logo, 0, 830);
}






//Add Daily Water Footprint on each button

public void b1(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood);
}



public void b2(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+1);
}

public void b3(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+2);
}

public void b4(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+3);
}


public void b5(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+4);
}

public void b6(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+5);
}

public void b7(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+6);
}

public void b8(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+7);
}

public void b9(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+8);
}

public void b10(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+9);
}

public void b11(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+10);
}

public void b12(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+11);
}

public void b13(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+12);
}

public void b14(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+13);
}

public void b15(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+14);
}

public void b16(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+15);
}

public void b17(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+16);
}

public void b18(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+17);
}

public void b19(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+18);
}

public void b20(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+19);
}

public void b21(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+20);
}

public void b22(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+21);
}

public void b23(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+22);
}

public void b24(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+23);
}

public void b25(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+24);
}
public void b26(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+25);
}

public void b27(int theValue) {
  println("a button event from buttonB: "+theValue);

  daily = append(daily, selectedFood+26);
}



void keyPressed() {

  // Move in the list

  if (keyCode == 38 && selectedFood > 0)
    selectedFood--;

  if (keyCode == 40)
    selectedFood++;



  // Change the personal daily calories needs

  if (keyCode == 39 && dailyCalories < 6000)
    dailyCalories += 50;

  if (keyCode == 37 && dailyCalories > 200)
    dailyCalories -= 50;




  // Add or delete an item to/from the list

  if ((keyCode == ENTER || keyCode == RETURN) && daily.length < 10)
    daily = append(daily, selectedFood);

  if (keyCode == BACKSPACE && daily.length > 0)
    daily = shorten(daily);
}


//restart the app
//void keyReleased()
//{
// if (key==' ') setup();
// if (key==' ') draw();
//}




//draw iaac logo on the corner


