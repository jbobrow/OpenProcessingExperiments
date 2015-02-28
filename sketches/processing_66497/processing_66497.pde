
boolean redButton=false;
boolean randomButton=false;
boolean greenButton=false;
boolean blueButton=false;

PFont redFont;




void setup() {
  size(483, 594);
  //background(200,200,0);
  smooth();
  noStroke();
  PImage myImage = loadImage("bald head 1.png");
  imageMode(CENTER);
  image(myImage, width/2, height/2);
  
  redFont = createFont("Helvetica", 24);
  textFont(redFont);
}

void draw() {
  //  fill(0,10); 
  //rect(0,0,width,height);
  
  println("mouseX= " + mouseX + " , " + "mouseY= " + mouseY);


  // red button
  stroke(255, 0, 0);
  noFill();
  ellipse(79, 26, 25, 25);
 //green button
  stroke(0, 255, 0);
  noFill();
  ellipse(115, 55, 25, 25);
  //blue button
  stroke(0,0,255);
  noFill();
  ellipse(385, 24, 25, 25);
  //random button
  stroke(random(255),random(255),random(255));
  noFill();
  ellipse(330, 53, 25,25);
noStroke();


  if (mouseX == 79 && mouseY == 26 && redButton==false) {
    redButton=true; 
    blueButton=false;
    randomButton=false;
    greenButton=false;
  }

  if (redButton == true) {
    fill(255, 0, 0);
    ellipse(mouseX, mouseY, 15, 15);
  }
  
  if (mouseX == 385 && mouseY==24 &&blueButton==false) {
    blueButton=true;
    redButton=false;
    greenButton=false;
    randomButton=false;
  }

  if (blueButton==true) {
    fill(0, 0, 155);
    ellipse(mouseX, mouseY, 15, 15);
  }


  if (mouseX == 115 && mouseY == 55 && greenButton==false) {
    greenButton=true;
    blueButton=false;
    randomButton=false;
    redButton=false;
  }

  if (greenButton == true) {
    fill(0, 255, 0);
    ellipse(mouseX, mouseY, 15, 15);
  }

  if (mouseX == 330 && mouseY == 53 && randomButton==false) {
    randomButton=true;
    blueButton=false;
    greenButton=false;
    redButton=false;
    redButton=false;
  }

  if (randomButton == true) {
    fill(random(255), random(255), random(255));
    ellipse(mouseX, mouseY, 15, 15);
  }
  
  fill(255,0,0);
  text("RED", 10, 35);

fill(0,0,255);
  text("BLUE", 405, 35);  
  
  fill(0, 255, 0);
  text("GREEN", 10, 65);
  
  fill(random(255), random(255), random(255));
  text ("RAINBOW", 350, 65);
}

void mousePressed() {
  PImage myImage = loadImage("bald head 1.png");
  imageMode(CENTER);
  image(myImage, width/2, height/2);
}





