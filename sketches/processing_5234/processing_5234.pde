
float s, targetS;
float p, targetP;
float easing = 0.0055;
int m = 305;
int y = 140;
int a = 305;
int b = 180;
float x = 0;

void setup() {
  noLoop();
  
    size(320, 480);
    frameRate(400);
    smooth();
  
}

void draw() {
    background(189, 250, 255);
  
    //head
    fill(181, 181, 181);
    ellipse(160, 160, 200, 140);
    noFill();
    
    //eyes
    fill(255);
    rect(100, 120, 120, 70);
    noFill();
    
    //pupils
    fill(0);
    ellipse(130, 155, 50, 50);
    ellipse(190, 155, 50, 50);
    noFill();
    
    //body
    fill(181, 181, 181);
    rect(120, 230, 80, 70);
    noFill();
    
    //buttons
    
    //button 1
    fill(255, 0, 0);
    targetS = dist(mouseX, mouseY, pmouseX, pmouseY) * 1.6;
    s = s + ((targetS - s) * easing);
    ellipse(150, 280, s, s);
    
    //button 2
    fill(255, 255, 0);
    targetS = dist(mouseX, mouseY, pmouseX, pmouseY) * 4;
    s = s + ((targetS - s) * easing);
    ellipse(183, 250, s, s);
    
    //button 3
    fill(0, 55, 135);
    targetS = dist(mouseX, mouseY, pmouseX, pmouseY) * 1.7;
    s = s + ((targetS - s) * easing);
    ellipse(153, 256, s, s);
    
    //button 4
    fill(139, 234, 145);
    targetS = dist(mouseX, mouseY, pmouseX, pmouseY) * 2;
    s = s + ((targetS - s) * easing);
    ellipse(170, 239, s, s);
    
    //button 5
    fill(97, 6, 127);
    targetS = dist(mouseX, mouseY, pmouseX, pmouseY) * 0.2;
    s = s + ((targetS - s) * easing);
    ellipse(193, 290, s, s);
    noFill();
    
    
    //arms
    fill(181, 181, 181);
    rect(100, 235, 20, 45);
    rect(200, 235, 20, 45);
    noFill();
    
    //hands
    fill(181, 181, 181);
    arc(108, 290, 20, 20, PI, TWO_PI-PI/45);
    arc(212, 290, 20, 20, PI, TWO_PI-PI/45);
    noFill();
    fill(189, 250, 255);
    arc(108, 290, 8, 8, PI, TWO_PI-PI/45);
    arc(212, 290, 8, 8, PI, TWO_PI-PI/45);
    noFill();
    line(98, 290, 103, 290);
    line(113, 290, 118, 290);
    line(203, 290, 208, 290);
    line(217, 290, 222, 290);
    
    //antennas
    
     fill(0);
    targetP= dist(mouseY, mouseX, mouseY, mouseX) * 3;
    p = p + (targetP - .5);
    line(mouseX, mouseY, 117, 97);
    noFill();
    
    fill(0);
    targetP = dist(mouseX, mouseY, mouseX, mouseY) * 3;
    p = p + (targetP + 3);
     line(mouseX, mouseY, 207, 97);
    noFill();
    
     fill(0);
    targetP= dist(mouseY, mouseX, mouseY, mouseX) * 3;
    p = p + (targetP - .5);
   ellipse(mouseX, mouseY, 6, 6);
    noFill();
 
    
    //Legs Movement
 
  //leg #1
   ellipse(140, 305, 25, 9);
      ellipse(y, m, 25, 9);
    m = m + 1;
    y = y + 0;
     println(frameRate);
   ellipse(140, 309, 25, 9);
   ellipse(140, 312, 25, 9);
   ellipse(140, 315, 25, 9);
   ellipse(140, 318, 25, 9);
   ellipse(140, 322, 25, 9);
   
    
    
    //leg #2
    ellipse(180, 305, 25, 9);
    ellipse(b, a, 25, 9);
    a = a + 1;
    b = b + 0;
    println(frameRate);
    ellipse(180, 309, 25, 9);
    ellipse(180, 312, 25, 9);
    ellipse(180, 315, 25, 9);
    ellipse(180, 318, 25, 9);
    ellipse(180, 322, 25, 9);
}
 
void mousePressed() {
  x += 5;
  redraw(); 
}
  

