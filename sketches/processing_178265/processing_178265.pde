
//import "Minim" library files
import ddf.minim.*;

//Declare global variables
Minim minim;
//AudioSample midi;
AudioSample hallo;
AudioSample dongdong;
AudioSample ohoh;
AudioSample ciao;
PImage scarpa001;
PImage scarpa002;
PImage scarpa000;
int _num = 50;


void setup() {
  size(1280, 720);
  background(255);
  
//Load audio file from HDD
  minim = new Minim(this);
  //midi = minim.loadSample("midi.wav");   
  hallo = minim.loadSample("hallo.wav");   
  dongdong = minim.loadSample("dongdong.wav"); 
  ohoh = minim.loadSample("ohoh.wav"); 
  ciao = minim.loadSample("ciao.wav"); 
  
//Load images from HDD
  scarpa000 = loadImage("scarpa000.png");
  scarpa001 = loadImage("scarpa001.png");
  scarpa002 = loadImage("scarpa002.png");
 
// Lancia musica di sottofondo
  //midi.trigger(); 
}

//Draw code block 
void draw () {
       
// testo fisso 
  fill(155);
  textSize(15);
  textAlign(LEFT);
  text("Type the numbers from 1 to 8 slowly and see the changes. Type 0 to reset all", 25, 30);
    
  fill(155);
  textSize(150);
  textAlign(LEFT);
 }

//Create keys trigger
void keyPressed() {
    if ( key == '0' ) background(255);
    if ( key == '1' ) image(scarpa001, -40, 185, 400, 500);
    //if ( key == '1' ) dongdong.trigger();
    //if ( key == 'a' ) image(scarpa001, -40, 185, 400, 500) + dongdong.trigger();
    if ( key == '2' ) image(scarpa002, 265, 185, 400, 500);
    // if ( key == '2' ) ohoh.trigger();
    if ( key == '3' ) image(scarpa000, 645, 170, 700, 700);
    if ( key == '3' ) hallo.trigger();
    if ( key == '3' ) text("Hallo!", 760, 125);
    if ( key == '4' ) background (0);
    if ( key == '4' ) ohoh.trigger();
    if ( key == '5' ) image(scarpa000, 645, 170, 700, 700);
   
    fill(155);
    textSize(30);
    textAlign(LEFT);
    if ( key == '6' ) text("This is a basic experiment about Processing", 30, 125);
    //if ( key == '6' ) dongdong.trigger();
    if ( key == '7' ) text("interactivity with sound and images",30, 165);
    //if ( key == '7' ) dongdong.trigger();
   
    fill(255);
    textSize(45);
    textAlign(RIGHT);
    if ( key == '8' ) text("Press .a. to see the bubbles",670, 350);
    //if ( key == '8' ) ciao.trigger();
    
    if ( key == 'a' ) background (255);
    if ( key == 'a' ) drawCircles();
    fill(155);
    textAlign(LEFT);
    if ( key == 'a' ) text("Press .a. to see other bubbles, press .b. to change",25, 690);

    if ( key == 'b' ) background (255);
    if ( key == 'b' ) drawText();
}


//Bubbles
void drawCircles() {
  for (int i=0; i<_num; i++) {
  float x = random(width);
  float y = random(height);
  float radius = random(100) + 10;
  noStroke();
  fill(random(255),random(255),random(255),50);
  ellipse(x, y, radius*2, radius*2);
  stroke(0, 150);
  ellipse(x, y, 10, 10);
  }
}


//10 Draw 1 0 numbers with different sizes and colors
void drawText() {
  for (int i = 0; i < 50; i++) {
    float x = random(1)+0.05;  
    int rx = round(x);  
    fill(random(255), random(255), random(255), random(255));
    textSize(random(320));
    textAlign(CENTER);
    text(rx, random(width), random(height));
    //noLoop();
    fill(155);
    textSize(45);
    textAlign(LEFT);
    text("Press .b. to see other numbers, press .0. to reset all",25, 690);
  }
}
    
   
   
    


