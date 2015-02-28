

int card = 0; 
int textX = 40;
int textY =60;
PFont f; 

int x = 550;
int y = 250;
int w = 100;
int h = 50;




PImage maple;
float a = 300;
float b = 150;
float speed = 2;

void setup() {

  size(720, 400);
}

void draw() {

  if (card == 0) {
    background(20);
    f = loadFont("HelveticaNeueLT-Medium-48.vlw");
    textFont(f);
    smooth();
    fill(255);
    textSize(30);
    text(" Maple love story ",textX, 200);
  }  
  else if (card == 1) {  
    background(200);
    PImage img1;
    img1= loadImage ("124.jpg");
    image(img1,0,0,720,400);

    f = loadFont("HelveticaNeueLT-Italic-48.vlw");
    textFont(f);
    textSize(25);
    fill(0);
    text("   I'm alone.", textX, textY);


    translate(70,80);
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
    background(180);
    smooth();
    PImage img1;
    img1= loadImage ("122.jpg");
    image(img1,0,0,720,400);

    f = loadFont("HelveticaNeueLT-Italic-48.vlw");
    textFont(f);
    textSize(23);
    fill(0); 
    text("                                                           Would you like to go out with me?",textX, textY);
  



    strokeWeight(0);  
    if((mouseX > x) && (mouseX < x + w) && (y> mouseY ) && (mouseY < y+ h)) {
      fill(255,64,125,200);
    }
    else {
      fill(125,200);
    }
    rect(x,y-130,w,h);
    fill(0);
    text("Yes",x+30,y-95);




    if((mouseX > x) && (mouseX < x + w) && (mouseY>y) && (mouseY < y+ h)) {
      fill(55,89,250,200);
    }
    else {
      fill(125,200);
    }
    rect(x, y, w, h);
    fill(0);
    text("No",x+33,y+35);


    translate(70,80);
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





 translate(100,0);
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
  else if (card  == 3) { 
    smooth();
    background(150);
    PImage img1;
    img1= loadImage ("1234.jpg");
    image(img1,0,0,720,400);


    fill(0);
    text("            I'm so happy!", textX, textY);
    translate(160,80);
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


    smooth();
    background(20);

    PImage img1;
    img1= loadImage ("234.jpg");
    image(img1,0,0,720,400);
    translate(70,80);
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

    //    
    smooth();
    maple = loadImage("maple4.png");
    //background(0);
    a += speed; // Increase the value of x

    if (a >width) { // If the shape is off screen,
      b =300; // move to the left edge
    }
    smooth();
    scale(0.5);

    translate(-100,-85);
    //image 
    image(maple, a, 0);

    // reversed image 
    translate(140,55);
    rotate(PI);
  } 
  else if (card  == 5) {  
    smooth();
    background(80);
    text("Card5", textX, textY);
    PImage img1;
    img1= loadImage ("love.jpg");
    image(img1,0,0,720,400);
  } 
  else if (card  == 6) {  
    smooth();
    background(80);

    PImage img1;
    img1= loadImage ("propose.jpg");
    image(img1,0,0,720,400);  
    f = loadFont("HelveticaNeueLT-Italic-48.vlw");
    textFont(f);
    textSize(25);
    fill(255,300);
    text("                                                                Would you marry me?",textX, textY);
    stroke(0);   
    strokeWeight(1);   



    noStroke();  
    if((mouseX > x-500) && (mouseX < x-500 + w) && (y> mouseY ) && (mouseY < y+ h)) {
      fill(255,64,125,200);
    }
    else {
      fill(135,200);
    }
    rect(x-500,y-130,w,h);
    fill(0);
    text("Yes",x-470,y-95);




    if((mouseX > x-500) && (mouseX < x-500 + w) && (mouseY>y) && (mouseY < y+ h)) {
      fill(55,89,250,200);
    }
    else {
     fill(135,200);
    }
    rect(x-500, y, w, h);
    fill(0);
    text("No",x-467,y+35);
  } 
  else if (card == 7) {  
    smooth();
    background(0);
    text("Card7", textX, textY);
    PImage img1;
    img1= loadImage ("f4.jpg");
    image(img1,0,0,720,400);
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
    if((mouseX > x) && (mouseX < x + w) && (mouseY > y-150) && (mouseY < y-150+ h)) {
      card = 3;
    }
    else if((mouseX > x) && (mouseX < x + w) && (mouseY > y) && (mouseY < y+ h)) {
      card = 4;
    }
  }
  else if (card == 3) {
    card = 5;
  }  
  else if (card == 4) {
    card = 1;
  }  
  else if (card == 5) {
    card = 6;
  } 
  else if (card == 6) {
    if((mouseX > x-500) && (mouseX < x-500 + w) && (mouseY > y-150) && (mouseY < y+ h-150)) {
      card = 7;
    }
    else if((mouseX > x-500) && (mouseX < x-500 + w) && (mouseY > y) && (mouseY < y+ h)) {

      card = 4;
    }
  }
  else if (card == 7) {
    card = 7;
  }
}

void cardOne() {
}


void cardTwo() {
  /*   
   code here to draw something for the first page,  
   */
}


