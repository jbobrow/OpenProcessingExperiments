
/* @pjs preload="towerbridge.jpg, millennium-bridge.jpg, cheese-grater.jpg, hoxton-eve.jpg, gherkin-river.jpg, shard-river.jpg" ; */

/* interactive postcard, click on strips on the left to change image
*
*/
/* @pjs font="GOTHIC.ttf"; */ 

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;
String selected;

String message = "Hello from London! Hello world!";

PFont myFont;

void setup() {
  size(1020, 720);
  frameRate(8);
  background(0);
  selected = "shard-river.jpg";
  
  img1 = loadImage("towerbridge.jpg");
  img2 = loadImage("millennium-bridge.jpg");
  img3 = loadImage("cheese-grater.jpg");
  img4 = loadImage("hoxton-eve.jpg");
  img5 = loadImage("gherkin-river.jpg");
  img6 = loadImage("shard-river.jpg");
  
  myFont = createFont("GOTHIC.ttf");
  textFont(myFont);
  smooth(8); // enable antialiasing

}

void draw() {
  img7 = loadImage(selected);
  image(img1, 0, 0);
  image(img2, 20, 0);
  image(img3, 40, 0);
  image(img4, 60, 0);
  image(img5, 80, 0);
  image(img6, 100, 0);
  image(img7, 120, 0);
  
  int x = 10;
  int y = 70;
  for (int i = 0; i < message.length(); i++) {
    float rad = radians(i*9);
    textSize(48);
    text(message.charAt(i), 160 + x + random(-1,1), 240 + (100*sin(rad)) );
    // textWidth() spaces the characters out properly.
    x += textWidth(message.charAt(i)); 
    y = y + 10;
    
  }

  

}

void mouseClicked() {
  if(mouseX >= 0 && mouseX < 20){
    selected = "towerbridge.jpg";
  }
  if(mouseX >= 20 && mouseX < 40){
    selected = "millennium-bridge.jpg";
  }
  if(mouseX >= 40 && mouseX < 60){
    selected = "cheese-grater.jpg";
  }
  if(mouseX >= 60 && mouseX < 80){
    selected = "hoxton-eve.jpg";
  }
  if(mouseX >= 80 && mouseX < 100){
    selected = "gherkin-river.jpg";
  }
  if(mouseX >= 100 && mouseX < 120){
    selected = "shard-river.jpg";
  }
  img7 = loadImage(selected);
 // println(selected);
}




