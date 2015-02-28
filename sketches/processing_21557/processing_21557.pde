
PFont conrecords, band_names;
PImage img1, img3;
PShape img2, img4, img5;


void setup() {
  size(640, 480);
  smooth();

  img1= loadImage("space.png");
  img3= loadImage("circle.png");
  img2= loadShape ("borders.svg");
  img4= loadShape("constellation.svg");
  img5= loadShape("stars.svg");
  conrecords= loadFont("conrecords.vlw");
  band_names= loadFont("band_names.vlw");
}

void draw() {
  image(img1,0,0);
  image(img3,0,0);
  shape(img2,0,-70);
  shape(img4,0,-70);
  superstars();
  
 
//  STARS
  if (mousePressed ==true) {
    shape(img5,0,-70);
  }
 
//  CONSTELLATION RECORDS
  fill(255);
  textFont(conrecords);
  textSize(38);
  text("Constellation Records",63,70,800,800);


//  LIST OF BANDS
if (mouseY > 192 && mouseY < 392  || mouseX > 522 && mouseX < 110 ) {
   textFont(band_names);
   textSize(15);
   text("Godspeed You! Black Emperor", 111,190,800,800);
}

if (mouseY > 125 && mouseY < 165  || mouseX > 500 && mouseX < 150 ) {
   textFont(band_names); 
   textSize(15);
   text("Colin Stetson", 230,142,800,800);
}

if (mouseY > 165 && mouseY < 214  || mouseX > 480 && mouseX < 113 ) {
   textFont(band_names); 
   textSize(15);
   text("SISKIYOU", 499,220,800,800);
}

if (mouseY > 214 && mouseY < 277  || mouseX > 530 && mouseX < 117) {
   textFont(band_names); 
   textSize(12);
   text("DO MAKE SAY THINK", 393,250,800,800);
}

if (mouseY > 277 && mouseY < 309  || mouseX > 530 && mouseX < 117) {
   textFont(band_names); 
   textSize(15);
   text("Polmo Polpo", 174,293,800,800);
}

if (mouseY > 309 && mouseY < 336  || mouseX > 508 && mouseX < 125) {
   textFont(band_names); 
   textSize(15);
   text("JEM COHEN", 270,320,800,800);
}

if (mouseY > 336 && mouseY < 378  || mouseX > 502 && mouseX < 142) {
   textFont(band_names); 
   textSize(18);
   text("FLY PAN AM", 386,335,800,800);
}

if (mouseY > 378 && mouseY < 440  || mouseX > 460 && mouseX < 190) {
   textFont(band_names); 
   textSize(15);
   text("The Dead Science", 142,408,800,800);
}

if (mouseY > 440 && mouseY < 459  || mouseX > 389 && mouseX < 262) {
   textFont(band_names); 
   textSize(15);
   text("Thee Silver Mt. Zion", 290,449,800,800);
}
}

//  TWINKLING STARS
   void superstars() {
    frameRate(12);
    fill(255);
    float x= random (150, width-200);
    float y= random (150, height-150);
    ellipse(x,y,8,5);
  }







