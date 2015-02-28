
float x1 = 330;
float y1 = 113;
float x2 = 330;
float y2 = 113;
float x3 = 330;
float y3 = 113;
int bs = 25;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0;
PImage d;
PImage c;
PImage b;
PFont font;


void setup() {
  size (800,600);
  d = loadImage("Beemster_Wagen.gif");
  c = loadImage("Beemster_Kaart.gif");
  b = loadImage("Beemster_Logo.gif");
 // noLoop();
  smooth();
 // noStroke();
 // fill(30, 121, 173);
 // stroke(0);
  
  x1 = width/2.0;
  y1 = height/2.0;
  x2 = width/2.0;
  y2 = height/1.7;
  x3 = width/2.0;
  y3 = height/1.48;
  rectMode(RADIUS); 
  

    
}

void draw() {
    background(255);
    
     font = loadFont("Times-Italic-48.vlw"); 
    textFont(font, 23); 
    fill(29,97,43);
    text("Kaasboerderij", 15, 50);
    fill(31,120,170);
    text("Biologischeboerderij", 15, 80);      
    fill(69,29,103);
    text("Alstroemeriakwekerij", 15, 110);
    fill(220,86,30);
    text("Fruitteeltbedrijf", 15, 140);
   
    
// Test if the cursor is over the box 
  if (mouseX > x1-bs && mouseX < x1+bs && 
      mouseY > y1-bs && mouseY < y1+bs) {
        
        // Test if the cursor is over the box 
 // if (mouseX > x2-bs && mouseX < x2+bs && 
    //  mouseY > y2-bs && mouseY < y2+bs) {
    
    bover = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    bover = false;
  }
  
  
  // Draw the box
  fill(29,97,43);
  image(b, 470, 390);
  image(c, 0, 0);
  rect(x1, y1, bs, bs);
  rect(x2, y2, bs, bs);
  rect(x3, y3, bs, bs);
  image(d, 20, 440);
 

}

void mousePressed() {
  if(bover) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-x1; 
  bdify = mouseY-y1;

 // bdifx = mouseX-x2; 
 // bdify = mouseY-y2;

}

void mouseDragged() {
  if(locked) {
    x1 = mouseX-bdifx; 
    y1 = mouseY-bdify; 

   // x2 = mouseX-bdifx; 
   // y2 = mouseY-bdify; 
  }
}

void mouseReleased() {
  locked = false;
}

 



