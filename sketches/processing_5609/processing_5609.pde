
PImage bg01, bg02, bg03, bg04, bg05, bg06, bg07, bg08, bg09, d1, d2, bg10;
PFont arial;

int page = 1; // Stores the current page
int startTime = 0;
int threeSec = 3000;

float a = 0.0; //variables for moving in place
float angleInc = PI/36.00; //variables for moving in place
float scalar = 6.00; //variables for moving in place


int radius = 30;
float speed = 1.5;
float speed2 = 3.5;
int directionX = 1;
int directionY = 2;
float x = 150;
float y = 150;
float y11 =300;
float x13 =400;
//float x14 =;
//float y14 =;
float x15 =250;
float y15 =250;
float x16 =450;
float y16 =450;
float x17 =320;
float x18 =320;


void setup() {
  size(640, 480);
  arial = loadFont("Arial-BoldMT-14.vlw");
  textFont(arial);
  textAlign(CENTER);
 bg01 = loadImage("bg01.jpg");
  bg02 = loadImage("bg02.jpg");
  bg03 = loadImage("bg03.jpg");
  bg04 = loadImage("bg04.jpg");
  bg05 = loadImage("bg05.jpg");
  bg06 = loadImage("bg06.jpg");
  bg07 = loadImage("bg07.jpg");
  bg08 = loadImage("bg08.jpg");
  bg09 = loadImage("bg09.jpg");
  bg10 = loadImage("donuts.jpg");
  d1 = loadImage("rldonut01b.png");
  d2 = loadImage("rldonut02b.png");
  smooth();
  fill(0);
  startTime = millis();
}

void draw() {
  // Page 1: donut on floor 
  //background(104); //make sure to have this to 'draw' over previous page
  
  if (page == 1) {
   background(bg01);
    //image(d1,400,300+s); 
    float s = sin(a) * scalar;
  a = a + angleInc;
      image(d1,400,300+s); 
    imageMode(CENTER);
    if (millis() > threeSec){
      fill(#C10606);
    text("Help this donut get back to its box", width/2, height/2-200);
    text("Climb up the counter (click here)", width/4, (height/2)-160);
    text("Wait for someone(click here)", width/1.3, (height/2)-160);
  }
  startTime = millis();
  }
  
  // Page 2: fryer in the way (from p.1)
  else if (page == 2){
    background(bg02);
        float s = sin(a) * scalar;
  a = a + angleInc;
    image(d1,100, 200+s);
    imageMode(CENTER);
    text("You've come across a pot of bubbling oil", width/2, height/2-200);
    text("Find another way around(click here)", width/4, (height/2)-160);
    text("Jump across (click here)", width/1.3, (height/2)-160);
  }
  
  // Page 3: waiting for donut man (from p.1)
  else if (page == 3){
     background(bg01);
         float s = sin(a) * scalar;
  a = a + angleInc;
        image(d1,400,300+s);
    imageMode(CENTER);
  text("waiting for donut man...", width/2, height/2-200);
  if (millis() > startTime + threeSec){
    text("Climb up the counter now(click here)", width/4, (height/2)-160);
    text("Move a bit forward(click here)", width/1.3, (height/2)-160);
    }
  }
  
  //Page 4: see the boss (from p.3)
  else if (page == 4){
    background(bg05);
        float s = sin(a) * scalar;
  a = a + angleInc;
            image(d1,400,300+s);
    imageMode(CENTER);
  text("That person might help!", width/2, height/2-200);
  text("Get his attention(click here)", width/2, (height/2)-160);
  startTime = millis();
  }
  
  //Page 5: avoid kid(from p. 2)
  else if (page == 5){
    background(bg03);
        float s = sin(a) * scalar;
  a = a + angleInc;
    image(d1, width/2, height/2+100+s);
    imageMode(CENTER);
  text("Watch out for that hungry kid!", width/2, height/2+200);
  text("move to the left(click here)", width/4, (height/2)+220);
  text("Move to the right(click here)", width/1.3, (height/2)+220);
  startTime = millis();
  }
  
  //Page 6: fall in oil (from p.2)
  else if (page == 6){
 background(bg04);
 
    image(d2, x,y);
    imageMode(CENTER); //donut floating in oil animation
  x = x + speed * directionX;
  y = y + speed * directionY;
  if ((x > width-radius) || (x < radius)){
    directionX = directionX * -1;
  }
  if ((y > height-radius) || (y < radius)){
    directionY = directionY * -1;}
  text("You've fallen into the oil", width/2, height/2);
  text("Click here to play again", width/2, (height/2)+60);
  }
  
  //Page 8: Bite (from p.5)
  else if (page == 8){
    background(bg08);
      if (millis() > startTime + threeSec){
      background(bg07);
          float s = sin(a) * scalar;
  a = a + angleInc;
      image(d2, width/2, (height/2)+100+s);
      imageMode(CENTER);
  text("The kid took a bite out of you", width/2, (height/2)+200);
  text("Click to play again", width/2, (height/2)+220);}
  }
  
  //Page 7: stepped on(from p.4)
  else if (page == 7){
    background(bg09);
    if (millis() > startTime + threeSec){
      background(bg01);
          float s = sin(a) * scalar;
  a = a + angleInc;
      image(d2, width/2, height/2+2);
      imageMode(CENTER);
  text("A smashed donut is no good.", width/2, height/2-200);
  text("Click here to play again", width/2, (height/2)-160);}
  }
  
  //Page 9: roll out of reach (from p.5)
  else if (page == 9){
    background(bg10);
        float s = sin(a) * scalar;
  a = a + angleInc;
        image(d1, width/2, height/2+s);
    imageMode(CENTER);
  text("Whew that was close", width/2, height/2+100);
  text("miraculously, you've rolled into the donut box", width/2, height/2+130);
  text("HOORAY", width/2, (height/2)+150);
  }
  
  //Page 10: display case (from p.9)
  //else if (page == 10){
 // text("miraculously, you've rolled into the display case", width/2, height/2);
//text("hooray", width/2, (height/2)+60);
 // }

  
}//end draw  

void mousePressed() {
   if (page == 1){
     if (mouseX<width/2) {
      page = 2; //on p. 1 if mouse clicked on left side, page is set to 2
     // startTime = millis();
       }
   else { //otherwise, page is set to 3
      page = 3;
     }
   }//end if
   
   else if (page == 3){
     if (mouseX < width/2) {
       page = 2; //on p.3 if mouse clicked left, page is set to 2
     }
     else {
       page = 4; //otherwise, page is set to 4
     }
   }//end else-if  
   
   else if (page ==4){
     if (mousePressed){
       page = 7;
     }
   }// end else-if
   
   else if (page == 7){
     if (mousePressed){
       page = 1;
     }
   }// end else-if
   
   else if (page == 2){
     if (mouseX < width/2){
       page = 5; //on p.2 if mouse clicked left, page is set to 5
     }
     else {
       page = 6; //otherwise, page is set to 6
     }
   }// end else-if
   
   else if (page == 6){
     if (mousePressed){
       page = 1;
     }
   }// end else-if
   
   else if (page == 5) {
     if (mouseX < width/2) {
       page = 8;
     }
     else {
       page = 9;
     }
   }// end else-if
   
   else if (page == 8){
     if (mousePressed){
       page = 1;
     }
   }// end else-if

   
}//end mousePressed

