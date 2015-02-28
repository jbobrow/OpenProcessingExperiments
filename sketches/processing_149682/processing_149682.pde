
/* konkuk University
 Department of Dynamic Media
 SOS iDesign
 Name : LEE HeaRin
 ID : 201420102
 */
import ddf.minim.*;

Minim minim;
AudioPlayer backsong;
AudioPlayer corner1;
AudioPlayer corner2;
AudioPlayer corner3;
AudioPlayer corner4;

float x1, y1, x2, y2;
float d2map;

boolean switchStroke = true;
boolean switchRotation = true;
boolean onOff = true;
boolean backGround = true;

// ============================================
void setup() {
  //size(600, 600);
  size(displayWidth, displayHeight);
  smooth();
  background(255, 0, 0);
  frameRate(20);
  
  noCursor();
  
  mouseX=width/2;
  mouseY=height/2;
  
  // Load an audio file into the player
  minim = new Minim (this);
  backsong = minim.loadFile("15-Organs. Screams. Televisions.mp3");
  corner1 = minim.loadFile("01-Young Generation.mp3");
  corner2 = minim.loadFile("05-Rebellion.mp3");
  corner3 = minim.loadFile("Anthem For The Wild Souls.mp3");
  corner4 = minim.loadFile("03-Brooklyn.mp3");
  
  
  //backsong.play();
}

// ============================================
void draw() {
  //background(255, 0, 0);
  noStroke();
  fill(255, 0, 0, 10);
  rect(0, 0, width, height);


  float d = backsong.mix.level() * 250;
  float d2 = corner1.mix.level() * 250;
  float d3 = corner2.mix.level() * 250;
  float d4 = corner3.mix.level() * 250;
  float d5 = corner4.mix.level() * 250;

  
  
  d2map = map(d2, 0,255, 255, 0);
  
  noStroke();
  strokeWeight(1);
  // Corners
  fill(255, 255, 0);
  triangle(0, 0, 30, 0, 0, 30);
  triangle(0, height, 30, height, 0, height-30);
  triangle(width, height, width-30, height, width, height-30);
  triangle(width, 0, width-30, 0, width, 30);

  stroke(0);
  noFill();
  //fill(#000000,d2map);
  quad(0, y1, width-x1, height, x1, y1, x1, 0);
  stroke(255);
  //fill(#FFFFFF,d2map);
  quad(0, y2, width-x2, height, x2, y2, x2, 0);

  //fill(#FFFFFF,d2map);
  stroke(255);
  quad(x1, 0, width, height-y1, x1, y1, 0, height-y1);
  stroke(0);
  //fill(#000000,d2map);
  quad(x2, 0, width, height-y2, x2, y2, 0, height-y2);

  x1 = lerp(x1, mouseX, 0.05);
  y1 = lerp(y1, mouseY, 0.05);
  x2 = lerp(x2, mouseX, 0.1);
  y2 = lerp(y2, mouseY, 0.1);

  // Switch
  if (mouseX<30 && mouseY<30) corner1.play();
  if (mouseX>50 && mouseY>50) corner2.play();
  if (mouseX<-30 && mouseY<30) corner3.play();
  if (mouseX>-50 && mouseY>-50) corner4.play();

  
  
 
  //title();
}

// ============================================
void title() {
  fill(0);
  textAlign(RIGHT);
  text("LEE Hearin, Untitled, Dynamic Media, 2014", width-50, height-20);
}
