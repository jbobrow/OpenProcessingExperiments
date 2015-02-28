

int card = 0; 
int textX = 40;
int textY =80;
PFont f; 

void setup() {
  size(720, 400);
  f = loadFont("HelveticaNeueCE-Light-48.vlw");
  textFont(f);
}

void draw() {

  if (card == 0) {
    background(30);
    fill(255);
    smooth();
    textSize(35);
    text("Love is...",textX, textY);
    /*   
     code here to draw something for the first page,     
     or create page funtions such as 
     cardOne();
     */
  }  
  else if (card == 1) {  
    background(35);
    text("A", textX, textY);


    translate(90,80);
    scale(2);

    stroke(255,47,5);
    strokeWeight(5);
    fill(255,47,5);

    quad(70,10,80,35,70,60,60,33);
    quad(22,42,45,42,70,60,37,60);
    quad(45,70,70,60,55,83,35,90);
    quad(94,40,111,40,98,55,70,60);
    quad(70,60,93,69,100,88,82,81);

    strokeWeight(0);
    fill(0,221);
    ellipse(67,58,3,1);
    ellipse(73,58,3,1);
    strokeWeight(0);
    fill(255,3,61,210);
    ellipse(63,61,5,4);  
    ellipse(77,61,5,4);

    strokeWeight(2);   
    fill(255,47,5);
    rect(69,60,1,60);
    stroke(0,113);
    strokeWeight(1);   
    line(68,63,72,63);
  } 
  else if (card  == 2) {  
    background(120);
    text("A", textX, textY);
    fill(255);
    text("   +", textX, textY);
    fill(255,167,3);
    text("      B", textX, textY);
    translate(90,80);
    scale(2);
    stroke(255,47,5);
    strokeWeight(5);
    fill(255,47,5);
    quad(70,10,80,35,70,60,60,33);
    quad(22,42,45,42,70,60,37,60);
    quad(45,70,70,60,55,83,35,90);
    quad(94,40,111,40,98,55,70,60);
    quad(70,60,93,69,100,88,82,81);
    strokeWeight(0);
    fill(0,221);
    ellipse(67,58,3,2);
    ellipse(73,58,3,2);
    strokeWeight(0);
    fill(255,3,61,210);
    ellipse(63,61,4,4);  
    ellipse(77,61,4,4);

    strokeWeight(3);   
    fill(255,47,5);
    rect(69,60,1,60);
    stroke(0,113);
    strokeWeight(1);   
    line(69,63,71,63);



    //2

    translate(150,0);
    stroke(255,167,3);
    strokeWeight(5);
    fill(255,167,3);
    quad(58,13,70,39,68,74,26,39);
    quad(82,13,114,39,72,74,72,39);
    strokeWeight(3);
    rect(69,60,1,60);
    strokeWeight(0);
    fill(0,221);
    ellipse(67,50,3,2);
    ellipse(73,50,3,2);
    strokeWeight(0);
    fill(255,3,91,70);
    ellipse(63,53,4,4);  
    ellipse(77,53,4,4);


    strokeWeight(3);   
    fill(255,47,5);
    rect(69,60,1,60);
    stroke(0,123);
    strokeWeight(1);   
    line(68,55,72,55);
  }
  else if (card  == 3) { 
    background(200);
    text("A", textX, textY);
    fill(255);
    text("   +", textX, textY);
    fill(255,167,3);
    text("      B", textX, textY);
    translate(180,80);
    scale(2);
    stroke(255,47,5);
    strokeWeight(5);
    fill(255,47,5);
    quad(70,10,80,35,70,60,60,33);
    quad(22,42,45,42,70,60,37,60);
    quad(45,70,70,60,55,83,35,90);
    quad(94,40,111,40,98,55,70,60);
    quad(70,60,93,69,100,88,82,81);
    strokeWeight(0);
    fill(0,221);
    ellipse(66,58,2,4);
    ellipse(73,58,2,4);
    strokeWeight(0);
    fill(255,3,61,250);
    ellipse(61,61,5,5);  
    ellipse(77,61,5,5);

    strokeWeight(3);   
    fill(255,0,0);
    rect(69,60,1,60);
    stroke(255,0,0,233);
    strokeWeight(4);   
    line(69,63,70,63);
    //2

    translate(80,0);
    stroke(255,167,3);
    strokeWeight(5);
    fill(255,167,3);
    quad(58,13,70,39,68,74,26,39);
    quad(82,13,114,39,72,74,72,39);
    strokeWeight(3);
    rect(69,60,1,60);
    strokeWeight(0);   
    fill(0,221);
    ellipse(67,50,2,4);
    ellipse(73,50,2,4);
    strokeWeight(0);
    fill(255,3,91,70);
    ellipse(62,53,5,5);  
    ellipse(78,53,5,5);


    strokeWeight(3);   
    fill(255,47,5);
    rect(69,60,1,60);
    stroke(255,0,0,170);
    strokeWeight(6);   
    line(70,56,70,56);
  }
  else if (card  == 4) {  
    background(120);




    PImage img1;
    img1= loadImage ("f1.jpg");
    image(img1,0,0,width,height);  
    fill(255,47,5);
    text("A", textX, textY);
    fill(255);
    text("   +", textX, textY);
    fill(255,167,3);
    text("      B", textX, textY);
  } 
  else if (card  == 5) {  
    background(80);

    PImage img1;
    img1= loadImage ("f2.jpg");
    image(img1,0,0,720,400);  
    fill(255,47,5);
    text("A", textX, textY);
    fill(0);
    text("   +", textX, textY);
    fill(255,167,3);
    text("      B", textX, textY);
  } 
  else if (card  == 6) {  
    background(40);

    PImage img1;
    img1= loadImage ("f3.jpg");
    image(img1,0,0,width,height);  
    fill(255,47,5);
    text("A", textX, textY);
    fill(0);
    text("   +", textX, textY);
    fill(255,167,3);
    text("      B", textX, textY);
  } 
  else if (card == 7) {  
    background(0);


    PImage img1;
    img1= loadImage ("f4.jpg");
    image(img1,0,0,width,height);  
    fill(255,47,5);
    text("A", textX, textY);
    fill(0);
    text("   +", textX, textY);
    fill(255,167,3);
    text("      B", textX, textY);
    fill(0);
    text("          =", textX, textY);
    fill(162,242,27);
    text("             C", textX, textY);
  }
}


void mousePressed() {  

  if (card == 0) {  
    card = 1;
  } 
  else if (card == 1) {  
    card = 2;
  }
  else if (card == 2) {
    card = 3;
  }
  else if (card == 3) {
    card = 4;
  }  
  else if (card == 4) {
    card = 5;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    card = 7;
  }
  else if (card == 7) {
    card = 0;
  }
}

void cardOne() {
  /*   
   code here to draw something for the first page,  
   */
}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
}


