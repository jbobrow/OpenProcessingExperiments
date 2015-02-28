
PShape typewriter;
PShape fan;
PShape camera1;
PShape radio;
PShape tv;
PShape phone;
PShape phonogram;
PShape projector;
PImage bg1;
PImage bg2;
PImage bg3;
PImage bg4;
PImage bg5;
PImage bg6;
PImage bg7;
PImage bg8;
PImage bg9;
PImage bg10;


float x, y, r, s;

void setup(){
  size(640, 480);
  smooth();
  typewriter = loadShape("typewriter.svg");
  fan = loadShape("fan.svg");
  camera1 = loadShape("camera.svg");
  radio = loadShape("radio.svg");
  tv = loadShape("tv.svg");
  phone = loadShape("phone.svg");
  phonogram = loadShape("phonogram.svg");
  projector = loadShape("projector.svg");
  bg1 = loadImage("bg1a.jpg");
  bg2 = loadImage("bg2.jpg");
  bg3 = loadImage("bg3.jpg");
  bg4 = loadImage("bg4.jpg");
  bg5 = loadImage("bg5.jpg");
  bg6 = loadImage("bg6.jpg");
  bg7 = loadImage("bg7.jpg");
  bg8 = loadImage("bg8.jpg");
  bg9 = loadImage("bg9.jpg");
  bg10 = loadImage("bg10.jpg");
  
  
  
  noLoop();
  //shapeMode(CENTER, CORNER);
}

void draw(){
  //background(255);
  //typewriter.disableStyle();//ignores fill stroke
  //fill(255, 204, 0); //fill as yellow
  //shape(typew, width/2, height/2);//can do neg bounding box
  //divide by 2 puts in mid screen
  //shape(bot, 200, 0, 50, 100); //change height, width

  imageMode(CENTER);
   //background imagesssss  
  //x = 100;
  //y = 100;
  //s = random(0.2, 0.5);
  //r = random(0, TWO_PI);
  //pushMatrix();
  //translate(x, y);
  //rotate(r);
  scale(1.0);
  int bgNum = (int)random(0,9);
  if (bgNum == 0){
    image(bg1, width/2, height/2);
  } 
  else if (bgNum == 1) {
    image(bg2, width/2, height/2);
  }
  else if (bgNum == 2) {
     image(bg3, width/2, height/2);
  }
  else if (bgNum == 3) {
    image(bg4, width/2, height/2);
  }
  else if (bgNum == 4) {
    image(bg5, width/2, height/2);
  }
  else if (bgNum == 5) {
    image(bg6, width/2, height/2);
  }
  else if (bgNum == 6) {
    image(bg7, width/2, height/2);
  }
  else if (bgNum == 7) {
    image(bg8, width/2, height/2);
  }
  else if (bgNum == 8) {
    image(bg9, width/2, height/2);
  }
  else if (bgNum == 9) {
    image(bg10, width/2, height/2);
  }
  
  
  //popMatrix();
  
  
  //APPLIANCES
  
 shapeMode(CENTER);
  
  x = 500;
  y = 50;
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
  
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
  
  //GROUP REPEATS BELOW, typewriter to projector
    //GROUP REPEATS BELOW
      //GROUP REPEATS BELOW
      
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
      
  
  
    // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.2, 0.5);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
  
  //GROUP REPEAT 2
 //GROUP REPEAT 2
  
  shapeMode(CENTER);
  
  x = 40;
  y = 375;
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
  
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
   s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
  
  //GROUP REPEATS BELOW, typewriter to projector
    //GROUP REPEATS BELOW
      //GROUP REPEATS BELOW
      
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
      
  
  
    // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.5, 0.8);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
  
  //GROUP IN BOTTOM RIGHT SMALL
  shapeMode(CENTER);
  
  x = 460;
  y = 460;
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
  
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
   s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
  
  //GROUP REPEATS BELOW, typewriter to projector
    //GROUP REPEATS BELOW
      //GROUP REPEATS BELOW
      
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
      
  
  
    // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
  
  //GROUP BOTTOM LEFT SMALL AGAIN
  
    shapeMode(CENTER);
  
  x = 400;
  y = 300;
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
  
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
   s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
  
  //GROUP REPEATS BELOW, typewriter to projector
    //GROUP REPEATS BELOW
      //GROUP REPEATS BELOW
      
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(typewriter, -typewriter.width/2, -typewriter.height/2);
  popMatrix();
      
  
    // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(fan, -fan.width/2, -fan.height/2);
  popMatrix();
  

  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(camera1, -camera1.width/2, -camera1.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(radio, -radio.width/2, -radio.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(tv, -tv.width/2, -tv.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phone, -phone.width/2, -phone.height/2);
  popMatrix();
  
 // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(phonogram, -phonogram.width/2, -phonogram.height/2);
  popMatrix();
  
  // x = random(width);
  x = x + random(-100,100);
  y = y + random(-100,100);
 // y = random(height);
  s = random(0.1, 0.4);
  r = random(0, TWO_PI);
  pushMatrix();
  translate(x, y);
  rotate(r);
  scale(s);
  shape(projector, -projector.width/2, -projector.height/2);
  popMatrix();
}
  
  void mousePressed() {   
  redraw(); 
  }


