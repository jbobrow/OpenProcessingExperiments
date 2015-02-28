
//Nick Myette
//Project 2: Avatar
//IXD Winter 2011

// AngryMonkey Update. He keeps warning you but if you push 
// him too far, he might turn supersayin... and you don't want that.

int sizeCap = 200;    // maximum value for canvas / sizes
int colorCap = 255;   // maximum value for colors

int eyeColor;        // every click makes monkeys eyes more red
int eyebrow;         // moves eyebrows
int stopEyebrow;     // stops movement of eyebrows
int angry;           // monkey yells at the user

void setup() {
  size(sizeCap, sizeCap);
  colorMode(RGB, colorCap);
  background(colorCap - 165, colorCap - 55, colorCap - 55);
  frameRate(10);
  eyebrow = height/2 - height/5; // initial position of eyebrows
}

void draw() {
  noStroke();
  smooth();
  /*monkey*/
  
  //brown body
  fill(colorCap - 105, colorCap - 195, colorCap - colorCap); //brown
  rectMode(CENTER);
  rect(width - width/2, height, width/2, height/2);
  rect(width/2, height - height/4, width/4, height/2);
  
  //ears
  fill(colorCap, colorCap - 65, colorCap - 245);             //yellow
  ellipse(width/2 - width/4, height/2, width/3, height/3);
  ellipse(width/2 + width/4, height/2, width/3, height/3);
  fill(colorCap, colorCap - 30, colorCap - colorCap);        //light yellow
 // tint(50, 99, 99);
  ellipse(width/2 - width/4, height/2, width/5, height/5);
  ellipse(width/2 + width/4, height/2, width/5, height/5);
  
  //head
  fill(colorCap - 105, colorCap - 195, colorCap - colorCap);
  ellipse(width/2, height/2, width/2, height/2);
  
  //mouth (ellipse)  
  fill(colorCap, colorCap - 65, colorCap - 245);       
  ellipse(width/2, height/2 + height/10, width/3, height/3);
  
  //eyes
  fill(eyeColor, colorCap - colorCap, colorCap - colorCap);
  ellipse(width/2 - width/15, height/2 - height/8, width/20, height/10);
  ellipse(width/2 + width/15, height/2 - height/8, width/20, height/10);
  fill(colorCap);
  ellipse(width/2 - width/15 - width/40 + (mouseX/20), height/2 - height/8 - height/40 + (mouseY/20), width/40, height/20);
  ellipse(width/2 + width/15 - width/40 + (mouseX/20), height/2 - height/8 - height/40 + (mouseY/20), width/40, height/20);
  
  //mouth (line)
  strokeWeight(width/100);
  stroke(colorCap-colorCap);
  fill(colorCap-colorCap);
  line(width/2 - width/10, height/2 + height/10, width/2 + width/10, height/2 + height/10);
  
  //eyebrows move
  if (angry <= 10) {
    line(width/2 - width/10, height/2 - height/5, width/2, eyebrow);
    line(width/2, eyebrow, width/2 + width/10, height/2 - height/5);
    stopEyebrow = eyebrow;

  }else {
    line(width/2 - width/10, height/2 - height/5, width/2, stopEyebrow);
    line(width/2, stopEyebrow, width/2 + width/10, height/2 - height/5);
  }

  if (angry >= 36 && angry < 37) { // super saiyin
    noStroke();
    fill(colorCap, colorCap - colorCap, colorCap - colorCap);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
    stroke(colorCap, colorCap - 30, colorCap - colorCap);
        for (int i = 0; i < 50; i++) {
      line(width/2, height/3, random(width), random(height));
    }
  }else if (angry >= 37) { // start over again
    eyeColor = 0;
    eyebrow = height/2 - height/5;
    angry = 0;
    background(colorCap - 165, colorCap - 55, colorCap - 55);
  }
}
  
 void mousePressed() {
   noStroke();
   eyeColor = constrain(eyeColor + 10, colorCap - colorCap, colorCap);
   eyebrow++;
   angry++;
  
  // monkey yells
    if (angry > 10 && angry < 12) {
    println("Hey! Cut that out!");
    fill(colorCap, colorCap - colorCap, colorCap - colorCap);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
 }else if (angry > 20 && angry < 22) {
    println("Like srsly! QUIT IT!");
    fill(colorCap, colorCap - colorCap, colorCap - colorCap);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
 }else if (angry > 30 && angry <32) {
    println();
    println("ALRIGHT I'VE HAD IT!");
    fill(colorCap, colorCap - colorCap, colorCap - colorCap);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
 }else if (angry == 32) {
    println("KA");
    fill(colorCap, colorCap - colorCap, colorCap - colorCap);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
 }else if (angry == 33) {
    println("ME");
    fill(colorCap, colorCap - colorCap, colorCap - colorCap);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
 }else if (angry == 34) {
    println("HA");
    fill(255, 0, 0);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
 }else if (angry == 35) {
    println("ME");
    fill(colorCap, colorCap - colorCap, colorCap - colorCap);
    ellipse(width/2, height/2 + height/10, width/3, height/5);
 }else if (angry == 36) {
    println("HAAAAAAAAAAAAAAAAAAAAAAAAAA!!!!!!!!");
  }

  //bugs
  stroke(0);
  line(mouseX, mouseY, mouseX - 3, mouseY + 3);
  line(mouseX, mouseY, mouseX + 3, mouseY + 3);
  noStroke();
  fill(colorCap - colorCap);
  ellipse(mouseX, mouseY, width - width + 10, height - height + 5);
  fill(colorCap);
  ellipse(mouseX + 5, mouseY - 3, width - width + 15, height - height + 5); 
 } 
                
