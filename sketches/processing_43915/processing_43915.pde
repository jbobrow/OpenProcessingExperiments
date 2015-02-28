
/**
 * THINGS COUNTER 0.1
 *
 * A project by:
 * 
 * Dante Fusco
 * Mariano Viola
 * Ruggero Castagnola
 * 
 * With the help of:
 *
 * Steffen Klaue
 */

PFont font;
String[] fileContent;
String line;

// Define things names
String[] thingsNames = {
  "cat", "bridge", "student", "mac", "pc", "pen", "car", "boat", "glass", "table"
};

// Define the colors of the categories
color[] thingsColors = {
  color(68, 117, 159), color(68, 159, 137), color(94, 163, 70), color(160, 174, 74), color(68, 117, 159), color(68, 72, 159), color(112, 68, 159), color(161, 69, 145), color(172, 74, 86), color(180, 103, 77)
};

// Define categories arrays
ArrayList cats = new ArrayList(); 
ArrayList bridges = new ArrayList(); 
ArrayList students = new ArrayList(); 
ArrayList macs = new ArrayList(); 
ArrayList pcs = new ArrayList(); 
ArrayList pens = new ArrayList(); 
ArrayList cars = new ArrayList(); 
ArrayList boats = new ArrayList(); 
ArrayList glasses = new ArrayList(); 
ArrayList tables = new ArrayList(); 

// Things array
ArrayList[] things = {
  cats, bridges, students, macs, pcs, pens, cars, boats, glasses, tables
};

// Random generated categories
ArrayList choosed = new ArrayList();

void setup() {

  size(480, 320);
  background(0);

  // Get all lines from textfile only on startup
  //  for(int i = 0; i < fileContent.length; i++){
  //    //println(fileContent[i]);
  //  }
}

void draw() {
  
  // Draw the visual data
  for (int w = 0; w < things.length; w++) {
    int amount = things[w].size();
    Object intArray[] = things[w].toArray();
    for (int z = 0; z < intArray.length; z++) {
      int seed = Integer.parseInt(intArray[z].toString());
      drawData(seed, amount, w);
    }
  }

  // Draw the user interface
  createInterface();

  println("arrays size:"+cats.size() + " " + bridges.size() + " " + students.size() + " " + macs.size() + " " + pcs.size() + " " + pens.size() + " " + cars.size() + " " + boats.size() + " " + glasses.size() + " " + tables.size());
}

/*  TODO    
 
 Fadeout after a delay, fadein after a click
 Change text color for each category
 Reshake function after 10 minutes
 Image snapshot?
 Shake text animation?  */

// Define the user interface
void createInterface() {
  noLoop();
  noStroke();
  fill(0, 130);
  rect(0, 0, width, height);
  font = loadFont("ACaslon-AltSemiboldItalic-36.vlw"); 
  fill(255, 80); 

  textFont(font, 12); 
  text("tap on things that you see around you", 28, 12);

  textFont(font, 36); 
  int lineHeight = 48;
  for (int i = 0; i < 3; i++) {
    float r = random(0, 0.9);
    choosed.add(int(r*10));
    fill(thingsColors[int(r*10)]);
    text(thingsNames[int(r*10)], 28, lineHeight);
    lineHeight +=48;
  }
}

// Click handler
void mouseClicked() {

  // Cathing the event target and add things
  if (mouseY > 28 && mouseY < 60) {
    // Add thing to the related array
    dispatchThings(Integer.parseInt(choosed.get(0).toString()), Integer.toString(month()) + Integer.toString(day()) + Integer.toString(hour()) + Integer.toString(minute()) + Integer.toString(second()));
  } 
  else if (mouseY > 60 && mouseY < 110) {
    // Add thing to the related array
    dispatchThings(Integer.parseInt(choosed.get(1).toString()), Integer.toString(month()) + Integer.toString(day()) + Integer.toString(hour()) + Integer.toString(minute()) + Integer.toString(second()));
  } 
  else if (mouseY > 110 && mouseY < 154) {
    dispatchThings(Integer.parseInt(choosed.get(2).toString()), Integer.toString(month()) + Integer.toString(day()) + Integer.toString(hour()) + Integer.toString(minute()) + Integer.toString(second()));
  }
  
  loop();
  
}

// Distributes things in the related categories 
void dispatchThings(int thing, String timestamp) {
  if (thing == 0) {
    cats.add(timestamp);
  } 
  else if (thing == 1) {
    bridges.add(timestamp);
  } 
  else if (thing == 2) {
    students.add(timestamp);
  } 
  else if (thing == 3) {
    macs.add(timestamp);
  } 
  else if (thing == 4) {
    pcs.add(timestamp);
  } 
  else if (thing == 5) {
    pens.add(timestamp);
  } 
  else if (thing == 6) {
    cars.add(timestamp);
  } 
  else if (thing == 8) {
    boats.add(timestamp);
  } 
  else if (thing == 9) {
    glasses.add(timestamp);
  } 
  else if (thing == 10) {
    tables.add(timestamp);
  }
}

