
int card = 0; 
int textX = 100;
int textY = 200;
PFont f;
PImage image1;

void setup() {
  size(600, 600);
  f = createFont("Helvetica", 30);
  textFont(f);
  image1 = loadImage("1.jpg");

}

void draw() {

  if (card == 0) {
    background(0, 0, 0);
    text(" Poem.", textX, textY);
   
  }  
  else if (card == 1) {  
    background(255,239,82);
    text("I miss You. from minji Seo", textX, textY);
  } 
  else if (card  == 2) {  
    background(255,230,75);
    text(" First I saw you in your Picture", textX, textY);
  }
  else if (card  == 3) { 
    background(255,200,90);
    text(" I was almost can't...", textX, textY);
  }
  else if (card  == 4) {  
    background(255,180,70);
    text(" Can't breathing", textX, textY);
  } 
  else if (card  == 5) {  
    background(242,177,180);
    text(" Cause you are so Beautiful..", textX, textY);
  } 
  else if (card  == 6) {  
    background(242,161,180);
    text(" Your existance make my life full.", textX, textY);
  } 
  else if (card == 7) {  
    background(236,115,158);
    text(" Thank you for your living", textX, textY);
  }
  else if (card == 8) {  
    background(218,86,130);
    text(" I love you... ", textX, textY);
  }
  else if (card == 9) {  
    background(218,50,120);
    image(image1,0,0);
    text(" I love you... ", textX, textY);
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
    card = 8;
  }
  else if (card == 8) {
    card = 9;
  }
  else if (card == 9) {
    card = 0;
  }
}