// Seed = timestamp
void drawData(int seed, int amount, int type) {
  
  amount+=60;
  
  println("amount:"+amount + " " + "timestamp:"+seed + " " +"array position:"+type);

  float x, y;
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;
  int f = 0;
  int g = 480;
  int h = 0;
  int d2 = 0;
  int plusamount = 5;

  float angle = 0.0;
  float elldim = (amount*5)/1920;

  // set parameters for type
  if (type == 0) {
    println("drawing a cat...");
    // ellisse colorata con sin()
    colorMode(RGB);
    noStroke();
    for (int r = 0; r < int(width/1.33); r++) {
      x = cos(degrees(angle))*width;
      y = (sin(degrees(angle))*5*seed)/(8*97612.4);
      fill(180, amount*30+(random(-100, 100)), 60, 20);
      ellipse(x, y, elldim, elldim);
      angle += 0.1;
      elldim += 0.125;
    }
  }

  if (type == 1) {
    println("drawing a bridge...");
    // grey ellipse 1
    colorMode(RGB);
    for ( int l = 0; l < int(amount*plusamount); l++) {
      noStroke();
      fill(random(255), random(20, 30));
      ellipse(e, random(40)+(3*seed)/(4*97612.4), random(50), random(50));
      e += int(width/96);
    }
  } 

  if (type == 2) {
    println("drawing a student...");
    // coloured rect 1
    colorMode(HSB);
    for ( int k = 0; k < int(amount*plusamount); k++) {
      strokeWeight(random(49));
      stroke(random(60, 255), random(60, 200), random(60, 255), 30);
      noFill();
      rectMode(CENTER);
      rect(g, (5*seed)/(8*97612.4), random(50), random(50));
      g -= int(width/96);
    }
  } 

  if (type == 3) {
    println("drawing a mac...");
    // coloured rect 2
    colorMode(HSB);
    for ( int o = 0; o < int(amount*plusamount); o++) {
      strokeWeight(random(49));
      stroke(random(60, 255), random(60, 200), random(60, 255), 30);
      noFill();
      rectMode(CENTER);
      rect(d, (3*seed)/(4*97612.4), random(5), random(5));
      d += int(width/96);
    }
  } 

  if (type == 4) {
    println("drawing a pc...");
    // coloured ellipse 1
    colorMode(HSB);
    for ( int j = 0; j < int(amount*plusamount); j++) {
      noStroke();
      fill(random(255), random(255), random(20, 140), 100);
      ellipse(c, random(20)+seed/(4*97612.4), random(50), random(50));
      c += int(width/96);
    }
  } 

  if (type == 5) {
    println("drawing a pen...");
    // yellow ellipse
    colorMode(RGB);
    for ( int i = 0; i < int(amount*plusamount); i++) {
      strokeWeight(random(30));
      stroke(random(200, 250), random(240, 250), 0, random(20, 30));
      line(a, random(10)+seed/(2*97612.4), a+5, height/2);
      a += int(width/96);
    }
  } 

  if (type == 6) {
    println("drawing a car...");
    // coloured rect 3  
    for ( int u = 0; u < int(amount*plusamount); u++) {
      colorMode(RGB);
      strokeWeight(random(49));
      stroke(random(255), random(255), 0, 30);
      noFill();
      rectMode(CENTER);
      rect(d2, (7*seed)/(16*97612.4), random(60), random(60));
      d2 += int(width/96);
    }
  }

  if (type == 7) {
    println("drawing a boat...");
    // coloured ellipse 2
    colorMode(HSB);
    for ( int s = 0; s < int(amount*plusamount); s++) {
      noStroke();
      fill(random(255), random(255), random(255), 30);
      ellipse(b, (3*seed)/(8*97612.4), random(70), random(70));
      b += int(width/96);
    }
  } 

  if (type == 8) {
    println("drawing a glass...");
    // black lines direction up
    colorMode(RGB);
    for ( int m = 0; m < int(amount*plusamount); m++) {
      strokeWeight(random(1, 2));
      stroke(10);
      line(f, random(seed/(10.7*97612.4))+5*height/8, f+5, 5*height/8);
      f += int(width/96);
    }
  } 

  if (type == 9) {
    println("drawing a table...");
    // black lines direction down480
    colorMode(RGB);
    for ( int n = 0; n < int(amount*plusamount); n++) {
      strokeWeight(random(1, 2));
      stroke(width/48);
      line(h, ((5*seed)/(8*97612.4))-random(width/9.6)-width/48, h+(width/96), (5*height/8)-width/48);
      h += int(width/96);
    }
  }
}


